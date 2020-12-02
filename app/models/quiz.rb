class Quiz < ApplicationRecord
    scope :published, -> { where("published == true")}
    # scope :completed

    has_many :questions
    belongs_to :group
    has_many :results

    def completed_by(user)
        results.any? do |r|
            r.user == user
        end
    end
end
