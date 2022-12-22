def twoArrays(k, a, b)
  #para cada elemento de a
  a_permutation = []
  b_permutation = []
  a_size = a.size

  a_size.times do
    #tire o elemento
    shifted_a = a.shift
    b_sums = {}
    #procure os elementos de b que a+b >= k
    b.each_with_index do |b_value, b_index|
        #adicione os elementos em uma lista b_sums
        b_sums[b_index] = b_value if b_value + shifted_a >= k
    end
    #se nao tiver elementos na lista, return "NO"
    return "NO" if b_sums.size == 0
    #selecione o menor elemento da lista
    min_b_to_sum = b_sums.min_by { |key, value| value}
    #tire o elemento de b
    min_b_to_sum_index = min_b_to_sum[0]
    b.delete_at(min_b_to_sum_index)
    #adicione o elemento de a em a_permutation
    a_permutation.push(shifted_a)
    #adicione o elemeno de b em b_permutation
    min_b_to_sum_value = min_b_to_sum[1]
    b_permutation.push(min_b_to_sum_value)
  end

  return "YES"
end

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

test1
test2
test3
test4
