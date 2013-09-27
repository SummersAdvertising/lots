class Match < ActiveRecord::Base

	has_many :map_workers
	has_many :map_tasks
		
	belongs_to :task_user, :class_name => "Worker", :foreign_key => :task_user_id	
	belongs_to :worker_user, :class_name => "Worker", :foreign_key => :worker_user_id


  def set_state( state )
  
  	case state  	
  		when 'tasked'
  			if self.status == 'workered'
  				status = 'assigned'
  			else
  				status = state
  			end  			
  		when 'workered'
  			if self.status == 'tasked'
  				status = 'assigned'
  			else
  				status = state
  			end  			  			
  		else
  			status = state
  	end
  	
  	self.update_attribute('status', status)
  
  end
  
end
