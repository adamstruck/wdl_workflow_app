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

ActiveRecord::Schema.define(version: 20160106225632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.integer  "workflow_id"
    t.text     "inputs",           default: "--- {}\n"
    t.text     "options",          default: "--- {}\n"
    t.string   "status"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "job_process_uuid"
    t.text     "outputs",          default: "--- {}\n"
    t.text     "metadata",         default: "--- {}\n"
    t.datetime "completed_at"
    t.datetime "started_at"
  end

  add_index "jobs", ["workflow_id"], name: "index_jobs_on_workflow_id", using: :btree

  create_table "workflows", force: :cascade do |t|
    t.text     "wdl_source",                      null: false
    t.boolean  "is_valid"
    t.text     "html"
    t.text     "inputs",     default: "--- {}\n"
    t.text     "options",    default: "--- {}\n"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name"
    t.text     "tags",       default: "--- []\n"
  end

end
