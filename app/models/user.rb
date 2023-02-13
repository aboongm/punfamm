class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:reporter, :editor, :subscriber]

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 8 }, allow_nil: true
  validates :role, presence: true

  has_many :news_items, foreign_key: 'reporter_id', class_name: 'NewsItem', dependent: :destroy
end
