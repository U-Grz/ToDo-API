class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.boolean :completed, default: false, null: false
      t.date :due_date

      t.timestamps
    end

    add_index :tasks, :completed
    add_index :tasks, :due_date
  end
end
