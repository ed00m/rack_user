require_relative 'spec_helper'

describe 'rack_user on Ubuntu 12.04' do
  before do
    stub_resources
  end

  UBUNTU_1204_OPTS = {
    log_level: LOG_LEVEL,
    platform: 'ubuntu',
    version: '12.04',
    step_into: ['rack_user']
  }.freeze

  context 'when calling the rack resource with :create' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU_1204_OPTS) do |node|
        node_resources(node)
      end.converge('rack_user_test::create')
    end
    it_behaves_like 'create the rack user'
  end

  context 'when calling the rack resource with :create and passwd_enable' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rack_user_test::create_with_password')
    end
    it_behaves_like 'create the rack user with passwd_enable'
  end

  context 'when calling the rack resource with :remove' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU_1204_OPTS) do |node|
        node_resources(node)
      end.converge('rack_user_test::remove')
    end
    it_behaves_like 'remove the rack user'
  end
end
