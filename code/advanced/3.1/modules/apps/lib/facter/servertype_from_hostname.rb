require 'socket'

Facter.add(:servertype) do
  setcode do
    srv_type = Array.new
    hostname = Socket.gethostname
    role = hostname.split("-").first
    srv_type.push("#{role}server")
	srv_type
  end
end
