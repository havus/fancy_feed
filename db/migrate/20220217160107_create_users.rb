class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :username
      t.string :display_name

      t.timestamps
    end

    add_index :users, :username, unique: true
  end

  def down
    drop_table :users
  end
end
