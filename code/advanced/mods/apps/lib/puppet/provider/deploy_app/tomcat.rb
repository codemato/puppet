Puppet::Type.type(:deploy_app).provide(:tomcat) do
  confine :servertype => :appserver
  defaultfor :servertype => :appserver

  commands :git => "git"
  commands :mkdir => "mkdir"
  commands :rm => "rm"
  commands :cp => "cp"

  def exists?
    Puppet.info("Checking if app is already deployed")
    deploy_file = "#{resource[:install_location]}/webapps/#{resource[:source_war]}"

    File.exists?(deploy_file)
  end

  def create
    Puppet.info("Deploying the application")
    deploy_file = "#{resource[:install_location]}/webapps/#{resource[:source_war]}"
    temp_dir = "/tmp/#{resource[:name]}"
    temp_war = "/tmp/#{resource[:name]}/#{resource[:source_war]}"
    mkdir('-p', temp_dir)
    git('clone', resource[:deploy_source], temp_dir)
    cp('-r', temp_war, deploy_file)
    rm('-rf', temp_dir)
  end

  def destroy
    Puppet.info("Removing the application")
    appname = File.basename(resource[:source_war], '.war')
    app_files = "#{resource[:install_location]}/webapps/#{appname}*"
    rm('-rf', app_files)
  end

end
