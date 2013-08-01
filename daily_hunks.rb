require "sinatra"
require "json"

# Fetch data for page.
get "/edition/" do
  thread_id = "test"

  # Grab JSON from reddit.
  # Find first result that is JPEG or PNG.
  # Pull image from it and save locally.
  # Resize image.
  # Grayscale image.
  # Create etag using thread id.

  etag Digest::MD5.hexdigest(thread_id)
  erb :hunk
end

# Send sample hunk.
get "/sample/" do
  thread_id = "sample"

  etag Digest::MD5.hexdigest(thread_id)
  erb :hunk
end

helpers do
class Fixnum
  def ordinalize
    if (11..13).include?(self % 100)
      "#{self}th"
    else
      case self % 10
        when 1; "#{self}st"
        when 2; "#{self}nd"
        when 3; "#{self}rd"
        else    "#{self}th"
      end
    end
  end
end
end
