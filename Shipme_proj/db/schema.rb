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

<<<<<<< HEAD
<<<<<<< HEAD
=======
HEAD
ActiveRecord::Schema.define(version: 20140327135756) do

  create_table "add_trips", force: true do |t|
    t.string   "Location"
    t.string   "Destination"
    t.date     "TravellingDate"
    t.integer  "Weight"
HEAD
ActiveRecord::Schema.define(version: 20140328134215) do

  create_table "create_packages", force: true do |t|
    t.string   "destination"
    t.string   "description"
    t.integer  "weight"
    t.string   "origin"
    t.date     "Expiry_Date"
    t.integer  "value"
    t.string   "receiverAddress"
    t.integer  "receivermobile"
    t.string   "receiverMail"

>>>>>>> master
ActiveRecord::Schema.define(version: 20140327191646) do

  create_table "requests", force: true do |t|
    t.integer  "userid"
    t.integer  "packageid"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "destination"
    t.string   "location"
    t.integer  "maxweight"
    t.date     "depdate"
<<<<<<< HEAD
=======
ActiveRecord::Schema.define(version: 20140328134215) do

  create_table "create_packages", force: true do |t|
    t.string   "destination"
    t.string   "description"
    t.integer  "weight"
    t.string   "origin"
    t.date     "Expiry_Date"
    t.integer  "value"
    t.string   "receiverAddress"
    t.integer  "receivermobile"
    t.string   "receiverMail"
>>>>>>> d7d143f18d6d68412dd502605243a0b3ac29ba3a
=======
>>>>>>> master
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
