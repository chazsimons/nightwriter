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

  it 'can read a file' do
    results = @reader.read('braille.txt')
    expect(results).to be_a(String)
  end

  it 'can create a new instance of translator' do
    results = @reader.translate('braille.txt', 'message.txt')
    expect(results).to be_an_instance_of(Translator)
  end

  it 'can create a message' do
    results = @reader.creation_message('braille.txt', 'message.txt')
    expect(results).to eq("Created 'message.txt' containing 11 characters")
  end
end
