require "sinatra"
require "active_support/core_ext/integer/inflections"
require "open-uri"
require "fileutils"
require "./lady_boners"
require "./hunk"

# Fetch hunk for page.
get "/edition/" do
  lb = LadyBoners.new
  result = lb.get_result

  # Get image and save locally.
  path = path_for_image(result)
  open(path, "wb") do |file|
    file << open(result["url"]).read
  end

  hunk = Hunk.new(path)
  @image = hunk.treat.gsub("./public", "")

  # Delete temp image.
  FileUtils.rm(path)

  etag Digest::MD5.hexdigest(result["name"])
  erb :hunk
end

# Send sample hunk.
get "/sample/" do
  @image = "/sample.png"

  thread_id = "sample"
  etag Digest::MD5.hexdigest("sample")
  erb :hunk
end

def path_for_image(result)
  "./tmp/image.jpg"
end
