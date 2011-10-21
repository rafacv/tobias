class Task < ActiveRecord::Base
  belongs_to :list

  validates :name, :list_id, :presence => true
end
