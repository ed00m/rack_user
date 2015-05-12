if defined?(ChefSpec)
  def create_rack_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:rack_user, :create, resource_name)
  end

  def delete_rack_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:rack_user, :delete, resource_name)
  end
end
