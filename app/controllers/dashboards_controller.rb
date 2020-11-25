class DashboardsController < ApplicationController
    def show
        if current_user.teacher?
            redirect_to educator_dashboards_path
        else
            redirect_to student_dashboards_path
        end
    end

    def student
    end

    def teacher
    end
end