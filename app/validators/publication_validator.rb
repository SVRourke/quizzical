class PublicationValidator < ActiveModel::Validator
    def validate(record)
        unless record.questions.count >= 1
            record.errors[:questions] << "A quiz must have at least one question to be published."
        end
    end
end