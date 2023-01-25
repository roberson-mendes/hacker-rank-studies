def find_upper_right(matrix, row, col)
  inverted_col = -(col + 1)

  matrix[row][inverted_col]
end

def find_bottom_left(matrix, row, col)
  inverted_row = -(row + 1)

  matrix[inverted_row][col]
end

def find_bottom_right(matrix, row, col)
  inverted_row = -(row + 1)
  inverted_col = -(col + 1)

  matrix[inverted_row][inverted_col]
end

#find each possible replacement value to the actual position (matrix[row][col]) for upper-left submatrix
def possible_values_to(matrix, row, col)
  upper_right_correspondent = find_upper_right(matrix, row, col)
  bottom_left_correspondent = find_bottom_left(matrix, row, col)
  bottom_right_correspondent = find_bottom_right(matrix, row, col)
  upper_left_correspondent = matrix[row][col]

  [upper_left_correspondent, upper_right_correspondent, bottom_left_correspondent, bottom_right_correspondent]
end

#sum all the greatest values to each of the elements in the "n x n" upper-left submatrix.
def flippingMatrix(matrix)
  # Write your code here
  n = (matrix.size)/2
  max_upper_left_sum = 0

  #find each greatest value for each of the elements in the upper-left "n x n" submatrix and sum all of it
  rows_1th_quad = 0..(n-1)
  cols_1th_quad = 0..(n-1)
  for row in rows_1th_quad
    for col in cols_1th_quad
      possible_values = possible_values_to(matrix, row, col)

      greatest_value = possible_values.max

      max_upper_left_sum += greatest_value
    end
  end

  max_upper_left_sum
end

def test_1
  expected_result = 414
  matrix = [[112, 42, 83, 119], [56, 125, 56, 49],
           [15, 78, 101, 43], [62, 98, 114, 108]]

  result = flippingMatrix(matrix)

  p "test_1 passed: #{result == expected_result}"
end

test_1
