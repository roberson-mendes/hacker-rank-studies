def diagonalDifference(arr)
  #go through left diagonal summing its numbers and save into left_diagonal_sum
  initial_row = 0
  final_row = arr[0].size - 1
  left_diagonal_sum = 0

  for i in initial_row..final_row do
      diagonal_column_index, diagonal_row_index = i, i
      left_diagonal_sum += arr[diagonal_row_index][diagonal_column_index]
  end

  #go through right diagonal summing its numbers and save into right_diagonal_sum
  right_diagonal_sum = 0
  right_diagonal_column = arr[0].size - 1

  for i in initial_row..final_row do
      diagonal_row_index = i
      right_diagonal_sum += arr[diagonal_row_index][right_diagonal_column]
      right_diagonal_column -= 1
  end

  (left_diagonal_sum - right_diagonal_sum).abs
end

######################################################################---REFACTOR 1
def left_diagonal_sum(arr)
  initial_row = 0
  final_row = arr[0].size - 1
  left_diagonal_sum = 0

  for i in initial_row..final_row do
      diagonal_column_index, diagonal_row_index = i, i
      left_diagonal_sum += arr[diagonal_row_index][diagonal_column_index]
  end

  left_diagonal_sum
end

def right_diagonal_sum(arr)
  initial_row = 0
  final_row = arr[0].size - 1
  right_diagonal_sum = 0
  right_diagonal_column = arr[0].size - 1

  for i in initial_row..final_row do
      diagonal_row_index = i
      right_diagonal_sum += arr[diagonal_row_index][right_diagonal_column]
      right_diagonal_column -= 1
  end

  right_diagonal_sum
end

def diagonalDifference(arr)
  (left_diagonal_sum(arr) - right_diagonal_sum(arr)).abs
end
