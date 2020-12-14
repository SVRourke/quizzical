class QuizValidator < ActiveModel::Validator
    def validate(record)
        unless record.group.quizzes.none? {|q| q.name == record.name}
            record.errors[:quiz] << "Quiz already exists for #{record.group.name}"
        end
    end
end