# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140413131213) do

  create_table "configurations", force: true do |t|
    t.float    "comission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "description"
    t.integer  "senders_id"
    t.integer  "receivers_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "description"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: true do |t|
    t.date     "expiryDate"
    t.string   "description"
    t.string   "destination"
    t.string   "origin"
    t.string   "receiverAddress"
    t.integer  "receiverMobNumber"
    t.string   "receiverEmail"
    t.boolean  "receivedByCarrier"
    t.boolean  "finalDelivery"
    t.float    "weight"
    t.string   "type"
    t.float    "carryingPrice"
    t.float    "packageValue"
    t.float    "rating"
    t.integer  "senders_id"
    t.integer  "carriers_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "packageid"
    t.float    "amountWithdraw"
    t.float    "amountTransfer"
    t.integer  "users_id"
    t.integer  "packages_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.string   "description"
    t.boolean  "verified"
    t.integer  "reporters_id"
    t.integer  "reported_id"
    t.integer  "packages_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.boolean  "accept"
    t.integer  "carriers_id"
    t.integer  "senders_id"
    t.integer  "packages_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "destination"
    t.string   "location"
    t.float    "maxWeight"
    t.date     "travelDate"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "username"
    t.integer  "mobileNumber"
    t.integer  "creditCard"
    t.boolean  "admin"
    t.integer  "idNumber"
    t.boolean  "idVerify"
    t.float    "averageRating"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
