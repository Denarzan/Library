class EmptyError < StandardError
  def message
    "Some variable is empty"
  end
end
