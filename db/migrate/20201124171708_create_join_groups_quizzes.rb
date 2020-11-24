class CreateJoinGroupsQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :groups, :quizzes
  end
end
