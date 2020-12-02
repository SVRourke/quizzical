module GroupHelper
    def unattempted_quizzes(group, user)
        group.quizzes.ready.filter do |q| 
            !q.results.find_by(user: user)
        end
    end

    def finished_quizzes(group, user)
        group.quizzes.ready.filter do |q| 
            q.results.find_by(user: user)
        end
    end

end