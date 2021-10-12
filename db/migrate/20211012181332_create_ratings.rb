class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.belongs_to :user
      t.belongs_to :favorite_book
      t.timestamps
    end
  end
end
