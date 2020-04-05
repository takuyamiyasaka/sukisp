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

ActiveRecord::Schema.define(version: 2020_04_05_035004) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.integer "inquiry_id"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquiry_id"], name: "index_answers_on_inquiry_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "topick_id"
    t.integer "customer_id"
    t.text "comment"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id"
    t.index ["topick_id"], name: "index_comments_on_topick_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "public_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.datetime "deleted_at"
    t.text "self_introduction"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_entries_on_customer_id"
    t.index ["room_id"], name: "index_entries_on_room_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_valid", default: true, null: false
  end

  create_table "gest_answers", force: :cascade do |t|
    t.integer "gest_inquiry_id"
    t.text "gest_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gest_inquiry_id"], name: "index_gest_answers_on_gest_inquiry_id"
  end

  create_table "gest_inquiries", force: :cascade do |t|
    t.string "gest_name"
    t.string "gest_email"
    t.text "gest_request"
    t.boolean "unsolved", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.integer "customer_id"
    t.text "request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "unsolved", default: true, null: false
    t.boolean "is_receive", default: false, null: false
    t.string "inquiry_name"
    t.string "inquiry_email"
    t.index ["customer_id"], name: "index_inquiries_on_customer_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "topick_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_likes_on_customer_id"
    t.index ["topick_id"], name: "index_likes_on_topick_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_messages_on_customer_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "follow_id"], name: "index_relationships_on_customer_id_and_follow_id", unique: true
    t.index ["customer_id"], name: "index_relationships_on_customer_id"
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topick_images", force: :cascade do |t|
    t.string "topick_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "topick_id"
    t.time "deleted_at"
    t.index ["topick_id"], name: "index_topick_images_on_topick_id"
  end

  create_table "topicks", force: :cascade do |t|
    t.string "topick_name"
    t.text "introduction"
    t.string "topick_status"
    t.integer "genre_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "deleted_at"
    t.integer "impressions_count"
    t.index ["customer_id"], name: "index_topicks_on_customer_id"
    t.index ["genre_id"], name: "index_topicks_on_genre_id"
  end

  create_table "update_contacts", force: :cascade do |t|
    t.text "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
