class AddBookApiId < ActiveRecord::Migration[6.1]
  def change
    add_column :favorite_books, :bookapiid, :string 
  end
end
