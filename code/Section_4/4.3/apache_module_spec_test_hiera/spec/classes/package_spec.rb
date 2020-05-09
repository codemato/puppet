require 'spec_helper'

describe 'apache::package' do
  context 'apache package on RedHat systems' do
    let(:facts) { { :osfamily => 'RedHat' } }
    hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')
    apachepackagename = hiera.lookup('apache.packagename', nil, { '::osfamily' => 'RedHat' })
    let(:params) {{ :packagename => apachepackagename }}

    it { is_expected.to contain_package('apache-package').with({ :name => 'httpd' }) }
  end

  context 'apache package on Debian systems' do
    let(:facts) { { :osfamily => 'Debian' } }
    hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')
    apachepackagename = hiera.lookup('apache.packagename', nil, { '::osfamily' => 'Debian' })
    let(:params) {{ :packagename => apachepackagename }}

    it { is_expected.to contain_package('apache-package').with({ :name => 'apache2' }) }
  end
end
