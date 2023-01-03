def serial_average(serial)
  number_1 = serial[4, 5].to_f
  number_2 = serial[10, 5].to_f
  serial_avarage = ((number_1 + number_2)/2).round(2)

  serial_letters = serial[0, 3]

  "#{serial_letters}-%.2f" % serial_avarage
end

def test
  expected = '002-15.00'

  described = serial_average('002-10.00-20.00')

  puts("passed: #{described == expected}")
end

def test_2
  expected = '001-34.61'

  described = serial_average('001-12.43-56.78')

  puts("passed: #{described == expected}")
end

test
test_2
