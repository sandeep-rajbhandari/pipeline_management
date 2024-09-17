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

ActiveRecord::Schema[7.0].define(version: 2024_09_10_083456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pipelines", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.boolean "active", default: true
    t.string "partial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.integer "row_order"
    t.bigint "pipeline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipeline_id", "row_order"], name: "index_stages_on_pipeline_id_and_row_order", unique: true
    t.index ["pipeline_id"], name: "index_stages_on_pipeline_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "row_order"
    t.string "taskable_type", null: false
    t.bigint "taskable_id", null: false
    t.bigint "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id", "row_order"], name: "index_tasks_on_stage_id_and_row_order", unique: true
    t.index ["stage_id", "taskable_id", "taskable_type"], name: "index_tasks_on_stage_id_and_taskable_id_and_taskable_type", unique: true
    t.index ["stage_id"], name: "index_tasks_on_stage_id"
    t.index ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable"
  end

  add_foreign_key "stages", "pipelines"
  add_foreign_key "tasks", "stages"
end
