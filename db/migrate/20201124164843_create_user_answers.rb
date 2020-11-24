class CreateUserAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_answers do |t|
      t.belongs_to :result
      t.belongs_to :answer
      t.timestamps
    end
  end
end
