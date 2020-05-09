require 'spec_helper'

describe 'apache::config' do
  context 'apache config on RedHat systems' do
    let(:facts) { { :osfamily => 'RedHat' } }
    hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')

    apacheconfigfile = hiera.lookup('apache.configfile', nil, { '::osfamily' => 'RedHat' })
    apacheconfigsource = hiera.lookup('apache.configsource', nil, { '::osfamily' => 'RedHat' })
    apachevhostfile = hiera.lookup('apache.vhostfile', nil, { '::osfamily' => 'RedHat' })
    apachevhostsource = hiera.lookup('apache.vhostsource', nil, { '::osfamily' => 'RedHat' })

    let(:params) do
	{
		:configsource => apacheconfigsource,
		:configfile => apacheconfigfile,
		:vhostsource => apachevhostsource,
		:vhostfile => apachevhostfile,
	}
    end

    it { is_expected.to contain_file('config-file').with({ :path => '/etc/httpd/conf/httpd.conf' }) }
    it { is_expected.to contain_file('vhost-file').with({ :path => '/etc/httpd/conf.d/vhost.conf' }) }
  end

  context 'apache config on Debian systems' do
    let(:facts) { { :osfamily => 'Debian' } }
    hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')

    apacheconfigfile = hiera.lookup('apache.configfile', nil, { '::osfamily' => 'Debian' })
    apacheconfigsource = hiera.lookup('apache.configsource', nil, { '::osfamily' => 'Debian' })
    apachevhostfile = hiera.lookup('apache.vhostfile', nil, { '::osfamily' => 'Debian' })
    apachevhostsource = hiera.lookup('apache.vhostsource', nil, { '::osfamily' => 'Debian' })

    let(:params) do
	{
		:configsource => apacheconfigsource,
		:configfile => apacheconfigfile,
		:vhostsource => apachevhostsource,
		:vhostfile => apachevhostfile,
	}
    end

    it { is_expected.to contain_file('config-file').with({ :path => '/etc/apache2/apache2.conf' }) }
    it { is_expected.to contain_file('vhost-file').with({ :path => '/etc/apache2/sites-enabled/vhost.conf' }) }
  end

end
