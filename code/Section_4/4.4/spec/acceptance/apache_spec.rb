require 'spec_helper_acceptance'

describe "verify apache components" do
  context 'default class' do
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'apache': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
    end
  end

  context "verify apache package" do
    if fact('osfamily') == 'RedHat'
      describe package('httpd') do
  	it { should be_installed }
      end
    end

    if fact('osfamily') == 'Debian'
      describe package('apache2') do
  	it { should be_installed }
      end
    end
  end

  context "verify apache service" do
    if fact('osfamily') == 'RedHat'
      describe service('httpd') do
  	it { should be_enabled }
  	it { should be_running }
      end
    end

    if fact('osfamily') == 'Debian'
      describe service('apache2') do
  	it { should be_enabled }
  	it { should be_running }
      end
    end
  end

  context "verify apache port" do
    describe port(80) do
      it { should be_listening }
    end
  end
end
