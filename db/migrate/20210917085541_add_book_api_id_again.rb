class AddBookApiIdAgain < ActiveRecord::Migration[6.1]
  def change
    add_column :favorite_books, :book_api_id, :string 

  end
end
