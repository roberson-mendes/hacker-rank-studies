def process_text(texts)
  texts.map { |text| text.strip }.join(" ")
end

######################################################################---TESTS
def test
  expected = "Hi, Are you having fun?"

  described = process_text(["Hi, \n", " Are you having fun?    "])

  puts("passed: #{described == expected}")
end

test
