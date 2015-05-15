shared_examples_for 'create the rack user' do
  it 'includes recipes sudo and user' do
    expect(chef_run).to include_recipe('sudo')
    expect(chef_run).to include_recipe('user')
  end

  it 'creates a user rack with the correct keys' do
    expect(chef_run).to create_rack_user('default')
    expect(chef_run).to create_user_account('rack')
    expect(chef_run).to install_sudo('rack').with(user: 'rack', nopasswd: true)
  end
end

shared_examples_for 'remove the rack user' do
  it 'removes the rack user' do
    expect(chef_run).to remove_user_account('rack')
    expect(chef_run).to remove_sudo('rack')
  end
end
