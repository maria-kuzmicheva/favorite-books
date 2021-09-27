# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_27_180226) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "favorite_book_id"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favorite_book_id"], name: "index_comments_on_favorite_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_books", force: :cascade do |t|
    t.string "title"
    t.string "author_name"
    t.string "external_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "isbn"
    t.string "book_api_id"
  end

  create_table "favorite_books_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "favorite_book_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "nickname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
