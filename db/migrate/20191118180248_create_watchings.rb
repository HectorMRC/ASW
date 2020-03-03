class CreateWatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :watchings do |t|
      t.integer :user_id
      t.integer :issue_id

      t.timestamps
    end
  end
end
