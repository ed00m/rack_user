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

        ssh_authorized_keys_data = fetch_url(new_resource.location)
        if !ssh_authorized_keys_data || ssh_authorized_keys_data.empty?
          fail "#{new_resource.location} returned an empty file. This seems wrong."
        end

        key_array = []
        pattern = /^ssh-rsa/
        ssh_authorized_keys_data.lines.each do |line|
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
