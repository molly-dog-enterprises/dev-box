require 'spec_helper'
describe 'tipper' do

  context 'with defaults for all parameters' do
    it { should contain_class('tipper') }
  end
end
