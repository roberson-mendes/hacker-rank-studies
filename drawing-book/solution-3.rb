def pageCount(n, p)
  if (n.even?)
      return [p/2, (n - p + 1)/2].min
  else
      return [p/2, (n - p)/2].min
  end
end

def test_1
  expected_result = 0
  pages = 4
  desired_page = 4

  result = pageCount(pages, desired_page)

  p "test_1 passed: #{result == expected_result}"
end

test_1
