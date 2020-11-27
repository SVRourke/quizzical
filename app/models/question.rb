class Question < ApplicationRecord
    belongs_to :quiz
    has_many :answers
    accepts_nested_attributes_for :answers
end
