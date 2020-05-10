require 'json'

Facter.add(:servertype) do
  setcode do
    srv_type = Array.new
    consul_data = JSON.parse(File.read('/etc/consul/config.json'))
    consul_server = consul_data["server"]
    consul_role = ""

    if consul_server
      consul_role = "server"
    else
      consul_role = "agent"
    end

    srv_type.push("consul_#{consul_role}")
	srv_type
  end
end
