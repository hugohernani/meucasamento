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

ActiveRecord::Schema.define(version: 20170430013222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "social_name"
    t.index ["email"], name: "index_accounts_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  end

  create_table "accounts_roles", id: false, force: :cascade do |t|
    t.integer "account_id"
    t.integer "role_id"
    t.index ["account_id", "role_id"], name: "index_accounts_roles_on_account_id_and_role_id", using: :btree
  end

  create_table "assets", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "attachment_file_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.index ["owner_type", "owner_id"], name: "index_assets_on_owner_type_and_owner_id", using: :btree
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "wedding_support_id"
    t.string   "name"
    t.string   "bank"
    t.string   "agency"
    t.string   "account"
    t.string   "operation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["wedding_support_id"], name: "index_bank_accounts_on_wedding_support_id", using: :btree
  end

  create_table "donations", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",           precision: 10, scale: 2
    t.text     "description"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "wedding_list_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_donations_on_product_id", using: :btree
    t.index ["wedding_list_id"], name: "index_donations_on_wedding_list_id", using: :btree
  end

  create_table "event_images", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.index ["event_id"], name: "index_event_images_on_event_id", using: :btree
  end

  create_table "event_participants", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "participant_id"
    t.integer  "event_role"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["event_id"], name: "index_event_participants_on_event_id", using: :btree
    t.index ["participant_id"], name: "index_event_participants_on_participant_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.integer  "event_type",       default: 0
    t.datetime "celebration_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "tenant_name"
    t.integer  "theme_id"
    t.index ["theme_id"], name: "index_events_on_theme_id", using: :btree
  end

  create_table "fiance_abouts", force: :cascade do |t|
    t.text     "content"
    t.integer  "fiance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fiance_id"], name: "index_fiance_abouts_on_fiance_id", using: :btree
  end

  create_table "fun_facts", force: :cascade do |t|
    t.integer  "invited_people_count"
    t.integer  "involved_people_count"
    t.integer  "worked_hours"
    t.integer  "cups_of_coffee_count"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "event_id"
    t.index ["event_id"], name: "index_fun_facts_on_event_id", using: :btree
  end

  create_table "love_stories", force: :cascade do |t|
    t.text     "we_met"
    t.text     "first_date"
    t.text     "engagement"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_love_stories_on_event_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "donation_id"
    t.integer  "price"
    t.string   "status"
    t.string   "buyer_name"
    t.string   "reference"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["donation_id"], name: "index_orders_on_donation_id", using: :btree
  end

  create_table "product_handlings", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "buyer_name"
    t.string   "phone_number"
    t.datetime "bought_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["product_id"], name: "index_product_handlings_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "store_id"
    t.string   "name"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["store_id"], name: "index_products_on_store_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "wedding_list_id"
    t.string   "name"
    t.text     "address"
    t.string   "phone_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "no_products"
    t.text     "instructions"
    t.index ["wedding_list_id"], name: "index_stores_on_wedding_list_id", using: :btree
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.string   "layout_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wedding_lists", force: :cascade do |t|
    t.integer  "wedding_support_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["wedding_support_id"], name: "index_wedding_lists_on_wedding_support_id", using: :btree
  end

  create_table "wedding_parents", force: :cascade do |t|
    t.integer  "fiance_id"
    t.string   "father_name"
    t.text     "father_description"
    t.string   "mother_name"
    t.text     "mother_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["fiance_id"], name: "index_wedding_parents_on_fiance_id", using: :btree
  end

  create_table "wedding_supports", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "message"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "donations_message"
    t.text     "gifts_message"
    t.text     "deposit_message"
    t.text     "deposit_call_message"
    t.text     "donations_call_message"
    t.text     "gifts_call_message"
    t.index ["event_id"], name: "index_wedding_supports_on_event_id", using: :btree
  end

  create_table "wedding_witness_couples", force: :cascade do |t|
    t.string   "male_name"
    t.text     "male_description"
    t.string   "female_name"
    t.text     "female_description"
    t.integer  "fiance_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["fiance_id"], name: "index_wedding_witness_couples_on_fiance_id", using: :btree
  end

  add_foreign_key "bank_accounts", "wedding_supports"
  add_foreign_key "donations", "products"
  add_foreign_key "donations", "wedding_lists"
  add_foreign_key "event_images", "events"
  add_foreign_key "event_participants", "accounts", column: "participant_id"
  add_foreign_key "event_participants", "events"
  add_foreign_key "events", "themes"
  add_foreign_key "fiance_abouts", "accounts", column: "fiance_id"
  add_foreign_key "fun_facts", "events"
  add_foreign_key "love_stories", "events"
  add_foreign_key "orders", "donations"
  add_foreign_key "product_handlings", "products"
  add_foreign_key "products", "stores"
  add_foreign_key "stores", "wedding_lists"
  add_foreign_key "wedding_lists", "wedding_supports"
  add_foreign_key "wedding_parents", "accounts", column: "fiance_id"
  add_foreign_key "wedding_supports", "events"
  add_foreign_key "wedding_witness_couples", "accounts", column: "fiance_id"
end
