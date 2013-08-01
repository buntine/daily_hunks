require "net/http"
require "active_support/core_ext/hash"
require "json"

class LadyBoners

  def initialize(limit = 10, period="day", accept=["jpg", "png"])
    @limit = limit
    @period = period
    @accept = accept
    @url = "http://www.reddit.com/r/LadyBoners/top.json?sort=top&t=#{@period}&limit=#{@limit}"
  end

  def get_result
    strip_junk(find_image(get_threads))
  end

 private

  def get_threads
    resp = Net::HTTP.get_response(URI.parse(@url))
    buffer = resp.body
    JSON.parse(buffer)["data"]["children"]
  end

  def find_image(threads)
    threads.find do |t|
      data = t["data"]
      url = data["url"]
      @accept.include?(File.extname(URI.parse(url).path)[1, 3]) and !data["over_18"]
    end
  end

  def strip_junk(thread)
    thread["data"].slice("title", "score", "name", "url")
  end

end
