def convert(s, num_rows)
  n = 17
  puts (n%(((n/8) + 1)*8) - (((n/8) + 1)*8)).abs
end

convert("PAYPALISHIRING", 4)