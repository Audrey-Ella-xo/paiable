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

ActiveRecord::Schema[7.1].define(version: 2020_03_12_062626) do
  create_table "groupings", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id"], name: "index_groupings_on_group_id"
    t.index ["project_id"], name: "index_groupings_on_project_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "worked_hours"
    t.integer "author_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["author_id"], name: "index_projects_on_author_id"
  end

  create_table "taskings", force: :cascade do |t|
    t.integer "task_id"
    t.integer "project_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["project_id"], name: "index_taskings_on_project_id"
    t.index ["task_id"], name: "index_taskings_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "activity"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "lastname"
    t.string "password"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "picture"
  end

  add_foreign_key "groupings", "groups"
  add_foreign_key "groupings", "projects"
  add_foreign_key "groups", "users"
  add_foreign_key "projects", "users", column: "author_id"
  add_foreign_key "taskings", "projects"
  add_foreign_key "taskings", "tasks"
  add_foreign_key "tasks", "users"
end
