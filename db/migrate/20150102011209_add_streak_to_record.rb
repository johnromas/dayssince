class AddStreakToRecord < ActiveRecord::Migration
  def change
    add_column :records, :streak, :integer, default: 0
  end
end
