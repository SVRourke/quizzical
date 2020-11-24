class CreateGroupAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :group_admins do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.timestamps
    end
  end
end
