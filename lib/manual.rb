require './lib/manual/parser.rb'

class Manual

  include CarParser
  attr_accessor :reader, :pages, :cars

  def initialize()
    @reader = PDF::Reader.new("./lib/2013_TAVT_Manual.pdf")
    @pages = []
    @cars = []
    @id = 1
  end

  def extract_data(range)
    read_pages(range)
    pages.each_with_index do |page,i|
      parse_page(page)
      puts "Parsed page ##{i}"
    end
  end

  def read_pages(range)
    reader.pages[range].each do |page|
      text = reshape_text(page.text)
      pages.push(text)
    end
  end

  # reshape the block of text so that only one column exists
  def reshape_text(raw_text)
    start_point = determine_second_column_start(raw_text)
    return raw_text.lines.entries.slice(3..5) if start_point == 0 # the page only has one column
    temp = []
    raw_text.lines.entries.slice(3..-5).each do |line|
      temp << line.slice!(start_point..-1)
    end.entries.concat(temp)
  end

  def determine_second_column_start(raw_text)
    lines = raw_text.lines.entries
    index = lines.find_index do |line|
      !line.match(/AUTOMOBILES|LIGHT DUTY TRUCKS|MOTORCYCLES/).nil?
    end
    line = lines[index]
    line.rindex(/AUTOMOBILES|LIGHT DUTY TRUCKS|MOTORCYCLES/)
  end

end

#class Car

#  attr_accessor :make, :model, :year, :vin, :vid, :value, :trim

#  def initialize(info)
#    @make = info[:make]
#    @model = info[:model]
#    @trim = info[:trim]
#    @year = info[:year]
#    @vin = info[:vin]
#    @vid = info[:vid]
#    @value = info[:value]
#  end

#end

# manual = Manual.new("2013_TAVT_Manual.pdf")
# manual.extract_data(5)

# manual.cars.each do |car|
#   puts car.year
#   puts car.make
#   puts car.model
#   puts car.trim
#   puts car.vin
#   puts car.vid
#   puts car.value
#   puts '-----------'
# end
