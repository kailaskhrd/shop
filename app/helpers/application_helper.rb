module ApplicationHelper

	def title(page_title)
  	content_for :title, page_title.to_s
	end

	def active_class(link_path)
  	current_page?(link_path) ? "active" : ""
 	end

 	def pretty_date(date)
    date.to_time.strftime('%d-%b-%Y')
  	end

  	def flash_class(level)

	    case level
	        when 'notice' then "alert alert-info"
	        when 'success' then "alert alert-success"
	        when 'error' then "alert alert-danger"
	        when 'alert' then "alert alert-warning"
	    end
	end

end
