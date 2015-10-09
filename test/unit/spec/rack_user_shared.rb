shared_examples_for 'create the rack user' do
  it 'creates a user rack with the correct keys' do
    # does not step into provider, so ssh_keys is nil
    expect(chef_run).to create_rack_user('default').with(ssh_keys: nil, passwd_enable: false)
    expect(chef_run).to install_sudo('rack').with(user: 'rack', nopasswd: true)
  end
end

shared_examples_for 'create the rack user with passwd_enable' do
  it 'creates a rack user' do
    expect(chef_run).to create_user('rack').with(password: '$6$OQJ5LD0gU3DRPz9I$esr7BcUV2l2pYXSFcA2SH6Jxi4Qqk61qAWbVN4dfUBNAy3WqSW2XQ/4xJfX.YcJ5Li4BVv9heLKHqGveheF2w/')
  end
  it 'creates a user rack with the correct keys' do
    # does not step into provider, so ssh_keys is nil
    expect(chef_run).to create_rack_user('default').with(ssh_keys: nil, passwd_enable: true)
    expect(chef_run).to install_sudo('rack').with(user: 'rack', nopasswd: true)
  end
end

shared_examples_for 'remove the rack user' do
  it 'creates a rack user' do
    expect(chef_run).to create_user('rack').with(password: '*')
  end
  it 'removes the rack user' do
    expect(chef_run).to remove_user_account('rack')
  end
end
