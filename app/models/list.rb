class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy

  attr_accessible :name, :public, :tasks_attributes

  validates :name, :user_id, :presence => true
  validates :name, :uniqueness => {:scope => :user_id}

  accepts_nested_attributes_for :tasks, :allow_destroy => true,
                                :reject_if => proc { |t| t[:name].blank? }

  @@rows_per_page = 10

  scope :newest_first, order("created_at desc")
  scope :more_recently_updated, order("updated_at desc")
  scope :publicly_visible, where(public: true)
  scope :paginate, proc { |page|
    page = page.to_i
    {offset: page * @@rows_per_page, limit: @@rows_per_page}
  }

  def private?
    not self.public
  end

  def owned_by?(user)
    self.user_id == user.id
  end
end
