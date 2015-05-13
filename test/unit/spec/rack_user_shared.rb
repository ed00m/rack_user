shared_examples_for 'create the rack user' do
  it 'downloads the authorized keys' do
    expect(chef_run.remote_file('authorized_keys')).to notify('ruby_block[put_auth_keys_into_array]').to(:create).immediately
    expect(chef_run).to create_remote_file('authorized_keys')
  end

  it 'includes recipes sudo and user' do
    expect(chef_run).to include_recipe('sudo')
    expect(chef_run).to include_recipe('user')
  end

  it 'creates a user rack with the correct keys' do
    # ssh keys aren't set at this point
    expect(chef_run).to create_rack_user('default').with(ssh_keys: nil)

    expect(chef_run.ruby_block('put_auth_keys_into_array')).to do_nothing
    expect(chef_run).to install_sudo('rack').with(user: 'rack', nopasswd: true)
    expect(chef_run).to include_recipe('user')
  end
end

shared_examples_for 'remove the rack user' do
  it 'removes the rack user' do
    expect(chef_run).to remove_user_account('rack')
  end
end
