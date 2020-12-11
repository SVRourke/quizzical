module NavigationHelper
    def user_greeting
        if logged_in?
            "Good #{colloquial_time_of_day}, #{current_user.first_name}"
        else
            "Welcome to Quizzical"   
        end
    end

    def colloquial_time_of_day
        case Time.now.strftime("%H").to_i
        when 1..11
            "Morning"
        when 12..16
            "Afternoon"
        when 16..24
            "Evening"
        else
            'Day'
        end
    end
end