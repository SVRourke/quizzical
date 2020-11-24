class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps

    end
  end
end
