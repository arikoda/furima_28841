class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password,
    length: { minimum: 6 },
    format: { with: /\A[a-z0-9]+\z/}
  validates :family_name,format: { with:/\A[ぁ-んァ-ンー-龥]/ }
  validates :first_name,format: { with:/\A[ぁ-んァ-ンー-龥]/ }
  validates :family_n_ruby,format: { with:/\A[ァ-ヶー-]+\z/ }
  validates :first_n_ruby,format: { with:/\A[ァ-ヶー-]+\z/ }
  validates :mail,format: { with:/\A\S+@\S+\.\S+\z/}

end
