require "sinatra"
require "active_support/core_ext/integer/inflections"
require "open-uri"
require "./lady_boners"
require "./hunk"

# Fetch data for page.
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
  etag Digest::MD5.hexdigest(result["name"])
  erb :hunk
end

# Send sample hunk.
get "/sample/" do
  thread_id = "sample"

  etag Digest::MD5.hexdigest(thread_id)
  erb :hunk
end

def path_for_image(result)
  "./tmp/image.jpg"
end
