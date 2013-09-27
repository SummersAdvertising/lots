class CreateMapWorkers < ActiveRecord::Migration
  def change
    create_table :map_workers do |t|
      t.string :name
      t.integer :order
      t.string :status
      t.integer :worker_id
      t.integer :match_id

      t.timestamps
    end
  end
end
