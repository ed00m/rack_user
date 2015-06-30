# Encoding: utf-8

require_relative 'spec_helper'

describe user('rack') do
  it 'does not exist' do
    expect(subject).to_not exist
  end
  it 'does not have authorized key' do
    # rubocop:disable LineLength
    expect(subject).to_not have_authorized_key('ssh-rsa ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGH foo@bar.local')
    # rubocop:enable LineLength
  end
end

describe file('/etc/sudoers.d/rack') do
  it 'does not exist' do
    expect(subject).to_not be_file
  end
end
