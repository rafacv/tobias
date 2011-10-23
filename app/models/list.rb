class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy

  attr_accessible :name, :public, :tasks_attributes

  validates :name, :user_id, :presence => true
  validates :name, :uniqueness => {:scope => :user_id}
  accepts_nested_attributes_for :tasks, :allow_destroy => true,
                                :reject_if => proc { |t| t[:name].blank? }

  def private?
    not self.public
  end
end
