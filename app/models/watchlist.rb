class Watchlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  attr_accessible :list_id, :user_id
  validates :list_id, :uniqueness => {:scope => :user_id}

  validate :list_owner_cannot_watch, :watched_list_cannot_be_private

  # Validation method
  # Check user's ownership relative to the list
  # returning false in case she owns it.
  # She should not watch a list of hers.
  def list_owner_cannot_watch
    if self.list.user == self.user
      errors.add(:base, "List owner cannot add it to watchlist")
    end
  end

  # Validation method
  # Fails if list is private, since no private list
  # can be watched by others
  def watched_list_cannot_be_private
    errors.add(:base, "Private list cannot be watched") if self.list.private?
  end
end
