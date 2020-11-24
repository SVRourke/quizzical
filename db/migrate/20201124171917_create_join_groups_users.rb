class CreateJoinGroupsUsers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :groups, :users
  end
end
