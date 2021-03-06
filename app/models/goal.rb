class Goal < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
 
  has_many :records, dependent: :destroy

  validates_presence_of :title

  after_create :create_new_record

  scope :public_goals, -> { where(private: false) }

  def create_new_record
  	self.records.create
  end

  def current_record
  	self.records.find_by!(active: true)
  end

  def reset
    current_record.update(active: false)
    create_new_record
  end

  def status
    if current_record.updated_at.today? && current_record.streak != 0
      "updated"
    else
      "not-updated"
    end
  end
end
