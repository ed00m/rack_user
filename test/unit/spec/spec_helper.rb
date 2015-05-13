require 'chefspec'
require 'chefspec/berkshelf'
require_relative 'rack_user_shared'

::LOG_LEVEL = ENV['CHEFSPEC_LOG_LEVEL'] ? ENV['CHEFSPEC_LOG_LEVEL'].to_sym : :fatal

def stub_resources
  stub_command('which sudo').and_return(true)
  allow(File).to receive(:size?).with('/etc/rackspace-monitoring-agent.cfg').and_return(nil)
end

def node_resources(_node)
end

at_exit { ChefSpec::Coverage.report! }
