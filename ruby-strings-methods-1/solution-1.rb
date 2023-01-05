def process_text(txt_collection)
  removes_text_spaces = -> do
      txt_collection.each do |txt|
          txt.chomp!
          txt.strip!
      end
  end

  removes_text_spaces.call

  txt_collection.join(" ")
end

######################################################################---TESTS
def test
  expected = "Hi, Are you having fun?"

  described = process_text(["Hi, \n", " Are you having fun?    "])

  puts("passed: #{described == expected}")
end

test
