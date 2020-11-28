class Result < ApplicationRecord
    
    belongs_to :quiz
    belongs_to :user
    
    has_many :user_answers
    has_many :answers, through: :user_answers
    accepts_nested_attributes_for :answers

    def grade
        correct_answers = answers.where(correct_answer: true).count
        return (correct_answers.to_f / answers.count.to_f) * 100
    end
 
end