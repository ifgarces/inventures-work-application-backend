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

ActiveRecord::Schema[8.0].define(version: 20_250_319_200_956) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "analytics_url_clicks", force: :cascade do |t|
    t.bigint "shortened_url_mapping_id", null: false
    t.string "ipv4_address", limit: 16, null: false
    t.string "user_agent", limit: 256, null: false
    t.json "other_device_data_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shortened_url_mapping_id"], name: "index_analytics_url_clicks_on_shortened_url_mapping_id"
  end

  create_table "shortened_url_mappings", force: :cascade do |t|
    t.string "target_url", limit: 1024, null: false
    t.string "short_code", limit: 8, null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_code"], name: "index_shortened_url_mappings_on_short_code", unique: true
  end

  add_foreign_key "analytics_url_clicks", "shortened_url_mappings"
end
