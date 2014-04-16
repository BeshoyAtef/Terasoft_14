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
    t.date     "dateTime"
    t.integer  "sender_Id"
    t.integer  "receiver_Id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "description"
    t.integer  "user_Id"
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
    t.date     "creationDate"
    t.float    "weight"
    t.string   "type"
    t.float    "carryingPrice"
    t.float    "packageValue"
    t.float    "rating"
    t.integer  "sender_Id"
    t.integer  "carrier_Id"
    t.integer  "package_Id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "packageid"
    t.float    "amountWithdraw"
    t.float    "amountTransfer"
    t.date     "date"
    t.integer  "user_Id"
    t.integer  "package_Id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.string   "description"
    t.boolean  "verified"
    t.integer  "reporter_Id"
    t.integer  "reported_Id"
    t.integer  "package_Id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.boolean  "accept"
    t.integer  "carrier_Id"
    t.integer  "sender_Id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "destination"
    t.string   "location"
    t.float    "maxWeight"
    t.date     "travelDate"
    t.integer  "user_Id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "username"
    t.integer  "mobileNumber"
    t.integer  "creditCard"
    t.boolean  "admin"
    t.integer  "idNumber"
    t.integer  "idVerify"
    t.float    "averageRating"
    t.date     "dateOfRegister"
    t.integer  "user_Id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
