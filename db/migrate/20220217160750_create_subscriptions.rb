class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def up
    create_table :subscriptions do |t|
      t.bigint :from_user_id
      t.bigint :for_user_id # subscribers

      t.timestamps
    end

    add_index :subscriptions, :from_user_id
    add_index :subscriptions, :for_user_id
    add_index(
      :subscriptions,
      [:from_user_id, :for_user_id],
      unique: true,
      name: :index_subscriptions_on_from_and_for_user_id
    )
  end

  def down
    drop_table :subscriptions
  end
end
