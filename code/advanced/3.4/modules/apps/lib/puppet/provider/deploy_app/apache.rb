Puppet::Type.type(:deploy_app).provide(:apache) do
  confine :servertype => :webserver
  defaultfor :servertype => :webserver

  commands :git => "git"
  commands :mkdir => "mkdir"
  commands :rm => "rm"

  def exists?
    Puppet.info("Checking if app is already deployed")
    deploy_dir = "#{resource[:install_location]}/#{resource[:name]}"

    File.directory?(deploy_dir) and Dir.entries(deploy_dir).size > 2
  end

  def create
    Puppet.info("Deploying the application")
    deploy_dir = "#{resource[:install_location]}/#{resource[:name]}"
    mkdir('-p', deploy_dir)
    git('clone', resource[:deploy_source], deploy_dir)
  end

  def destroy
    Puppet.info("Removing the application")
    deploy_dir = "#{resource[:install_location]}/#{resource[:name]}"
    rm('-rf', deploy_dir)
  end

end
