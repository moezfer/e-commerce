class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :phoneNumber, presence: true,format: { with: /\A\d+\z/, message: "must contain only numbers" }
  def admin?
    admin
  end
end
