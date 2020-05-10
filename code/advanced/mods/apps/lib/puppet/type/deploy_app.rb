Puppet::Type.newtype(:deploy_app) do
  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name, :namevar => true) do
  end

  newparam(:install_location) do
  end

  newparam(:deploy_type) do
    defaultto 'git'
  end

  newparam(:deploy_source) do
  end

  newparam(:source_war) do
    defaultto 'app.war'
  end
end
