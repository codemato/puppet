require "socket"

Puppet::Functions.create_function(:'metricbeat::check_elastic') do
    def check_elastic( ip_address )
        port = "9200"
        begin
            TCPSocket.new(ip_address, port).close
            return true
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, SocketError
            return false
        end
    end
end
