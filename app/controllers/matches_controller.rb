# encoding: utf-8
class MatchesController < ApplicationController

	def index
		@matches = Match.all
		
		@match = Match.new
	
	end
	
	def create
		
		@match = Match.new
		
		
		@workers = Worker.where( "status <> 'disable'" )
		@tasks = Task.where( "status <> 'disable'"  )
		@match.save
		
		@workers.each do | w |
			map_worker = @match.map_workers.build( { :name => w.name, :worker_id => w.id } )			
			map_worker.save			
		end
		
		@tasks.each do | t |			
			map_task = @match.map_tasks.build( { :title => t.title, :task_id => t.id } )			
			map_task.save			
		end
		
	  	@selectors = Worker.find(:all, :order => "RANDOM();").last(2)  	
	  	@worker_user = @selectors.first
	  	@task_user = @selectors.last
	  	
	  	@match.task_user_id = @task_user.id
	  	@match.worker_user_id = @worker_user.id
  	
		MatchMailer.tasks_select(@match).deliver
		MatchMailer.workers_select(@match).deliver
		
		@match.save
		
		respond_to do | format |
			format.html { redirect_to matches_path, :notice => 'Finished.' }
		end
	
	end
	
	def result
		@match = Match.find( params[ :id ] )
		
		@tasks = @match.map_tasks
		@workers = @match.map_workers
		
		@tasks = @tasks.sort_by{ | e | e[ :order ]  }
		@workers = @workers.sort_by{ | e | e[ :order ] }
		
		respond_to do | format |
			format.html
		end
		
	end
	
	def assign_tasks_update
	
		@match = Match.find( params[ :id ] )
		redirect_to matches_path and return if @match.status == 'tasked' || @match.status == 'assigned'
		
		@tasks = @match.map_tasks
		
		maps = params[ :map_tasks_orders ].sort_by{ | t | t[1]["order"] }
		
		(0..maps.length-1).each do | order |
			@tasks.find( maps[order][0].to_i ).update_attribute( "order", order )
		end
		
		@match.set_state('tasked')
		
		respond_to do | format |
			format.html{ redirect_to matches_path, :notice => "工作指派完成" }
		end
	
	end
	
	def assign_workers_update
	
		@match = Match.find( params[ :id ] )
		redirect_to matches_path and return if @match.status == 'workered' || @match.status == 'assigned'
		
		@workers = @match.map_workers
		
		maps = params[ :map_workers_orders ].sort_by{ | t | t[1]["order"] }
		
		(0..maps.length-1).each do | order |
			@workers.find( maps[order][0].to_i ).update_attribute( "order", order )
		end
		
		@match.set_state('membered')
		
		respond_to do | format |
			format.html{ redirect_to matches_path, :notice => "人員指派完成" }
		end
	
	end

	def assign_tasks
		@match = Match.find( params[ :id ] )
		redirect_to matches_path and return if @match.status == 'tasked'
		
		@tasks = @match.map_tasks
		
		respond_to do | format |
			format.html
		end
		
	end
	
	
	def assign_workers
		
		@match = Match.find( params[ :id ] )
		redirect_to matches_path and return if @match.status == 'workered' || @match.status == 'assigned'
		@workers = @match.map_workers
		
	end

end
