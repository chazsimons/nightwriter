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

  it 'can translate a message to braille' do
    array = @translator.breakdown('this is a string')
    results = @translator.to_braille(array)
    expect(results).to eq(
      ['.00..0.0...0.0..0....0.00..00000',
        '00000.0...0.0.......0.00000..000',
        '0.....0.....0.......0.0.0...0...'])
  end

  xit 'can translate a message from braille' do
    results = @translator.to_english('.00..0.0...0.0..0....0.00..0000000000.0...0.0.......0.00000..0000.....0.....0.......0.0.0...0...')
    expect(results).to eq('this is a string')
  end
end
