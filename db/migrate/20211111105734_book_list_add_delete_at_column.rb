class BookListAddDeleteAtColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :book_lists, :deleted_at, :datetime
    add_index  :book_lists, :deleted_at
  end
end
