class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  has_many :lists
  has_many :tasks, :through => :lists
  has_many :tasks_due_today, :source => :tasks, :through => :lists,
           :conditions => proc { "date(due_on) = '#{Date.today.to_s(:db)}'" }
end
