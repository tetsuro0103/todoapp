class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy

 def has_written?(board)
    boards.exists?(id: board.id)
  end

  def display_name
    self.email.split('@').first
  end
  
  def avatar_image
    'default-avatar.png'
  end

end
