module ApplicationHelper
  def errors_for(object, options)
    html = ""
    logger.debug(options[:message])
    logger.debug(object)
    
    if(options[:associated_model])
      logger.debug(options[:associated_model])
      if(object.respond_to?(options[:associated_model]))
        logger.debug(object.send(options[:associated_model]))
      end
    end
    
    logger.debug(object.errors)
    message = options[:message]
    
    
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end    
      else
        html << "<h5>#{message}</h5>"
      end  
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end
end
