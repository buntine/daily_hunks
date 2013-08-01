class LadyBoners

  def init(limit = 10, accept=["jpg", "png"])
    @limit = limit
    @accept = accept
  end

  def get_result
    # Grab JSON form reddit.
    # Scan through looking for file ext that exists in @accept.
    # Return matching result or nil.
  end

end
