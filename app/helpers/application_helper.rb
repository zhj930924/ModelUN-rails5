module ApplicationHelper
  include Chatty::ChatsHelper
  
  def full_title(page_title = "")
    base_title = "Emodelun"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
    

    

end
