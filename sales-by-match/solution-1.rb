def sockMerchant(n, ar)
  #separate pairs by colors
  sum_of_colors = Hash.new(0).tap do |hash|
     ar.each { |color| hash[color] += 1 }
  end
  pairs = sum_of_colors.map { |_, count| (count / 2) }

  pairs.sum
end

def test_1
  expected_result = 3
  total_socks = 9
  socks = [10, 20, 20, 10, 10, 30, 50, 10, 20]

  result = sockMerchant(total_socks, socks)

  p "test_1 passed: #{result == expected_result}"
end

test_1
