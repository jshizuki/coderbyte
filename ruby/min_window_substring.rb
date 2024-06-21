def min_window_substring(strArr)

  p first_string = strArr[0].chars
  p second_string = strArr[1].chars

  character_count = Hash.new

  first_string.each do |char|
    character_count[char].nil? ?
    character_count[char] = 1 : character_count[char] += 1
  end

  single_occurrence_chars = character_count.filter do |key, value|
    value == 1 && second_string.include?(key)
  end

  multiple_occurrence_chars = character_count.filter do |key, value|
    value != 1 && second_string.include?(key)
  end

  indexes_of_min_window = []

  single_occurrence_chars.keys.each do |char|
    indexes_of_min_window << first_string.index(char)
  end

  p single_occurrence_chars
  p multiple_occurrence_chars
  p indexes_of_min_window

  # min_window

end

# p min_window_substring(["ahffaksfajeeubsne", "jefaab"])
# #Output: aksfajeeub

min_window_substring(["aaff hkksem fkelloe", "fheam"])
# Output: affhkksem
