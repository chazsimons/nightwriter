require_relative 'dictionary'
class Translator
  include Dictionary
  attr_reader :message,
              :path
  def initialize(in_file, out_file)
    @message = in_file
    @path    = out_file
  end

  def breakdown(message)
    characters = message.split(//)
    characters
  end
end
