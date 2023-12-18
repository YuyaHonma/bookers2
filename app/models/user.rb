class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  
  validates :name, presence: true
  has_one_attached :avatar # Active Storage を使用して画像をアタッチ
  validates :introduction, length: { maximum: 500 } # 例: 最大500文字の自己紹介文
end