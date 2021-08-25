class SignError < StandardError
  def message
    "The number should be positive."
  end
end
