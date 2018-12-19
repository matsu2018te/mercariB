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






ActiveRecord::Schema.define(version: 20181219072245) do


  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "postal_code",    null: false
    t.string   "prefecture",     null: false
    t.string   "municipality",   null: false
    t.string   "address_number", null: false
    t.string   "building_name"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end





  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.string   "product_name",                     null: false
    t.text     "product_info",       limit: 65535, null: false
    t.integer  "price",                            null: false
    t.string   "product_state",                    null: false
    t.string   "delivery_fee_owner",               null: false
    t.datetime "delivery_date",                    null: false
    t.string   "shipping_method",                  null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["buyer_id"], name: "index_products_on_buyer_id", using: :btree
    t.index ["seller_id"], name: "index_products_on_seller_id", using: :btree



  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "card_number",     null: false
    t.integer  "expiration_date", null: false
    t.integer  "security_code",   null: false

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "security_code",    null: false

    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "expiration_month", null: false
    t.integer  "expiration_year",  null: false
    t.string   "card_number"
    t.index ["user_id"], name: "index_credits_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname",                                          null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "last_name_phonetic",                                null: false
    t.string   "icon_picture"
    t.text     "profile",                limit: 65535
    t.string   "background_image"
    t.integer  "point"
    t.string   "first_name_phonetic"
    t.string   "telephone",                                         null: false
    t.integer  "birth_year",                                        null: false
    t.integer  "birth_month",                                       null: false
    t.integer  "birth_day",                                         null: false



    t.integer  "seller_id"
    t.integer  "buyer_id"

    t.string   "provider"
    t.string   "uid"
    t.string   "token"


    t.string   "provider"
    t.string   "uid"
    t.string   "token"





    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"


  add_foreign_key "images", "products"
  add_foreign_key "products", "users", column: "buyer_id"
  add_foreign_key "products", "users", column: "seller_id"

  add_foreign_key "credit_cards", "users"


  add_foreign_key "credit_cards", "users"


  add_foreign_key "credit_cards", "users"


  add_foreign_key "credits", "users"

end
