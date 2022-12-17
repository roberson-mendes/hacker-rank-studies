class HourMap
    def self.to_24_format(hour_12_format)
        mid_night_24_format = "00"
        mid_day_24_format = "12"
        hour = hour_12_format[:hour]

        case hour_12_format
            when mid_night
                mid_night_24_format
            when mid_day
                mid_day_24_format
            when before_mid_day(hour_12_format)
                hour
            else
                to_24 = -> (hour_12_format) { mid_day.to_i + hour_12_format.to_i }
                to_24.call(hour_12_format[:hour])
        end
    end

    private

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

    def self.before_mid_day(hour_12_format)
        proc { |hour_12_format| hour_12_format[:am_pm_symbol] == "AM"}
    end
end

def slice_hour_representation(str)
    init_am_pm_string = 8
    end_am_pm_string = 9
    {
        am_pm_symbol: str.slice!(init_am_pm_string..end_am_pm_string),
        hour: str.slice!(0..1)
    }
end

def timeConversion(s)
    hour_12_format = slice_hour_representation(s)

    hour24Format = HourMap.to_24_format(hour_12_format)

    s.insert(0, hour24Format.to_s)
end

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
