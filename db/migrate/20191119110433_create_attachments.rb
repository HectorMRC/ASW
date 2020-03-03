class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.integer :idIssue
      t.string :file

      t.timestamps
    end
  end
end
