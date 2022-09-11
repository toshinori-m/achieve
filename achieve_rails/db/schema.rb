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

ActiveRecord::Schema.define(version: 20_220_805_073_514) do
  create_table 'goals', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'aim'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_goals_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'message_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['message_id'], name: 'index_likes_on_message_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'monthly_goals', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'aim'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_monthly_goals_on_user_id'
  end

  create_table 'reports', force: :cascade do |t|
    t.integer 'user_id'
    t.text 'report'
    t.text 'point'
    t.string 'location'
    t.string 'time'
    t.string 'condition'
    t.string 'intensity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'datepicker_value'
    t.index ['user_id'], name: 'index_reports_on_user_id'
  end

  create_table 'threemonths_goals', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'aim'
    t.integer 'quarter'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_threemonths_goals_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'name'
    t.string 'email'
    t.text 'tokens'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true
  end
end
