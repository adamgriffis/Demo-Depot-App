module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    hidden_elem_if("div", condition, attributes, &block)
  end
  
  def hidden_elem_if(element, condition, attributes = {}, &block)
    if condition 
      attributes["style"] = "display:none"
    end
    
    content_tag(element, attributes, &block)
  end
end
