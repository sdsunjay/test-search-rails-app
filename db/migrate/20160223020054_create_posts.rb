class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.references :to, index: true, foreign_key: true
      t.references :from, index: true, foreign_key: true
      t.datetime :when
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
