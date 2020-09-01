# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

# MEMO: zaru 外部キー制約をつけた方がよさそう
#
# MEMO: zaru 各フィールドにコメントをつけると他の人の理解度が上がるかもしれない
#
# MEMO: 基本は NOT NULL or NOT NULL DEFAULT を設定する方がいいと思う
# https://ja.stackoverflow.com/questions/51677/%E3%83%95%E3%83%A9%E3%82%B0%E9%A0%85%E7%9B%AE%E3%81%AB-not-null-%E5%88%B6%E7%B4%84%E3%82%92%E4%BB%98%E4%B8%8E%E3%81%97%E3%81%AA%E3%81%84%E7%90%86%E7%94%B1/51678
ActiveRecord::Schema.define(version: 20200824084012) do

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.integer "user_id", null: false
    t.integer "note_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id"
    t.integer "group_id"
    t.index ["group_id"], name: "index_favorite_items_on_group_id"
    t.index ["user_id"], name: "index_favorite_items_on_user_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.boolean "activated", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "admin_user_id", null: false
    t.text "profile"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.string "image"
    t.integer "count"
    t.integer "user_id", null: false
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_notes_on_user_id_and_created_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "image"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
