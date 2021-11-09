class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :cooking_name
      t.string :cooking_image_id
      t.string :shop_name
      t.string :address
      t.string :comment
      t.string :user_id

      t.timestamps
    end
  end
end
