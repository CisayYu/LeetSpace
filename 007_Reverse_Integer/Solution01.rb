def reverse(x)
  is_positive = x >= 0
  reverse_number = x.abs.to_s.reverse.to_i
  reverse_number = reverse_number * (is_positive ? 1:-1)
  if reverse_number < -2 ** 31 or reverse_number >= 2 ** 31
    return 0
  end

  reverse_number
end

puts reverse -120