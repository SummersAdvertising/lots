class MapWorker < ActiveRecord::Base
	belongs_to :workers
	belongs_to :match
	
  attr_accessible :match_id, :name, :order, :status, :worker_id
end
