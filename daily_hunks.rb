require "sinatra"
require "json"

# Fetch data for page.
get "/edition/" do
  thread_id = "test"

  etag Digest::MD5.hexdigest(thread_id)
  erb :hunk
end

# Send sample hunk.
get "/sample/" do
  thread_id = "sample"

  etag Digest::MD5.hexdigest(thread_id)
  erb :hunk
end
