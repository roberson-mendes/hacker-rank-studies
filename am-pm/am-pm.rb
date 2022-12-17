# Given a time in 12-hour AM/PM format, convert it to military (24-hour) time.

# Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
# - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.

class HourMap
    def self.to_24_format(hour_12_format)
        hour_symbols = slice_hour_symbols(hour_12_format)
        mid_night_24_format = "00"
        mid_day_24_format = "12"
        hour = hour_symbols[:hour]

        case hour_symbols
            when mid_night
                mid_night_24_format
            when mid_day
                mid_day_24_format
            when before_mid_day(hour_symbols)
                hour
            else
                to_24 = -> (hour_symbols) { mid_day.to_i + hour_symbols.to_i }
                to_24.call(hour_symbols[:hour])
        end
    end

    private

    def self.slice_hour_symbols(str)
        init_am_pm_string = 8
        end_am_pm_string = 9
        {
            am_pm_symbol: str.slice!(init_am_pm_string..end_am_pm_string),
            hour: str.slice!(0..1)
        }
    end

    def self.mid_day
        mid_day_12_format = {
            hour: "12",
            am_pm_symbol: "PM"
        }
    end

    def self.mid_night
        mid_night_12_format = {
            hour: "12",
            am_pm_symbol: "AM"
        }
    end

    def self.before_mid_day(hour_symbols)
        proc { |hour_symbols| hour_symbols[:am_pm_symbol] == "AM"}
    end
end

#
# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def timeConversion(s)
    hour_12_format = s

    hour24Format = HourMap.to_24_format(hour_12_format)

    s.insert(0, hour24Format.to_s)
end

######################################################################---TESTS
def test_mid_night
    time_to_convert = "12:40:22AM"
    expected_result = "00:40:22"

    function_result = timeConversion(time_to_convert)

    puts ("passed: #{function_result == expected_result}")
end

def test_mid_day
    time_to_convert = "12:40:22PM"
    expected_result = "12:40:22"

    function_result = timeConversion(time_to_convert)

    puts ("passed: #{function_result == expected_result}")
end

def test_before_mid_day
    time_to_convert = "08:40:22AM"
    expected_result = "08:40:22"

    function_result = timeConversion(time_to_convert)

    puts ("passed: #{function_result == expected_result}")
end

test_mid_night
test_mid_day
test_before_mid_day
