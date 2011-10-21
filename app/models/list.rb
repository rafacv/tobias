class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :name, :presence => true
  validates_associated :user
end
