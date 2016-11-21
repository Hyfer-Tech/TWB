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

ActiveRecord::Schema.define(version: 20161121085536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brokers", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.text     "description"
    t.string   "phone",                                  null: false
    t.string   "firm_name",                              null: false
    t.string   "address_line_1",                         null: false
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city",                                   null: false
    t.string   "zip_postal_code",                        null: false
    t.string   "state_province_county",                  null: false
    t.string   "country",                                null: false
    t.string   "specialty",                              null: false
    t.string   "past_experience"
    t.integer  "service_rates",                          null: false
    t.string   "avatar"
    t.string   "broker_number",                          null: false
    t.boolean  "verified_flag",          default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_brokers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_brokers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "business_users", force: :cascade do |t|
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
    t.string   "business_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.text     "description"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "state_province_county"
    t.string   "country"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.integer  "account_type"
    t.index ["email"], name: "index_business_users_on_email", unique: true, using: :btree
    t.index ["first_name"], name: "index_business_users_on_first_name", using: :btree
    t.index ["last_name"], name: "index_business_users_on_last_name", using: :btree
    t.index ["reset_password_token"], name: "index_business_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.string   "followable_type",                 null: false
    t.integer  "followable_id",                   null: false
    t.string   "follower_type",                   null: false
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
    t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
  end

  create_table "forward_freights", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "phone"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "zip_postal_code"
    t.string   "state_province_county"
    t.string   "country"
    t.integer  "service_rates"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_forward_freights_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_forward_freights_on_reset_password_token", unique: true, using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.boolean  "taxable",          default: false, null: false
    t.string   "featured_image"
    t.boolean  "available",        default: false, null: false
    t.string   "price"
    t.string   "compare_at_price"
    t.bigint   "product_code"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "business_user_id"
    t.float    "height"
    t.float    "width"
    t.float    "grams"
    t.index ["business_user_id"], name: "index_products_on_business_user_id", using: :btree
  end

  create_table "shipment_limits", force: :cascade do |t|
    t.integer  "amount"
    t.string   "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipment_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "shipment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "quantity"
  end

  create_table "shipments", force: :cascade do |t|
    t.boolean  "approval",           default: false, null: false
    t.boolean  "shipment_confirmed", default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "business_user_id"
    t.index ["business_user_id"], name: "index_shipments_on_business_user_id", using: :btree
  end

  create_table "user_limits", force: :cascade do |t|
    t.integer  "amount"
    t.string   "user_type"
    t.integer  "limit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
