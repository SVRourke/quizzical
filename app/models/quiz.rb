class Quiz < ApplicationRecord
    scope :ready, -> { where("published == true")}
    scope :chrono, -> { order(created_at: :desc)}

    has_many :questions, dependent: :delete_all
    belongs_to :group
    has_many :results, dependent: :delete_all
    has_many :notes
    
    validates_with QuizValidator, on: :create
    validates_with PublicationValidator, on: :update
    
    def completed_by(user)
        results.any? {|r| r.user == user}
    end

    def user_grade(user)
        results.where(user_id: user).first.grade()
    end

    def build_result
        r = self.results.build()
        self.questions.each {|q| r.answered_questions.build(question: q)}
        return r
    end

end
