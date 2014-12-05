class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :records

  validates_presence_of :title

  after_create :create_initial_record

  def create_initial_record
  	self.records.create
  end

end
