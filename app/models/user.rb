class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true  do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
    validates :family_n_ruby, format: { with: /\A[ァ-ヶー-]+\z/ }
    validates :first_n_ruby, format: { with: /\A[ァ-ヶー-]+\z/ }
    validates :birthday
  end

  validates :password, format: { with: /\A[a-z0-9]+\z/ }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
end
