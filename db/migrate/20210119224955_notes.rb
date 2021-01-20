class Notes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :content
      t.references :quiz
      t.references :user
    end
  end
end
