class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.integer :userCreator
      t.integer :idUserAssignee
      t.string :issueType
      t.string :title
      t.string :description
      t.string :priority
      t.string :status
      t.integer :votes
      t.date :creationDate
      t.date :updated

      t.timestamps
    end
  end
end
