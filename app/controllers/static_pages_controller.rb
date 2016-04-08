class StaticPagesController < ApplicationController
	
	add_crumb("Dashboard", :only =>["home"]) { |instance| instance.send :home_path }	

  def home
  end

  def help
  end
end
