class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals #ユーザーはたくさんの目標を持っている
  #nameカラム空欄禁止
  # validates :name, presence: true
end
