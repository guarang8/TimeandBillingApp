class AddHoursToJournalEntry < ActiveRecord::Migration
  def change
    add_column :journal_entries, :hours, :decimal
  end
end
