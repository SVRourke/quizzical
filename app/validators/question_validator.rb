class QuestionValidator < ActiveModel::Validator
    def validate(record)
        # may only have 1 right answer
        if record.answers.count {|x| x.correct_answer} > 1
            record.errors[:answers] << "A question may only have 1 correct answer!"
        end
        15.times {puts record.answers.count}
        # record.errors[:answers] << "Question must have 4 answers."

        # content unique for a given quiz
        if record.quiz.questions.any? {|q| q.content == record.content }
            record.errors[:question] << "This question has already been added to this quiz."
        end

    end
end