# This model has the following table columns:
# t.bigint "from_user_id"
# t.bigint "for_user_id"

class Subscription < ApplicationRecord
  belongs_to :from_user,  class_name: 'User', foreign_key: :from_user_id
  belongs_to :for_user,   class_name: 'User', foreign_key: :for_user_id

  scope :from_user_id_for_user_id, ->(from_user_id, for_user_id) { where(from_user_id: from_user_id, for_user_id: for_user_id) }
end
