def longest_palindrome(s)
  str_array = s.split("")

  res_index = 0
  max_len = 0
  palindrome_table = {}
  str_array.each_with_index do |value, j|
    i = 0
    palindrome_table["#{j}-#{j}"] = true
    if max_len <= 0
      max_len = 1
      res_index = j
    end
    # O(n^2) 的遍历，需要检查从 0 到 j，所包含的所有可能的回文
    while i < j
      result = false
      # case1：如果 i 与 j 相等，且 i 与 j 相邻，则为回文
      # case2：如果 i 与 j 相等，且 i+1 到 j-1 为回文，则 i 到 j 为回文
      if str_array[i] == value and (j == i + 1 or palindrome_table["#{i+1}-#{j-1}"])
        result = true
      end
      palindrome_table["#{i}-#{j}"] = result
      if result and j - i + 1 > max_len
        max_len = j - i + 1
        res_index = i
      end
      i += 1
    end
  end

  str_array[res_index, max_len].join
end

puts longest_palindrome("kyyrjtdplseovzwjkykrjwhxquwxsfsorjiumvxjhjmgeueafubtonhlerrgsgohfosqssmizcuqryqomsipovhhodpfyudtusjhonlqabhxfahfcjqxyckycstcqwxvicwkjeuboerkmjshfgiglceycmycadpnvoeaurqatesivajoqdilynbcihnidbizwkuaoegmytopzdmvvoewvhebqzskseeubnretjgnmyjwwgcooytfojeuzcuyhsznbcaiqpwcyusyyywqmmvqzvvceylnuwcbxybhqpvjumzomnabrjgcfaabqmiotlfojnyuolostmtacbwmwlqdfkbfikusuqtupdwdrjwqmuudbcvtpieiwteqbeyfyqejglmxofdjksqmzeugwvuniaxdrunyunnqpbnfbgqemvamaxuhjbyzqmhalrprhnindrkbopwbwsjeqrmyqipnqvjqzpjalqyfvaavyhytetllzupxjwozdfpmjhjlrnitnjgapzrakcqahaqetwllaaiadalmxgvpawqpgecojxfvcgxsbrldktufdrogkogbltcezflyctklpqrjymqzyzmtlssnavzcquytcskcnjzzrytsvawkavzboncxlhqfiofuohehaygxidxsofhmhzygklliovnwqbwwiiyarxtoihvjkdrzqsnmhdtdlpckuayhtfyirnhkrhbrwkdymjrjklonyggqnxhfvtkqxoicakzsxmgczpwhpkzcntkcwhkdkxvfnjbvjjoumczjyvdgkfukfuldolqnauvoyhoheoqvpwoisniv")
