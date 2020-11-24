class Result < ApplicationRecord
    belongs_to :quiz
    belongs_to :user
    
    has_many :user_answers
    has_many :answers, through: :user_answers
 
end