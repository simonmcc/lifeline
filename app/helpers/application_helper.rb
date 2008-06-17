# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def multi_select_collection(collection_name, list_selections,
                              current_selections, value_method,
                              text_method, size=5, width="220px")

      result = "<select name=\"record[#{collection_name}][]\" id=\"#{collection_name}\""
      result << " style=\"width:#{width}\""
      result << " multiple size=\"#{size}\">\n"
      if list_selections != nil
        list_selections.each do |l|
          result << "<option "
          result << "selected " if current_selections.include?(l)
          result << "value=\"#{l.send(value_method)}\""
          result << " /> #{l.send(text_method)} </option>\n"
      end
    end
    result << "</select>\n"
    return result
  end
end
