shared_examples_for 'create the rack user' do
  it 'includes recipes sudo and user' do
    expect(chef_run).to include_recipe('sudo')
    expect(chef_run).to include_recipe('user')
  end

  it 'creates a user rack with the correct keys' do
    # does not step into provider, so ssh_keys is nil
    expect(chef_run).to create_rack_user('default').with(ssh_keys: nil)
    expect(chef_run).to install_sudo('rack').with(user: 'rack', nopasswd: true)
    expect(chef_run).to include_recipe('user')
  end
end

shared_examples_for 'remove the rack user' do
  it 'removes the rack user' do
    expect(chef_run).to remove_user_account('rack')
  end
end
