require 'simplecov'
SimpleCov.start
require './lib/night_writer'

describe NightWriter do
  before(:each) do
    @writer = NightWriter.new
  end

  it 'exists' do
    expect(@writer).to be_an_instance_of(NightWriter)
  end
end
