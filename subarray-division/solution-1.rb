def birthday(s, d, m)
  combinations = []
  last_subarray_index = s.size - m
  segment_size = m
  make_combinations = -> do
    for i in 0..last_subarray_index
      combinations.push(s[i, segment_size])
    end
  end

  make_combinations.call

  #filter just combinations wich squares indexes are equals the birthday
  combinations.find_all { |combination| combination.sum == d}.size
end

def test_1
  s = [2, 5, 1, 3, 4, 4, 3, 5, 1, 1, 2, 1, 4, 1, 3, 3, 4, 2, 1]
  d = 18
  m = 7
  expected_result = 3

  result = birthday(s, d, m)

  p "test_1 passed: #{result == expected_result}"
end

def test_2
  s = [1, 2, 1, 3, 2]
  d = 3
  m = 2
  expected_result = 2

  result = birthday(s, d, m)

  p "test_2 passed: #{result == expected_result}"
end

test_1
test_2
