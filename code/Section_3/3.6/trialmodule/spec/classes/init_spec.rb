require 'spec_helper'
describe 'trialmodule' do
  context 'with default values for all parameters' do
    it { should contain_class('trialmodule') }
  end
end
