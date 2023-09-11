class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :menus, dependent: :destroy


  has_many :likes, dependent: :destroy
  has_many :liked_menus, through: :likes, source: :menu
  

  def already_liked?(menu)
    self.likes.exists?(menu_id: menu.id)
  end
end
