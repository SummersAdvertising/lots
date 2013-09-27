class MapTask < ActiveRecord::Base
	belongs_to :task
	belongs_to :match

  attr_accessible :match_id, :order, :status, :task_id, :title
end
