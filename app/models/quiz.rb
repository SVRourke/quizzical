class Quiz < ApplicationRecord
    scope :ready, -> { where("published == true")}
    scope :chrono, -> { order(created_at: :desc)}

    has_many :questions
    belongs_to :group
    has_many :results
    
    validates_with QuizValidator, on: :create
    validates_with PublicationValidator, on: :update
    
    def completed_by(user)
        results.any? {|r| r.user == user}
    end

    def build_result
        r = self.results.build()
        self.questions.each {|q| r.answered_questions.build(question: q)}
        return r
    end

end
