class Worker < ActiveRecord::Base
	has_many :map_workers
	attr_accessible :name, :status, :email
	
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
	
end
