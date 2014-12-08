class ChangeCountToStreakForRecords < ActiveRecord::Migration
  def change
  	rename_column :records, :count, :streak
  end
end
