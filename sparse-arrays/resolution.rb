################################################---VERSION_1
def countOcurrences(strings)
  ocurrences = Hash.new(0)
  strings.each {|word| ocurrences[word] += 1 }

  ocurrences
end

def countQueriesOcurrences(queries, ocurrences)
  result = []
  queries.each {|word| result.push(ocurrences[word])}

  result
end

def countOcurrencesInBigON(strings, queries)
  ocurrences = countOcurrences(strings)
  result = countQueriesOcurrences(queries, ocurrences)
  result
end

################################################---VERSION_2
def countOcurrencesInBigON2(strings, queries)
  result = Array.new(queries.size, 0)
  countWordInStrings = -> (word) { strings.count(word) }

  #put occurrences of each word in the result structure
  queries.each_with_index do |word, index|
      result[index] = countWordInStrings.call(word)
  end

  result
end

################################################---MAIN-METHOD
def matchingStrings(strings, queries)
  countOcurrencesInBigON2(strings, queries)
end

################################################---TEST-METHOD
def test
  strings = %w(aba baba aba xzxb)
  queries = %w(aba xzxb ab)
  result = matchingStrings(strings, queries)
  p (result == [2, 1, 0])
end

test
