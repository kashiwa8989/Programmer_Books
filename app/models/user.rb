class User < ApplicationRecord
  has_many :books
  has_many :books, dependent: :destroy, foreign_key: :user_id
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

  validates :name, presence: true
  validates :email, presence: true
  validates :gender_id, presence: true
  validates :birthday, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, length: { minimum: 6 }, on: :create


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
end
