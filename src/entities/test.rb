def check_type(*vars, type)
  vars.each do |var|
    raise TypeError unless var.is_a? type
  end
end

puts check_type(123, String)
