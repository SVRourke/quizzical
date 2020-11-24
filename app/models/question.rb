class Question < ApplicationRecord
    belongs_to :quiz
    has_many :answers
end
