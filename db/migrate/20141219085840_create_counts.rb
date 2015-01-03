class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.references :record, index: true

      t.timestamps
    end
  end
end

#Goal has many records
#Record has many talleys?