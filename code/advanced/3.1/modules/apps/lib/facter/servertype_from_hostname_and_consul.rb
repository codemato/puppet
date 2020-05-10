require 'socket'
require 'json'

Facter.add(:servertype, :type => :aggregate) do
  chunk(:get_name_based_role) do
    hostname = Socket.gethostname
    role = hostname.split("-").first
    srv_type = "#{role}server"
  end

  chunk(:get_service_based_role) do
    consul_data = JSON.parse(File.read('/etc/consul/config.json'))
    consul_server = consul_data["server"]
    consul_role = ""

    if consul_server
      consul_role = "server"
    else
      consul_role = "agent"
    end

    role = "consul_#{consul_role}"
  end

  aggregate do |chunks|
    fact_data = Array.new

    chunks.each_value do |value|
      fact_data.push(value)
    end

    fact_data
  end
end
