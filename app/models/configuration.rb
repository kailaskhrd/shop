require 'singleton'

class Configuration
	include Singleton
	attr_accessor :number

	def initialize
		self.number = rand
	end

end
=begin
	
class << self
		
		private :new
		def instance		
			@instance ||= begin
				config = allocate
				config.send(:initialize)
				config
			rescue Exception => e
				puts e
			end
			
		end
	end		
=end