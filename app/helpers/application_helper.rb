module ApplicationHelper
 def login_helper style = ''
       if current_user.is_a?(GuestUser) 
        (link_to "Register", new_user_registration_path, class: 'nav-link') + 
       " ".html_safe +
       (link_to "Login", new_user_session_path, class: 'nav-link')
       
       else 
          link_to "Logout", destroy_user_session_path, method: :delete, class: 'nav-link'
       end 
  end

  def source_helper(layout_name)
       if session[:source]
         greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
         content_tag(:p, greeting, class: "source-greeting")
        end
    end

    def copywright_generator

    end

     def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
        {
        url: tech_news_path,
        title: 'Tech News'
      },

     
    ]
  end


     # def nav_helper style, tag_type
    #   nav_links = <<NAV
    #   <#{tag_type}<a href="#{root_path}" class="#{style}">Home</a></#{tag_type}>
    #   <#{tag_type}<a href="#{about_me_path}" class="#{style}">About Me</a></#{tag_type}>
    #   NAV


    #   nav_links.html.safe
    # end

    def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Jordan Hudgens Portfolio", sticky: false)
  end


end
