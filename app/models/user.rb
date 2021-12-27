class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy

  def author_of?(current_user)
    current_user.present? && self.id == current_user.id
  end
end
