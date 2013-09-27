class AddAssignerToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :worker_user_id, :integer
  	add_column :matches, :task_user_id, :integer
  end
end
