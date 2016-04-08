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

end
