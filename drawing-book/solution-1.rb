def count_from_first(page)
  calculate_flips_to_page = -> (even_page) { (even_page/2).to_i }

  if (page.even?)
      return calculate_flips_to_page.call(page)
  else
      previous_even = page - 1
      return calculate_flips_to_page.call(previous_even)
  end
end

def count_from_last_page(page, last_page)
  calculate_flips = Proc.new do
      if(page.even?)
          return (last_page - page) / 2
      else
          previous_even = page - 1
          return (last_page - previous_even) / 2
      end
  end

  both_sides_printed = last_page.even?

  if(both_sides_printed)
      calculate_flips.call
  else
      (calculate_flips.call) - 1
  end
end

def pageCount(n, p)
  last_page = n

  page = p

  flips_from_first = count_from_first(page)

  flips_from_last = count_from_last_page(page, last_page)

  return flips_from_first if flips_from_first < flips_from_last

  flips_from_last
end

######################################################################---TESTS

def test_1
  expected_result = 0
  pages_in_book = 5
  desired_page = 4

  result = pageCount(pages_in_book, desired_page)

  p "test_1 passed: #{result == expected_result}"
end

test_1
