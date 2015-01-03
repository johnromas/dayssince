class Record < ActiveRecord::Base
  belongs_to :goal

  def up_one
  	if self.goal.status == "not-updated"
	  	self.streak += 1
	  	self.save!
      return true
    else
      return false
	  end
  end

  def down_one
  	self.streak -= 1
  	self.save!
  end
end
