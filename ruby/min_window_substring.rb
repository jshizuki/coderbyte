=begin
Use the right slider to find a potential window.  When the potential
window size is smaller than the previous one, reassign it to min_window.
Move on to find the next potential window by using the left slider until
another potential window cannot be found (meaning the available characters
are smaller than the required numbers of characters in "second" )
=end

# window_count[key] < value && !window_count.empty? &&

def min_window_substring(str)
  first = str[0].chars
  second = str[1].chars

  first_count = Hash.new
  second_count = Hash.new

  first.each_with_index do |char, index|
    first_count[char].nil? ? first_count[char] = [index] : first_count[char] << index
  end

  second.each do |char|
    second_count[char].nil? ? second_count[char] = 1 : second_count[char] += 1
  end

  # p first_count
  # p second_count
  min_window = []
  min_window_length = Float::INFINITY
  potential_window = []

  left, right = 0

  window_count = Hash.new

  until second_count.any? { |key, value| first_count[key].count < second_count[key] }

    second.each do |char|
      if !potential_window.include?(char)
        right = first_count[char].first
        potential_window = first[left..right]
      end
    end

    second.each do |char|
      window_count[char] = potential_window.count(char)
    end

    potential_window_length = potential_window.length
    potential_window_length <= min_window_length ? min_window = potential_window : min_window
    min_window_length = min_window.length
    # p min_window

    common_characters = potential_window.each.select { |each| second.include?(each) }

    first_character = common_characters[0]

    first_count[first_character].shift
    window_count[first_character] -= 1
    second_character_index = first_count[common_characters[1]].first
    left = second_character_index
    potential_window = first[left..right]
  end

  min_window.join("")
end

p min_window_substring(["ahffaksfajeeubsne", "jefaab"])
# Output: aksfajeeub

p min_window_substring(["aaffhkksemfkelloe", "fheam"])
# Output: affhkksem

p min_window_substring(["ADOBECODEBANC", "ABC"])
