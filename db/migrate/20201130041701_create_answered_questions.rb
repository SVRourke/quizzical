class CreateAnsweredQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :answered_questions do |t|
      t.belongs_to :result
      t.belongs_to :question
      t.belongs_to :answer
    end
  end
end
