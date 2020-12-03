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

    def student_results_count(quiz)
        result_count = quiz.results.count
        result_count == 1 ? stub = "1 Student has" : stub = "#{result_count} Students have"
        return "#{stub} taken this quiz."
    end



end