class BookListPublic < ActiveRecord::Migration[6.1]
  def change
    add_column :book_lists, :public, :boolean, default: :false
  end
end
