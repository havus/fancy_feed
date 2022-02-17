class CreateArticles < ActiveRecord::Migration[6.0]
  def up
    create_table :articles do |t|
      t.string  :title
      t.text    :content
      t.bigint  :user_id

      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end
