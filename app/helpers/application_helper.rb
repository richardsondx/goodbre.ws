module ApplicationHelper
  def logo_link
    path = signed_in? ? '/dashboard' : root_path
    
    link_to image_tag("logo_sm.png"), path
  end
end
