class PaginationError < StandardError
  def message
    "Page does not exist"
  end
end