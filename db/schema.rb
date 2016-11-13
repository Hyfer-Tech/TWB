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

ActiveRecord::Schema.define(version: 20161113115305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brokers", force: :cascade do |t|
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
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.text     "description"
    t.string   "phone",                               null: false
    t.string   "firm_name",                           null: false
    t.string   "address_line_1",                      null: false
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city",                                null: false
    t.integer  "zip_postal_code",                     null: false
    t.string   "state_province_county",               null: false
    t.string   "country",                             null: false
    t.string   "specialty",                           null: false
    t.string   "past_experience"
    t.integer  "service_rates",                       null: false
    t.string   "avatar"
    t.string   "broker_number",                       null: false
    t.boolean  "verified_flag"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_business_users_on_email", unique: true, using: :btree
    t.index ["first_name"], name: "index_business_users_on_first_name", using: :btree
    t.index ["last_name"], name: "index_business_users_on_last_name", using: :btree
    t.index ["reset_password_token"], name: "index_business_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.boolean  "taxable"
    t.string   "featured_image"
    t.boolean  "available"
    t.string   "price"
    t.integer  "grams"
    t.string   "compare_at_price"
    t.bigint   "product_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "shipment_id",      default: 0, null: false
    t.integer  "quantity",         default: 0, null: false
    t.index ["shipment_id"], name: "index_products_on_shipment_id", using: :btree
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "broker_id"
    t.integer  "forward_freight_id"
    t.boolean  "approval"
    t.boolean  "shipment_confirmed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["broker_id"], name: "index_shipments_on_broker_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "phone"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "zip_or_postcode"
    t.string   "state_province_county"
    t.string   "country"
    t.text     "other_address_details"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["first_name"], name: "index_users_on_first_name", using: :btree
    t.index ["last_name"], name: "index_users_on_last_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
