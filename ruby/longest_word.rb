def LongestWord(sen)
  sen_split_without_punct = sen.split(" ").map { |word| word.gsub(/[[:punct:]]/, "") }

  string_count = sen_split_without_punct.map { |word| word.length }

  sen_split_without_punct.find { |word| word.length == string_count.max }
end

# keep this function call here
puts LongestWord(STDIN.gets)
