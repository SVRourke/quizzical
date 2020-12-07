class ResultValidator < ActiveModel::Validator
    def validate(record)
        if record.user.results.where(quiz: record.quiz).any?
            record.errors[:name] << "You have already completed this quiz."
        end     
    end
end