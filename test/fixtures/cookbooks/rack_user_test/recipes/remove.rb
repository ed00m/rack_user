# comments!

user 'rack' do
  password '*'
  action :create
end

rack_user 'default' do
  action :remove
end
