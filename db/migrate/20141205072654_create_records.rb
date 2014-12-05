class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :count, default: 1
      t.references :goal, index: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
