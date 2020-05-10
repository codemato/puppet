if Facter.value(:servertype).include? 'webserver'
  Facter.add('appname') do
    setcode do
      app_name = Dir.entries("/var/www/html/apps/").select {|f| !File.directory? f}
    end
  end
end
