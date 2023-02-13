class NewsItem < ApplicationRecord
  belongs_to :reporter, class_name: 'User', foreign_key: 'reporter_id'

  delegate :role, to: :reporter, prefix: true

  validates :headline, presence: :true
  validates :content, presence: :true
  validates :date, presence: :true  
end
