#Permutation.possible_to_permute?(a, b, k)
  #class Permute
    #attr a, b, k, a_permutation, b_permutation

class Permutation
  def initialize
    @a_permutation = []
    @b_permutation = []
  end

  def possible_to_permute?(a, b, k)
    @a = a
    @b = b
    @k = k

    has_min_permutation?
  end

  private

  def has_min_permutation?
    compute_min_permutation = Proc.new do
        @a.size.times do
        shifted_a = @a.shift
        min_b_sum = find_lower_sum_to(shifted_a)
        return false if min_b_sum == "NO"
        permute!(min_b_sum, shifted_a)
      end
    end

    compute_min_permutation.call

    return true
  end

  def find_lower_sum_to(shifted_a)
    b_sums = @b.each_with_index.map { |value, key| [key, value] }.to_h.select { |key, value| value + shifted_a >= @k}
    return "NO" if b_sums.size == 0
    b_sums.min_by { |key, value| value}
  end

  def permute!(min_b_sum, shifted_a)
    min_b_sum_index = min_b_sum[0]
    @b.delete_at(min_b_sum_index)
    @a_permutation.push(shifted_a)
    min_b_sum_value = min_b_sum[1]
    @b_permutation.push(min_b_sum_value)
  end
end

def twoArrays(k, a, b)
  Permutation.new.possible_to_permute?(a, b, k) ? "YES" : "NO"
end

#######################################################################---SOLUTION 2
=begin
Smarter solution: instead of search the minimum b to each a, we do almost the same
#but by sorting the arrays, a in descending order, b in ascending order, we have each of
small value from a added to each bigger value from b, then we have that for each number
of a, we have a possible sum on b such as a+b is >= k. If some of the numbers of a doesn't
have any b in which the sum >= k, so it's not possible to sort the arrays in any order that
satisfies the condition a'[i] + b'[i] >= k
=end

def twoArrays2(k, a, b)
  a.sort!.reverse!
  b.sort!
  condition_matches_for_all = Proc.new do
    a.each_with_index do |a_value, index|
      return "NO" if a_value + b[index] < k
    end
    return "YES"
  end

  condition_matches_for_all.call()
end


#######################################################################---TESTS SOLUTION 1
def test1
  expected_result = "YES"
  k = 4
  a = [1, 3]
  b = [3, 1]

  result = twoArrays(k, a, b)

  p "passed: #{result == expected_result}"
end

def test2
  expected_result = "NO"
  k = 5
  a = [2, 3, 1, 1, 1]
  b = [1, 3, 4, 3, 3]

  result = twoArrays(k, a, b)

  p "passed: #{result == expected_result}"
end

def test3
  expected_result = "NO"
  k = 9
  a = [1, 5, 1, 4, 4, 2, 7, 1, 2, 2]
  b = [8, 7, 1, 7, 7, 4, 4, 3, 6, 7]

  result = twoArrays(k, a, b)

  p "passed: #{result == expected_result}"
end

def test4
  expected_result = "YES"
  k = 9
  a = [3, 6, 8, 5, 9, 9, 4, 8, 4, 7]
  b = [5, 1, 0, 1, 6, 4, 1, 7, 4, 3]

  result = twoArrays(k, a, b)

  p "passed: #{result == expected_result}"
end

def test_solution2_1
  expected_result = "YES"
  k = 4
  a = [1, 3]
  b = [3, 1]

  result = twoArrays2(k, a, b)

  p "passed: #{result == expected_result}"
end

def test_solution2_2
  expected_result = "NO"
  k = 5
  a = [2, 3, 1, 1, 1]
  b = [1, 3, 4, 3, 3]

  result = twoArrays2(k, a, b)

  p "passed: #{result == expected_result}"
end

def test_solution2_3
  expected_result = "NO"
  k = 9
  a = [1, 5, 1, 4, 4, 2, 7, 1, 2, 2]
  b = [8, 7, 1, 7, 7, 4, 4, 3, 6, 7]

  result = twoArrays2(k, a, b)

  p "passed: #{result == expected_result}"
end

def test_solution2_4
  expected_result = "YES"
  k = 9
  a = [3, 6, 8, 5, 9, 9, 4, 8, 4, 7]
  b = [5, 1, 0, 1, 6, 4, 1, 7, 4, 3]

  result = twoArrays2(k, a, b)

  p "passed: #{result == expected_result}"
end

test1
test2
test3
test4
test_solution2_1
test_solution2_2
test_solution2_3
test_solution2_4
