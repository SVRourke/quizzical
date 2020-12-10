class QuizValidator < ActiveModel::Validator
    def validate(record)
        if record.group.quizzes.collect {|q| q.name == record.name}
            record.errors[:quiz] << "already exists for #{record.group.name}"
        end
    end
end