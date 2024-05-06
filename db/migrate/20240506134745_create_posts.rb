class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :title
      t.text :body
      t.integer :comments_ounter, default: 0
      t.integer :rates_ounter, default: 0

      t.timestamps
    end
  end
end
