require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # Resource definition for rack_user_service
    class RackUser < Chef::Resource::LWRPBase
      self.resource_name = :rack_user
      actions :create, :delete
      default_action :create
    end
  end
end
