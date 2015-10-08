shared_examples_for 'create the rack user' do
  it 'creates a user rack with the correct keys' do
    # does not step into provider, so ssh_keys is nil
    expect(chef_run).to create_rack_user('default').with(ssh_keys: nil, passwd_enable: false)
    expect(chef_run).to install_sudo('rack').with(user: 'rack', nopasswd: true)
  end
end

shared_examples_for 'remove the rack user' do
  it 'removes the rack user' do
    expect(chef_run).to remove_user_account('rack')
  end
end
