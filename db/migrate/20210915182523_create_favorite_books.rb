class CreateFavoriteBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_books do |t|
      t.string :title 
      t.string :author_name
      t.string :external_id
      t.integer :user_id
      t.timestamps
    end
  end
end
