class User < ApplicationRecord
  has_many :books
  has_many :books, dependent: :destroy, foreign_key: :book_user_id
  has_many :book_comments,dependent: :destroy
  # フォローする・されるの関係
  has_many :relationships,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #テーブル同士を中間テーブルを使ってつなげる
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender_id: { man: 0, woman: 1}

  # フォローしたときの処理
  def follow(user_id)
   relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
   relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
   followings.include?(user)
  end
  # def get_profile_image(width, height)
  # unless profile_image.attached?
  #   file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #   profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  # end
  # profile_image.variant(resize_to_limit: [width, height]).processed
  # end
end
