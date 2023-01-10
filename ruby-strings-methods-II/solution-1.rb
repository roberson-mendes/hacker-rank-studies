def mask_article(text, replacement_texts)
  replacement_texts.each { |replacement| text.gsub!(replacement, strike(replacement)) }

  text
end

def strike(text)
  open_strike = "<strike>"
  close_strike = "</strike>"

  text.dup.prepend(open_strike).concat(close_strike)
end

######################################################################---TESTS

def test_1
  expected = "Hello World! This is <strike>crap</strike>!"

  described = mask_article("Hello World! This is crap!", ["crap"])

  puts("passed: #{expected == described}")
end

test_1
