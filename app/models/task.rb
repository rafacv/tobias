class Task < ActiveRecord::Base
  belongs_to :list

  attr_accessible :name, :finished, :due_on

  validates :name, :presence => true, :uniqueness => {:scope => :list_id}
end
