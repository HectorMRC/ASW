class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :issue_id
      t.string :text

      t.timestamps
    end
  end
end
