require 'spec_helper'

describe 'apache' do
  context 'should contain component classes on RedHat systems' do

    let(:facts) { { :osfamily => 'RedHat' } }

    it { is_expected.to contain_class('apache::package').that_comes_before('Class[apache::config]') }
    it { is_expected.to contain_class('apache::config').that_notifies('Class[apache::service]') }
    it { is_expected.to contain_class('apache::service') }
  end

  context 'should contain component classes on Debian systems' do

    let(:facts) { { :osfamily => 'Debian' } }

    it { is_expected.to contain_class('apache::package').that_comes_before('Class[apache::config]') }
    it { is_expected.to contain_class('apache::config').that_notifies('Class[apache::service]') }
    it { is_expected.to contain_class('apache::service') }
  end
end
