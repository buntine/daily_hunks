require "sinatra"
require "active_support/core_ext/integer/inflections"
require "./lady_boners"
require "./hunk"

# Fetch data for page.
get "/edition/" do
  lb = LadyBoners.new
  result = lb.get_result

  # Get image and save locally.

  hunk = Hunk.new(image)
  @image = hunk.treat

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
