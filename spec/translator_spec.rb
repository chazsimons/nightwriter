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
end
