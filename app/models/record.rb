class Record < ActiveRecord::Base
  belongs_to :goal

  def up_one
  	if self.updated_at < Date.today
	  	self.streak += 1
	  	self.save!
	  end
  end

  def down_one
  	self.streak -= 1
  	self.save!
  end
end
