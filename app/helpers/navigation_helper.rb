module NavigationHelper
    def user_greeting(user)
        "Good #{colloquial_time_of_day}, #{user.first_name}"   
    end
end