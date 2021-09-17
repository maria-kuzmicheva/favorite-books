class AddisbnfieldtoFavoriteBook < ActiveRecord::Migration[6.1]
  def change
    add_column :favorite_books, :isbn, :string 
  end
end
