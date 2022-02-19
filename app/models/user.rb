# frozen_string_literal: true

# This model has the following table columns:
# t.string "username"
# t.string "display_name"

class User < ApplicationRecord
  validates :username, presence: true
  validates :display_name, presence: true

  with_options class_name: 'Subscription' do |assoc|
    assoc.has_many :subscribe_from_users, foreign_key: :from_user_id
    assoc.has_many :subscribe_for_users,  foreign_key: :for_user_id
  end

  with_options class_name: 'User' do |assoc|
    assoc.has_many :subscriptions, through: :subscribe_from_users,  source: :for_user
    assoc.has_many :subscribers,   through: :subscribe_for_users,   source: :from_user
  end

  def subscribe(another_user)
    return true if Subscription.from_user_id_for_user_id(self.id, another_user.id).present?

    another_user.subscribe_for_users << self.subscribe_from_users.build
  end
end
