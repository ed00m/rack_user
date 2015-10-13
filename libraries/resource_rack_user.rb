require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # Resource definition for rack_user_service
    class RackUser < Chef::Resource::LWRPBase
      self.resource_name = :rack_user
      actions :create, :remove
      default_action :create

      attribute :location, kind_of: String, default: 'https://raw.github.com/rackops/authorized_keys/master/authorized_keys'
      attribute :passwd_enable, kind_of: [TrueClass, FalseClass], default: false
    end
  end
end
