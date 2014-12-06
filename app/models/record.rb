class Record < ActiveRecord::Base
  belongs_to :goal

  def up_one
  	self.count += 1
  	self.save!
  end

  def down_one
  	self.count -= 1
  	self.save!
  end
end
