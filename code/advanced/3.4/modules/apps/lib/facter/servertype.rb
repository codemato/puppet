require 'socket'

Facter.add(:servertype) do
  setcode do
    hostname = Socket.gethostname
    role = hostname.split("-").first
    srv_type = "#{role}server"
  end
end
