def longest_palindrome(s)
  str_array = s.split("")
  res_length = 0
  res_index = 0

  temp_length = 0
  temp_index = -1
  all_item_same = false
  str_array.each_with_index do |value, index|
    puts"#{value} #{index} #{temp_length} #{all_item_same}"
    if temp_length > 0
      if all_item_same
        if value != str_array[index-1]
          all_item_same = false
          if temp_index - 1 >= 0 and str_array[temp_index - 1] == value
            # Y - Y
            temp_length += 2
            temp_index -= 1
          else
            # Y - N
            if temp_length > res_length
              res_length = temp_length
              res_index = temp_index
            end
            temp_index = -1
            temp_length = 0
          end
          next
        end
        # Y - Y
        temp_length += 1
        next
      end

      # Y - Y
      if temp_index - 1 >= 0 and value == str_array[temp_index - 1]
        temp_length += 2
        temp_index -= 1
        next
      end

      # Y - Y
      if index >= 2 and str_array[index - 2] == value
        if temp_length > res_length
          res_length = temp_length
          res_index = temp_index
        end
        temp_index = index - 2
        temp_length = 3
        next
      end

      # Y - Y
      if index >= 1 and str_array[index - 1] == value
        all_item_same = true
        if temp_length > res_length
          res_length = temp_length
          res_index = temp_index
        end
        temp_index = index - 1
        temp_length = 2
        next
      end

      # Y - N
      if temp_length > res_length
        res_length = temp_length
        res_index = temp_index
      end
      temp_index = -1
      temp_length = 0
    else
      # N — Y
      all_item_same = false
      if index >= 1 and str_array[index - 1] == value
        all_item_same = true
        temp_index = index - 1
        temp_length = 2
        next
      end

      # N — Y
      if index >= 2 and str_array[index - 2] == value
        temp_index = index - 2
        temp_length = 3
        next
      end

      # N — Y
      temp_index = index
      temp_length = 1
    end
  end

  if temp_length > res_length
    res_length = temp_length
    res_index = temp_index
  end

  return str_array[res_index, res_length].join(""),res_index,res_length
end

puts longest_palindrome("ababababababa")
