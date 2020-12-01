module ApplicationHelper
    def colloquial_time_of_day
        case Time.now.strftime("%H").to_i
        when 1..11
            "morning"
        when 12..4
            "afternoon"
        when 4..0
            "evening"
        else
            'day'
        end
    end
end
