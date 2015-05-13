# rack_user-cookbook

The Rackspace rack_user cookbook provides resource primitives (LWRPs) for use in recipes.
The goal is to offer a resource to add a rack user with a list of authorized keys and sudo access.
Currently it only supports to get keys from a remote file, but it might be extended later.

## Supported Platforms

* Centos 6.5
* Ubuntu 12.04
* Ubuntu 14.04

## Usage

Place a dependency on the rack_user cookbook in your cookbook's metadata.rb
```
depends 'rack_user'
```
Then, in a recipe:

```
rack_user 'default' do
  action :create
end
```

## Resources

### rack_user
The `rack_user` resource creates a `rack` user with a list of authorized keys.

#### Parameters

* `location` - Where do get the authorized key file, default to https://raw.github.com/rackops/authorized_keys/master/authorized_keys'

#### Actions

* `:create` - Create the `rack` user
* `:remove` - remove the `rack` user

### Examples
#### Create the user with an authorized key file from a gist
```
rack_user 'default' do
  location 'https://gist.githubusercontent.com/jujugrrr/af613872c3d029a94c88/raw/1d57582215ac6316f55b956691db1dba8339fcdd/test'
end
```
#### Remove the user

```
rack_user 'default' do
  action :remove
end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Julien Berard (jujugrrr@gmail.com)
