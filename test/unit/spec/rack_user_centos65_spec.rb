require_relative 'spec_helper'

describe 'rack_user on Centos 6.6' do
  before do
    stub_resources
  end

  CENTOS_OPTS = {
    log_level: LOG_LEVEL,
    platform: 'centos',
    version: '6.6',
    step_into: ['rack_user']
  }

  context 'when calling the rack resource with :create' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rack_user_test::create')
    end

    it_behaves_like 'create the rack user'
  end

  context 'when calling the rack resource with :remove' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rack_user_test::remove')
    end
    it_behaves_like 'remove the rack user'
  end
end
