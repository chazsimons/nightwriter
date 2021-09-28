require_relative 'dictionary'
class Translator
  include Dictionary

  def initialize(in_file, out_file)
    @message = in_file
    @path    = out_file
  end

  def breakdown(message)
    characters = message.chomp.split(//)
    characters
  end
end
