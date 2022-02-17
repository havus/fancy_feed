class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def up
    create_table :subscriptions do |t|
      t.bigint :subscriber_user_id
      t.bigint :subscribed_user_id

      t.timestamps
    end

    add_index :subscriptions, :subscriber_user_id
    add_index :subscriptions, :subscribed_user_id
    add_index(
      :subscriptions,
      [:subscriber_user_id, :subscribed_user_id],
      unique: true,
      name: :index_subscriptions_on_subscriber_and_subscribed_user_id
    )
  end

  def down
    drop_table :subscriptions
  end
end
