class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table   :comments do |t|
      t.string     :content
      t.belongs_to :user
      t.belongs_to :favorite_book
      t.integer    :parent_id
      t.timestamps
    end
  end
end
