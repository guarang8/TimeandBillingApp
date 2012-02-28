class AddHourCapToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :hour_cap, :integer, :default => 20
  end
end
