# Encoding: utf-8

require_relative 'spec_helper'

describe user('rack') do
  context 'when the user has been removed' do
    it { is_expected.to_not exist }
  end
  context 'when the authorized key has been removed' do
    # rubocop:disable LineLength
    it { is_expected.to_not have_authorized_key('ssh-rsa ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGH foo@bar.local') }
    # rubocop:enable LineLength
  end
end

describe file('/etc/sudoers.d/rack') do
  context 'when the rack user\'s sudo permissions have been revoked' do
    it { is_expected.to_not be_file }
  end
end
