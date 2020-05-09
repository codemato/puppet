require 'spec_helper'

describe 'apache::package' do
  context 'apache package on RedHat systems' do
    let(:facts) { { :osfamily => 'RedHat' } }
    it { is_expected.to contain_package('apache-package').with({ :name => 'httpd' }) }
  end

  context 'apache package on Debian systems' do
    let(:facts) { { :osfamily => 'Debian' } }
    it { is_expected.to contain_package('apache-package').with({ :name => 'apache2' }) }
  end
end
