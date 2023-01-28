def populate_book_pages(last_page)
  book = []

  actual_page = 1
  populate_faces = -> do
      until actual_page > last_page
          if actual_page == last_page || actual_page == 1
              book.push([actual_page])
              actual_page += 1
          else
              next_page = actual_page + 1
              book.push([actual_page, next_page])
              actual_page = next_page + 1
          end
      end

      return book
  end

  populate_faces.call
end

def desired_index(book, desired_page)
   book.index { |face| face[0] == desired_page || face[1] == desired_page }
end

def compute_end_flips(book, desired_page)
  last_index = book.size - 1

  desired_index = desired_index(book, desired_page)

  last_index - desired_index
end

def pageCount(n, p)
  last_page = n
  desired_page = p

  book = populate_book_pages(last_page)

  begining_flips = desired_index(book, desired_page)

  end_flips = compute_end_flips(book, desired_page)

  return begining_flips if begining_flips < end_flips

  end_flips
end

def test_1
  expected_result = 0
  pages = 4
  desired_page = 4

  result = pageCount(pages, desired_page)

  p "test_1 passed: #{result == expected_result}"
end

test_1
