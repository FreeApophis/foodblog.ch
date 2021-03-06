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

ActiveRecord::Schema.define(version: 20170501170825) do

  create_table "activities", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "teaser"
    t.text     "text"
    t.integer  "author_id"
    t.datetime "published_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "comments_count", default: 0, null: false
    t.integer  "view_count",     default: 0, null: false
    t.string   "slug"
    t.string   "header_image"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comment",          null: false
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "hints", force: :cascade do |t|
    t.string   "text"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_hints_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "slug"
    t.decimal  "density",         default: "1.0", null: false
    t.decimal  "piece",           default: "1.0", null: false
    t.integer  "calorific_value", default: 0,     null: false
    t.decimal  "protein",         default: "0.0", null: false
    t.decimal  "fat",             default: "0.0", null: false
    t.decimal  "carbohydrates",   default: "0.0", null: false
    t.decimal  "sugar",           default: "0.0", null: false
    t.decimal  "fiber",           default: "0.0", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "iso_639_1"
    t.string   "iso_639_2"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locales", force: :cascade do |t|
    t.string   "name"
    t.string   "english_name"
    t.string   "locale"
    t.string   "language_code"
    t.string   "country_code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "left",                       null: false
    t.integer  "right",                      null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["left"], name: "index_pages_on_left"
    t.index ["parent_id"], name: "index_pages_on_parent_id"
    t.index ["right"], name: "index_pages_on_right"
  end

  create_table "preparation_steps", force: :cascade do |t|
    t.integer  "recipe_id",  null: false
    t.text     "text"
    t.integer  "sort_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_preparation_steps_on_recipe_id"
    t.index ["sort_order"], name: "index_preparation_steps_on_sort_order"
  end

  create_table "recipe_images", force: :cascade do |t|
    t.string   "file",                   null: false
    t.string   "name",                   null: false
    t.integer  "size",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "recipe_id",  default: 1, null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id",     null: false
    t.integer  "ingredient_id", null: false
    t.integer  "unit_id",       null: false
    t.decimal  "amount",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
    t.index ["unit_id"], name: "index_recipe_ingredients_on_unit_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.integer  "author_id"
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "preparation_time"
    t.integer  "cooking_time"
    t.integer  "calorific_value"
    t.integer  "portions"
    t.integer  "difficulty"
    t.string   "slug"
    t.integer  "view_count",       default: 0, null: false
    t.integer  "comments_count",   default: 0, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "abbrevation"
    t.integer  "category"
    t.float    "unit_factor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0,  null: false
    t.string   "name",                                null: false
    t.string   "avatar"
    t.integer  "avatar_color",           default: 0,  null: false
    t.text     "description"
    t.string   "slug"
    t.integer  "color",                  default: 0,  null: false
    t.integer  "locale_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["locale_id"], name: "index_users_on_locale_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                     null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
