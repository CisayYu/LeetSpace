def center_check(array, low, high, max_index, max_length)
  len = array.count
  while low >= 0 and high < len
    # 从中心点延展，持续检查对称点元素是否相等
    if array[low] == array[high]
      # 相等时更新结果
      if high - low + 1 > max_length
        max_index = low
        max_length = high - low + 1
      end
      low -= 1
      high += 1
    else
      # 出现不相等情况则直接终止延展检查
      break
    end
  end

  [max_index, max_length]
end

def longest_palindrome(s)
  str_array = s.split("")
  len = str_array.count
  max_index = 0
  max_length = 0
  index = 0
  loop do
    # 对两种回文中心点检查
    # case1：aba
    max_index,max_length = center_check(str_array, index, index, max_index, max_length)
    # case2：abba
    if index + 1 < len
      max_index,max_length = center_check(str_array, index, index + 1, max_index, max_length)
    end
    index += 1
    if index >= len
      break
    end
  end

  str_array[max_index, max_length].join
end

puts longest_palindrome("kyyrjtdplseovzwjkykrjwhxquwxsfsorjiumvxjhjmgeueafubtonhlerrgsgohfosqssmizcuqryqomsipovhhodpfyudtusjhonlqabhxfahfcjqxyckycstcqwxvicwkjeuboerkmjshfgiglceycmycadpnvoeaurqatesivajoqdilynbcihnidbizwkuaoegmytopzdmvvoewvhebqzskseeubnretjgnmyjwwgcooytfojeuzcuyhsznbcaiqpwcyusyyywqmmvqzvvceylnuwcbxybhqpvjumzomnabrjgcfaabqmiotlfojnyuolostmtacbwmwlqdfkbfikusuqtupdwdrjwqmuudbcvtpieiwteqbeyfyqejglmxofdjksqmzeugwvuniaxdrunyunnqpbnfbgqemvamaxuhjbyzqmhalrprhnindrkbopwbwsjeqrmyqipnqvjqzpjalqyfvaavyhytetllzupxjwozdfpmjhjlrnitnjgapzrakcqahaqetwllaaiadalmxgvpawqpgecojxfvcgxsbrldktufdrogkogbltcezflyctklpqrjymqzyzmtlssnavzcquytcskcnjzzrytsvawkavzboncxlhqfiofuohehaygxidxsofhmhzygklliovnwqbwwiiyarxtoihvjkdrzqsnmhdtdlpckuayhtfyirnhkrhbrwkdymjrjklonyggqnxhfvtkqxoicakzsxmgczpwhpkzcntkcwhkdkxvfnjbvjjoumczjyvdgkfukfuldolqnauvoyhoheoqvpwoisniv")