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
      end

      action :delete do
      end

    end
  end
end
