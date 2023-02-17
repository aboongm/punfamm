class Daily < ApplicationRecord
  belongs_to :editor, class_name: 'User', foreign_key: 'editor_id'
  has_many :news_item_dailies, dependent: :destroy
  has_many :news_items, through: :news_item_dailies

end
