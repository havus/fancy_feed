# This model has the following table columns:
# t.string "title"
# t.text "content"
# t.bigint "user_id"

class Article < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  validates_presence_of :title, :content
end
