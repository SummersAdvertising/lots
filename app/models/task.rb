class Task < ActiveRecord::Base
	has_many :map_tasks

  attr_accessible :content, :status, :title
end
