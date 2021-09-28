require_relative 'dictionary'
class Translator
  include Dictionary
  attr_reader :message,
              :path,
              :top_line,
              :middle_line,
              :bottom_line
  def initialize(in_file, out_file)
    @message     = in_file
    @path        = out_file
    @top_line    = []
    @middle_line = []
    @bottom_line = []
  end

  def breakdown(message)
    characters = message.split(//)
    characters
  end

  def to_braille(message)
    message.each do |character|
      if character == " "
        @top_line    << ".."
        @middle_line << ".."
        @bottom_line << ".."
      elsif character == character.upcase
        @top_line    << top['capital'] << top[character.downcase]
        @middle_line << middle['capital'] << middle[character.downcase]
        @bottom_line << bottom['capital'] << bottom[character.downcase]
      else
        @top_line    << top[character]
        @middle_line << middle[character]
        @bottom_line << bottom[character]
      end
    end
    full_message = [@top_line.join, @middle_line.join, @bottom_line.join]
    full_message
  end

  def to_english(message)
    require "pry"; binding.pry
    segments = message.each_slice(message.length / 3).to_a.transpose
    translation = []
    segments.each do |segment|
      translation << braille_to_english[segment]
    end
    translation.join
  end
end
