require "net/http"

Puppet::Functions.create_function(:'apps::check_site') do
    def check_site( ip_address, app_name )
        url = URI.parse("http://#{ip_address}/apps/#{app_name}/")
        req = Net::HTTP.new(url.host, url.port)
        res = req.request_head(url.path)
        if res.code == "200"
            return true
        else
            return false
        end
    end
end
