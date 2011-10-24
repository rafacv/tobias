class Watchlist < ActiveRecord::Base
  has_one :user
  has_one :list

  attr_accessible :list_id, :user_id
  validates :list_id, :uniqueness => {:scope => :user_id}

  validate :list_owner_cannot_watch, :watched_list_cannot_be_private

  # Validation method
  # Check user's ownership relative to the list
  # returning false in case she owns it.
  # She should not watch a list of hers.
  def list_owner_cannot_watch
    if List.find(self.list_id).user == User.find(self.user_id)
      errors.add(:base, "List owner cannot add it to watchlist")
    end
  end

  # Validation method
  # Fails if list is private, since no private list
  # can be watched by others
  def watched_list_cannot_be_private
    errors.add(:base, "Private list cannot be watched") if List.find(self.list_id).private?
  end
end
