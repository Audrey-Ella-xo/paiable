class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :activity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
