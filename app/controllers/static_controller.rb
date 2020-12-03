class StaticController < ApplicationController
    def welcome
        if logged_in?
            redirect_to dashboards_path()
        end
    end
end