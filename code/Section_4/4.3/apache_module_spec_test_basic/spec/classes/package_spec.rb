require 'spec_helper'

describe 'apache::package' do
  it { is_expected.to contain_package('apache-package').with({ :name => 'httpd' }) }
end
