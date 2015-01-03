class AddStreakToRecord < ActiveRecord::Migration
  def change
  	remove_column :records, :streak
    add_column :records, :streak, :integer, default: 0
  end
end
