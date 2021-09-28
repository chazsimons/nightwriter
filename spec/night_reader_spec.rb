require 'simplecov'
SimpleCov.start
require './lib/night_reader'
require './lib/translator'

describe NightReader do
  before(:each) do
    @reader = NightReader.new
  end

  it 'exists' do
    expect(@reader).to be_an_instance_of(NightReader)
  end

end
