def FirstFactorial(num)
  number = 1

  (1..num).to_a.reverse.each { |each| number = number * each }
  number
end

# keep this function call here
puts FirstFactorial(STDIN.gets)
