class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable, :timeoutable

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation,
                  :remember_me

  validates_presence_of :first_name, :last_name

end
