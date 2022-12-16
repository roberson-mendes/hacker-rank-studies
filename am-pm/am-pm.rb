class HourMap
    def convertHour(hour12Format)
        midDay = "12"
        midNight24Format = "00"

        return midNight24Format if midNight?(hour12Format)
        return hour12Format[:hour] if beforeMidDay?(hour12Format[:beforeAfterMidDay]) || midDay?(hour12Format)
        return (midDay.to_i + hour12Format[:hour].to_i)
    end

    private

    def beforeMidDay?(beforeAfterMidDay)
        beforeMidDay = "AM"
        beforeAfterMidDay == beforeMidDay
    end

    def midDay?(hour12Format)
        midDay12Format = {
            hour: "12",
            beforeAfterMidDay: "PM"
        }

        hour12Format == midDay12Format
    end

    def midNight?(hour12Format)
        midNight12Format = {
            hour: "12",
            beforeAfterMidDay: "AM"
        }

        hour12Format == midNight12Format
    end
end

def timeConversion(s)
    hour12Format = {
        beforeAfterMidDay: s.slice!(8..9),
        hour: s.slice!(0..1)
    }

    hour24Format = HourMap.new().convertHour(hour12Format)

    s.insert(0, hour24Format.to_s)
end

puts timeConversion("12:40:22AM")
