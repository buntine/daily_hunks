require "fileutils"

class Hunk

  def initialize(file)
    @file = file
    @save_path = "./public/hunks/"
  end

  def treat(width=360, height=550)
    # Resize image.
    # Greyscale image.
    # Save using timestamp.
    path = File.join(@save_path, "#{Time.now.to_i}.jpg")

    FileUtils.cp(@file, path)

    path
  end

end
