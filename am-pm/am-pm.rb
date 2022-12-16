class HourMap
    def to_24_format(hour12Format)
        midDay = "12"
        midNight24Format = "00"

        return midNight24Format if midNight?(hour12Format)
        return hour12Format[:hour] if beforeMidDay?(hour12Format[:am_pm_symbol]) || midDay?(hour12Format)
        return (midDay.to_i + hour12Format[:hour].to_i)
    end

    private

    def midNight?(hour12Format)
        midNight12Format = {
            hour: "12",
            am_pm_symbol: "AM"
        }

        hour12Format == midNight12Format
    end

    def beforeMidDay?(am_pm_symbol)
        beforeMidDay = "AM"
        am_pm_symbol == beforeMidDay
    end

    def midDay?(hour12Format)"00:40:22"
        midDay12Format = {
            hour: "12",
            am_pm_symbol: "PM"
        }

        hour12Format == midDay12Format
    end
end

def slice_hour_representation(str)
    init_am_pm = 8
    end_am_pm = 9
    {
        am_pm_symbol: str.slice!(init_am_pm..end_am_pm),
        hour: str.slice!(0..1)
    }
end

def timeConversion(s)
    hour12Format = slice_hour_representation(s)

    hour24Format = HourMap.new().to_24_format(hour12Format)

    s.insert(0, hour24Format.to_s)
end

def test
    time_to_convert = "12:40:22AM"
    expected_result = "00:40:22"
    puts (timeConversion(time_to_convert) == expected_result)
end

test
