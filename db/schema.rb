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

ActiveRecord::Schema.define(version: 20190624033659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_tags", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.binary "title", null: false
    t.binary "content", null: false
    t.binary "title_iv", null: false
    t.binary "content_iv", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "sharing_token"
    t.binary "sharing_token_iv"
    t.boolean "listed_publicly", default: false, null: false
    t.index ["listed_publicly"], name: "index_posts_on_listed_publicly"
    t.index ["sharing_token"], name: "index_posts_on_sharing_token", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.binary "label", null: false
    t.binary "label_iv", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
