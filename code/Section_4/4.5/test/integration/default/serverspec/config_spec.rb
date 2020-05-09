require 'spec_helper'

if os[:family] == 'redhat'
  describe file('/etc/httpd/conf/httpd.conf') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_readable }
  end

  describe file('/etc/httpd/conf.d/vhost.conf') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_readable }
  end
end

if os[:family] == 'ubuntu'
  describe file('/etc/apache2/apache2.conf') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_readable }
  end

  describe file('/etc/apache2/sites-enabled/vhost.conf') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_readable }
  end
end
