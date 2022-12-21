def pangrams(s)
  # Write your code here
  letters = s.downcase.gsub(/[^a-z]/, "").chars.uniq
  p letters
  letters.size == 26 ? "pangram" : "not pangram"
end

def test
  sentence = "We promptly judged antique ivory buckles for the next prize"
  expected_result = "pangram"

  result = pangrams(sentence)

  p "passed: #{result == expected_result}"
end

test
