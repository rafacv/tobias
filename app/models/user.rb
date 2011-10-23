class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
                  :avatar, :remote_avatar_url
  attr_accessor :login

  has_many :lists, :dependent => :destroy
  has_many :tasks, :through => :lists
  has_many :unfinished_tasks_due_today, :source => :tasks, :through => :lists, :include => :list,
           :conditions => proc { "finished = false and date(due_on) = '#{Date.today.to_s(:db)}'" },
           :order => :list_id

  validates :username, :presence => true, :uniqueness => true

  protected
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where("lower(username) = :login OR lower(email) = :login", login: login.downcase).first
  end
end
