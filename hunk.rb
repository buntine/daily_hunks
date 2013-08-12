require "fileutils"
require "RMagick"

class Hunk
  include Magick

  def initialize(file)
    @file = file
    @save_path = "./public/hunks/"
  end

  def treat(width=360, height=550)
    image = Image.read(@file).first
    image.resize_to_fit!(width, height)
    image = image.quantize(256, Magick::GRAYColorspace)
    path = File.join(@save_path, "#{Time.now.to_i}#{File.extname(@file)}")
    image.write(path)

    path
  end

end
