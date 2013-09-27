class CreateMapTasks < ActiveRecord::Migration
  def change
    create_table :map_tasks do |t|
      t.string :title
      t.integer :order
      t.string :status
      t.integer :task_id
      t.integer :match_id

      t.timestamps
    end
  end
end
