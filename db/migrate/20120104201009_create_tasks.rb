class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.decimal :rate
      t.boolean :billable

      t.timestamps
    end
  end
end
