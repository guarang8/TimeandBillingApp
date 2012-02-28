class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :description
      t.date :entered_at
      t.integer :task_id

      t.timestamps
    end
  end
end
