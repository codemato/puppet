require 'spec_helper'

describe 'apache::service' do
  context 'apache service on RedHat systems' do
    let(:facts) { { :osfamily => 'RedHat' } }
    hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')
    apacheservicename = hiera.lookup('apache.servicename', nil, { '::osfamily' => 'RedHat' })
    let(:params) {{ :servicename => apacheservicename }}

    it { is_expected.to contain_service('apache-service').with({ :name => 'httpd' }) }
  end

  context 'apache service on Debian systems' do
    let(:facts) { { :osfamily => 'Debian' } }
    hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')
    apacheservicename = hiera.lookup('apache.servicename', nil, { '::osfamily' => 'Debian' })
    let(:params) {{ :servicename => apacheservicename }}

    it { is_expected.to contain_service('apache-service').with({ :name => 'apache2' }) }
  end
end
