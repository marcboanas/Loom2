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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131016182243) do

  create_table "business_types", :force => true do |t|
    t.string   "business"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "business_types_expense_types", :id => false, :force => true do |t|
    t.integer "business_type_id"
    t.integer "expense_type_id"
  end

  create_table "business_types_steps", :id => false, :force => true do |t|
    t.integer "business_type_id"
    t.integer "step_id"
  end

  create_table "employers", :force => true do |t|
    t.string   "name"
    t.string   "PAYE"
    t.text     "address"
    t.date     "start"
    t.float    "tax"
    t.float    "income"
    t.boolean  "director"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.date     "end_date"
    t.integer  "tax_return_id"
    t.float    "national_insurance"
  end

  create_table "expense_categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expense_types", :force => true do |t|
    t.string   "expense"
    t.integer  "expense_category_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "private_use"
    t.boolean  "private_use_fixed"
    t.integer  "asset_life"
    t.boolean  "asset_life_fixed"
    t.boolean  "fixed_asset"
    t.float    "sale_price"
    t.boolean  "sale_price_fixed"
  end

  create_table "expenses", :force => true do |t|
    t.integer  "expense_type_id"
    t.date     "dated"
    t.float    "value"
    t.text     "description"
    t.integer  "asset_life"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "private_use"
    t.float    "sale_value"
    t.boolean  "sold"
  end

  create_table "incomes", :force => true do |t|
    t.date     "date"
    t.boolean  "test"
    t.text     "description"
    t.float    "value"
    t.integer  "student_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "expense_id"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "steps", :force => true do |t|
    t.integer  "step"
    t.string   "controller"
    t.string   "action"
    t.string   "variable"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.string   "home_phone"
    t.string   "mobile"
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.boolean  "passed_theory"
    t.boolean  "passed_practical"
    t.date     "date_passed_theory"
    t.date     "date_passed_practical"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "plan_id"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.string   "last_4_digits"
    t.string   "stripe_id"
    t.boolean  "failed_payment"
    t.text     "payment_history"
  end

  create_table "tax_returns", :force => true do |t|
    t.integer  "user_id"
    t.float    "loss"
    t.float    "pension"
    t.string   "UTR"
    t.float    "dividend"
    t.float    "interest"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "year"
    t.float    "other_income"
    t.boolean  "employed"
  end

  create_table "user_payments", :force => true do |t|
    t.text     "payment_history"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                       :default => false
    t.integer  "business_type_id"
    t.string   "account_type"
    t.text     "address"
    t.string   "business_name"
    t.integer  "next_step"
    t.string   "home_phone"
    t.string   "mobile"
    t.integer  "default_year"
    t.boolean  "complete"
    t.date     "business_start_date"
    t.date     "accounting_start_date"
    t.boolean  "registered_selfemployed"
    t.boolean  "previous_accountant"
    t.text     "previous_accountant_address"
    t.text     "payment_history"
    t.float    "longitude"
    t.float    "latitude"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
