def GraphChallenge(strArr)
  edges = strArr[1].tr("()", "").split(",")
  path = strArr[2].tr("()", "").split(",")

  graph = Hash.new{ |hash, key| hash[key] = []}

  edges.each do |edge|
    edge1, edge2 = edge.split("-")
    graph[edge1] << edge2
    graph[edge2] << edge1
  end

  visited = [];

  path.each_with_index do |vertex, index|
    visited << vertex if index.zero?

    next_vertex = path[index + 1]
    if graph[vertex].include?(next_vertex)
      visited << next_vertex
      break if !graph[vertex].include?(next_vertex)
    end
  end
  visited == path ? "yes" : visited.last
end

# Test cases
p GraphChallenge(["(A,B,C,D)", "(A-B,A-D,B-D,A-C)", "(C,A,D,B)"]) # Output: yes
p GraphChallenge(["(A,B,C,D)", "(A-B,A-D,B-D,A-C)", "(D,A,B,C)"]) # Output: B
p GraphChallenge(["(X,Y,Z,Q)", "(X-Y,Y-Q,Y-Z)", "(Z,Y,Q,X)"]) # Output: Q
