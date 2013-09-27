# encoding: utf-8
class MatchMailer < ActionMailer::Base
  default from: "\"夏天廣告黑箱打掃系統\" <from@example.com>"
  
  def tasks_select( match )
  	@match = match
  	mail( :to => @match.task_user.email, :subject => "[夏天廣告黑箱系統] 您被選為本日打掃工作分配人！" ) do | format |
  		format.html { render "tasks" }
  	end
  end
  
  def workers_select( match )
  	@match = match
  	mail( :to => @match.worker_user.email, :subject => "[夏天廣告黑箱系統] 您被選為本日打掃人物分配人！" ) do | format |
  		format.html { render "workers" }
  	end
  end
  
end
