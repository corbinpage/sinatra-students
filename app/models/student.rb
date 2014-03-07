class Student < ActiveRecord::Base

	before_create :create_slug

	def create_slug
		self.slug = self.name.downcase.gsub(" ","-").gsub("ä","a").gsub("ö","o").gsub("'","")
	end

	def change_name(name)
		self.name=name
		self.create_slug
	end


end


