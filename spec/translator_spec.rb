require 'simplecov'
SimpleCov.start
require './lib/translator'
require './lib/dictionary'

describe Translator do
  include Dictionary
  before(:each) do
    @translator = Translator.new('message.txt', 'braille.txt')
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(Translator)
  end

  it 'has attributes' do
    expect(@translator.message).to eq('message.txt')
    expect(@translator.path).to eq('braille.txt')
  end

  it 'can break a message into an array' do
    results = @translator.breakdown('this is a string')
    expect(results.count).to eq(16)
    expect(results).to be_an(Array)
  end
end
