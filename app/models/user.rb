class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A[a-z0-9]+\z/ }
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
  validates :family_n_ruby, presence: true, format: { with: /\A[ァ-ヶー-]+\z/ }
  validates :first_n_ruby, presence: true, format: { with: /\A[ァ-ヶー-]+\z/ }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :birthday, presence: true
end


