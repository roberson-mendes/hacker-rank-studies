#
# Complete the 'lonelyinteger' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY a as parameter.
#

def lonelyinteger(a)
  # Write your code here
  a.each_with_index do |item, index|
      to_compare = a.dup
      to_compare.delete_at(index)
      have_eql = false
      to_compare.each do |comparing|
          have_eql = comparing == item
          break if have_eql
      end
      return item if !have_eql
  end
end

######################################################################---TESTS
def test
  input = [84, 48, 13, 20, 61, 20, 33, 97, 34, 45, 6, 63, 71, 66, 24, 57, 92, 74, 6, 25, 51, 86, 48, 15, 64, 55, 77, 30, 56, 53, 37, 99, 9, 59, 57, 61, 30, 97, 50, 63, 59, 62, 39, 32, 34, 4, 96, 51, 8, 86, 10, 62, 16, 55, 81, 88, 71, 25, 27, 78, 79, 88, 92, 50, 16, 8, 67, 82, 67, 37, 84, 3, 33, 4, 78, 98, 39, 64, 98, 94, 24, 82, 45, 3, 53, 74, 96, 9, 10, 94, 13, 79, 15, 27, 56, 66, 32, 81, 77]
  expected_result = 99

  function_result = lonelyinteger(input)

  puts("passed = #{function_result == expected_result}")
end

test