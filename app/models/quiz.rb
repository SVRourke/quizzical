class Quiz < ApplicationRecord
    scope :ready, -> { where("published == true")}
    scope :chrono, -> { order(created_at: :desc)}

    has_many :questions
    belongs_to :group
    has_many :results
    
    validates_with QuizValidator
    
    def completed_by(user)
        results.any? do |r|
            r.user == user
        end
    end
end
