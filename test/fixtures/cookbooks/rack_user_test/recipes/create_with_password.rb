# comments!

# password is 'bleh'
user 'rack' do
  password '$6$OQJ5LD0gU3DRPz9I$esr7BcUV2l2pYXSFcA2SH6Jxi4Qqk61qAWbVN4dfUBNAy3WqSW2XQ/4xJfX.YcJ5Li4BVv9heLKHqGveheF2w/'
  action :create
end

rack_user 'default' do
  location 'https://gist.github.com/martinb3/14595e35648f5a822073/raw/2b47d52524a0c60a024e8cf4ccdd47b516d56cb0/test-authorized-keys'
  passwd_enable true
  action :create
end
