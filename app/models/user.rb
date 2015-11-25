class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :employees
  has_many :leaves
  has_many :holidays
  has_many :hardwares
  has_many :salaries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
