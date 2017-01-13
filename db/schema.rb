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

ActiveRecord::Schema.define(version: 20170113101709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "audits", force: :cascade do |t|
    t.string   "nafta_certificate"
    t.string   "canada_customs"
    t.integer  "business_user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["business_user_id"], name: "index_audits_on_business_user_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "bidder_id"
    t.integer  "job_id"
    t.string   "bidder_type"
    t.boolean  "accepted",     default: false
    t.text     "cover_letter"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.float    "price"
    t.index ["bidder_id", "accepted"], name: "index_bids_on_bidder_id_and_accepted", using: :btree
    t.index ["bidder_id"], name: "index_bids_on_bidder_id", using: :btree
    t.index ["job_id", "accepted"], name: "index_bids_on_job_id_and_accepted", using: :btree
    t.index ["job_id"], name: "index_bids_on_job_id", using: :btree
  end

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "account_type",           default: 0
    t.jsonb    "settings",               default: {},    null: false
    t.index ["confirmation_token"], name: "index_brokers_on_confirmation_token", unique: true, using: :btree
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "zip_postal_code"
    t.string   "files"
    t.jsonb    "settings",               default: {}, null: false
    t.index ["confirmation_token"], name: "index_business_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_business_users_on_email", unique: true, using: :btree
    t.index ["first_name"], name: "index_business_users_on_first_name", using: :btree
    t.index ["last_name"], name: "index_business_users_on_last_name", using: :btree
    t.index ["reset_password_token"], name: "index_business_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "audit_id"
    t.integer  "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_feedbacks_on_agent_id", using: :btree
    t.index ["audit_id", "agent_id"], name: "index_feedbacks_on_audit_id_and_agent_id", using: :btree
    t.index ["audit_id"], name: "index_feedbacks_on_audit_id", using: :btree
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "account_type",           default: 0
    t.jsonb    "settings",               default: {}, null: false
    t.index ["confirmation_token"], name: "index_forward_freights_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_forward_freights_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_forward_freights_on_reset_password_token", unique: true, using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "job_type"
    t.integer  "shipment_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_id"
    t.integer  "agent_id"
    t.string   "client_type"
    t.string   "agent_type"
    t.date     "date_of_shipment"
    t.string   "location_of_shipment"
    t.string   "place_being_shipped_to"
    t.string   "border_expected_to_cross"
    t.string   "job_title"
    t.decimal  "price"
    t.index ["agent_id"], name: "index_jobs_on_agent_id", using: :btree
    t.index ["client_id", "agent_id"], name: "index_jobs_on_client_id_and_agent_id", using: :btree
    t.index ["client_id"], name: "index_jobs_on_client_id", using: :btree
    t.index ["shipment_id"], name: "index_jobs_on_shipment_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.boolean  "taxable",               default: false, null: false
    t.string   "featured_image"
    t.boolean  "available",             default: false, null: false
    t.string   "price"
    t.string   "compare_at_price"
    t.bigint   "product_code"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "business_user_id"
    t.float    "height"
    t.float    "width"
    t.float    "grams"
    t.string   "origin_of_manufacture"
    t.string   "materials_used"
    t.date     "date_of_manufacture"
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
    t.index ["product_id", "shipment_id"], name: "index_shipment_products_on_product_id_and_shipment_id", using: :btree
    t.index ["product_id"], name: "index_shipment_products_on_product_id", using: :btree
    t.index ["shipment_id"], name: "index_shipment_products_on_shipment_id", using: :btree
  end

  create_table "shipments", force: :cascade do |t|
    t.boolean  "approval",           default: false, null: false
    t.boolean  "shipment_confirmed", default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "business_user_id"
    t.boolean  "save_for_later_use", default: false, null: false
    t.string   "title"
    t.index ["business_user_id"], name: "index_shipments_on_business_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_type"
    t.index ["user_id"], name: "index_uploads_on_user_id", using: :btree
  end

  create_table "user_limits", force: :cascade do |t|
    t.integer  "amount"
    t.string   "user_type"
    t.integer  "limit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "audits", "business_users"
end
