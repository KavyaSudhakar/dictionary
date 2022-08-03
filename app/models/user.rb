class User < ApplicationRecord
  #scope :search, ->(key) {User.where("words LIKE ?","%"+key+"%")}      
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
end
