require 'simplecov'
SimpleCov.start
require './lib/night_writer'
require './lib/translator'

describe NightWriter do
  before(:each) do
    @writer = NightWriter.new
  end

  it 'exists' do
    expect(@writer).to be_an_instance_of(NightWriter)
  end

  it 'can read a file' do
    results = @writer.read('message.txt')

    expect(results).to be_a(String)
  end

  it 'can create a new instance of Translator' do
    results = @writer.translate('message.txt', 'braille.txt')
    expect(results).to be_an_instance_of(Translator)
  end

  it 'can display a message' do
    expect(@writer.creation_message('message.txt', 'braille.txt')).to eq("Created 'braille.txt' containing 11 characters")
  end
end
