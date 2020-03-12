class CreateTaskings < ActiveRecord::Migration[5.2]
  def change
    create_table :taskings do |t|
      t.references :task, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
