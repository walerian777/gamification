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

ActiveRecord::Schema.define(version: 20170519125921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "achievements", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "description",                    null: false
    t.string   "rank",        default: "bronze", null: false
    t.integer  "points",                         null: false
    t.string   "rewards"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "active",      default: true,     null: false
  end

  create_table "achievements_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "achievement_id",                null: false
    t.uuid     "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "active",         default: true, null: false
    t.index ["achievement_id", "user_id"], name: "index_achievements_users_on_achievement_id_and_user_id", using: :btree
    t.index ["achievement_id"], name: "index_achievements_users_on_achievement_id", using: :btree
    t.index ["user_id"], name: "index_achievements_users_on_user_id", using: :btree
  end

  create_table "notifications", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id",                          null: false
    t.string   "notificable_type"
    t.uuid     "notificable_id"
    t.string   "message"
    t.boolean  "seen",             default: false, null: false
    t.boolean  "active",           default: true,  null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable_type_and_notificable_id", using: :btree
  end

  create_table "teams", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "teams_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "team_id",                   null: false
    t.uuid     "user_id",                   null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["team_id", "user_id"], name: "index_teams_users_on_team_id_and_user_id", unique: true, using: :btree
    t.index ["team_id"], name: "index_teams_users_on_team_id", using: :btree
    t.index ["user_id"], name: "index_teams_users_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",                                  null: false
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "password_salt"
    t.integer  "level",                  default: 1,     null: false
    t.integer  "experience",             default: 0,     null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "nickname",                               null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "active",                 default: true,  null: false
    t.string   "position"
    t.string   "location"
    t.string   "twitter"
    t.string   "github"
    t.string   "website"
    t.text     "about_me"
    t.datetime "last_seen_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "achievements_users", "achievements", name: "achievements_users_achievements_fk"
  add_foreign_key "achievements_users", "users", name: "achievements_users_users_fk"
  add_foreign_key "teams_users", "teams", name: "teams_users_teams_fk"
  add_foreign_key "teams_users", "users", name: "teams_users_users_fk"
end
