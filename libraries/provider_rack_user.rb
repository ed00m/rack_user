require 'chef/resource/lwrp_base'

class Chef
  class Provider
    # Provider definition for rack_user_service
    class RackUser < Chef::Provider::LWRPBase
      include RackUserCookbook::Helpers

      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        node.default['authorization']['sudo']['include_sudoers_d'] = true
        run_context.include_recipe 'sudo'
        run_context.include_recipe 'user'

        remote_file 'authorized_keys' do
          path "#{Chef::Config[:file_cache_path]}/authorized_keys"
          source new_resource.location
          owner 'root'
          group 'root'
          mode 0644
          use_conditional_get true
          use_etag true
          use_last_modified false
          notifies :create, 'ruby_block[put_auth_keys_into_array]', :immediately
        end

        # Required to be sure it's run after the remote_file
        ruby_block 'put_auth_keys_into_array' do
          block do
            key_array = []
            pattern = /^ssh-rsa/
            ::File.readlines("#{Chef::Config[:file_cache_path]}/authorized_keys").each do |line|
              if pattern =~ line
                key_array.push(line)
              end
            end
            user_account 'rack' do
              comment 'Rackspace User'
              home '/home/rack'
              ssh_keys key_array
              action :create
            end
          end
          action :nothing
        end

        sudo 'rack' do
          user 'rack'
          nopasswd true
        end
      end

      action :remove do
        user_account 'rack' do
          action :remove
        end
        sudo 'rack' do
          user 'rack'
          nopasswd true
          action :remove
        end
      end
    end
  end
end
