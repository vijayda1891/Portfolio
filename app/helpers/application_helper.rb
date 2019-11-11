module ApplicationHelper
	def login_helper style = ''
	  if current_user.is_a?(GuestUser)
        (link_to "Register", new_user_registration_path, class: style) +
        " ".html_safe +
        (link_to "Login", new_user_session_path, class: style) 
     else 
        link_to "Logout", destroy_user_session_path, method: :delete, class: style
     end 
	end

	def source_helper(layout_name)
		if session[:source]
    		text = "Thanks for Visiting us from #{session[:source]} and you are on the #{layout_name} layout"
    		content_tag(:p, text, class: "source_text") 
     	end
	end

    def copyright_generator
        DavijayViewTool::Renderer.copyright 'DA Vijay', 'Rights Reserved'
    end
end
