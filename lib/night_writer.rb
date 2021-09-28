class NightWriter

  attr_reader :in_file,
              :out_file
  def initialize
    @in_file = ARGV[0]
    @out_file = ARGV[1]
  end

  def read(in_file)
    string = File.read(in_file)
    string
  end

  def translate(in_file, out_file)
    interpretor = Translator.new(in_file.read, out_file)
    # interpretor.translate
  end

  def creation_message(in_file, out_file)
    read(in_file)
    "Created '#{out_file}' containing #{in_file.length} characters"
  end
end
