require 'spec_helper'

if os[:family] == 'redhat'
  describe service('httpd') do
    it { should be_enabled }
    it { should be_running.under('systemd') }
  end

  describe port(80) do
    it { should be_listening }
  end
end

if os[:family] == 'ubuntu'
  describe service('apache2') do
    it { should be_enabled }
    it { should be_running.under('systemd') }
  end

  describe port(80) do
    it { should be_listening }
  end
end
