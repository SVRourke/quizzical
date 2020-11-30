class Result < ApplicationRecord
    belongs_to :quiz
    belongs_to :user

    has_many :answered_questions
    has_many :questions, through: :answered_questions
    has_many :answers, through: :answered_questions

    accepts_nested_attributes_for :answered_questions
 
end