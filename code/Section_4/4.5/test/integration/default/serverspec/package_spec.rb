require 'serverspec'

if os[:family] == 'redhat'
  describe package('httpd') do
    it { should be_installed }
  end
end

if os[:family] == 'ubuntu'
  describe package('apache2') do
    it { should be_installed }
  end
end
