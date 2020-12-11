class ResultValidator < ActiveModel::Validator
    def validate(record)
        if record.user.results.where(quiz: record.quiz).any?
            record.errors[:name] << "You have already completed this quiz."
        end

        if record.answered_questions.any? {|aq| aq.answer_id.nil?}
            record.errors[:questions] << "You must answer every question before submitting."
        end
    end
end