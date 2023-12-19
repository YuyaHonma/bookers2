class Book < ApplicationRecord
  belongs_to :user
 # 画像をアタッチしない場合、以下の行は不要
  has_one_attached :image
 # Active Storageを使用して画像をアップロード
  
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 1000 } # 1000文字までの制限（適宜変更可能）

  # 他のモデルとのリレーションやメソッドを定義する場合はここに記述
end