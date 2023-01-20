def decode(letter)
  low_case_alphabet = ("a".."z").to_a
  capital_alphabet = ("A".."Z").to_a
  return_13_positions = -> (alphabet) {
    alphabet_position = alphabet.index(letter)
    decoded_position = alphabet_position - 13
    return alphabet.at(decoded_position)
  }

  return return_13_positions.call(low_case_alphabet) if low_case_alphabet.include?(letter)
  return return_13_positions.call(capital_alphabet) if capital_alphabet.include?(letter)
  return letter
end

def invert_word(word)
  letters = word.chars
  decode_each_letter = -> (letters) do
      letters.map { |letter| decode(letter) }.join
  end

  decode_each_letter.call(letters)
end

def test_1
  expected_result = "n"

  result = decode("a")

  p "test_1 passed: #{expected_result == result}"
end

def test_2
  expected_result = "N"

  result = decode("A")

  p "test_2 passed: #{expected_result == result}"
end

def test_3
  expected_result = " "

  result = decode(" ")

  p "test_3 passed: #{expected_result == result}"
end

def test_4
  expected_result = "Why did"

  result = invert_word("Jul qvq")

  p "result in test 4: #{result}"

  p "test_4 passed: #{expected_result == result}"
end

test_1
test_2
test_3
test_4
