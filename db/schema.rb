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

ActiveRecord::Schema.define(version: 20170418151000) do

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

  create_table "love_stories", force: :cascade do |t|
    t.text     "we_met"
    t.text     "first_date"
    t.text     "engagement"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_love_stories_on_event_id", using: :btree
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

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.string   "layout_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  add_foreign_key "event_images", "events"
  add_foreign_key "event_participants", "accounts", column: "participant_id"
  add_foreign_key "event_participants", "events"
  add_foreign_key "events", "themes"
  add_foreign_key "fiance_abouts", "accounts", column: "fiance_id"
  add_foreign_key "love_stories", "events"
  add_foreign_key "wedding_witness_couples", "accounts", column: "fiance_id"
end
