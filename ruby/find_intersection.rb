def FindIntersection(strArr)
  first_element = strArr[0].split(", ").map(&:to_i)
  second_element = strArr[1].split(", ").map(&:to_i)

  first_element.filter do |element|
    second_element.any?(element)
  end
end

# keep this function call here
puts FindIntersection(STDIN.gets)
