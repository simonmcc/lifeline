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

  def CY_select_collection(collection_name, list_selections,
                              current_selection, value_method,
                              text_method, size=5, width="220px")

      result = "<select name=\"record[#{collection_name}][id]\" id=\"#{collection_name}\""
      result << " style=\"width:#{width}\""
      result << " size=\"#{size}\"" if size != 1
      result << " >\n" if size != 1
      if list_selections != nil
        list_selections.each do |l|
          result << "<option "
          result << "selected " if current_selection == l
          result << "value=\"#{l.send(value_method)}\""
          result << " /> #{l.send(text_method)} </option>\n"
      end
    end
    result << "</select>\n"
    return result
  end

  @@NS = ["kml:http://earth.google.com/kml/2.0", "xal:urn:oasis:names:tc:ciq:xsdschema:xAL:2.0"]


  def self.extract(res, key, pm, element)
    node = pm.find_first(".//#{element}", @@NS)
    if node
      res.send("#{key}=", node.content)
    end
  end

  def self.address_finder(address)

    require 'open-uri'
    require 'ostruct'
    require 'libxml'

    key="ABQIAAAAICX3M8R3u5HtMyTs0sr-OxRcuVSAEWmszhrWxgpZQw5R8qvsThSTPjTLq7HwiKrWqj5xwiK6chbYLw"
    url = URI.parse("http://maps.google.co.uk/maps/geo?q=#{CGI.escape(address)}&gl=UK&output=xml&key=#{CGI.escape(key)}&oe=utf-8")

    puts "http://maps.google.co.uk/maps/geo?q=#{CGI.escape(address)}&gl=UK&output=xml&key=#{CGI.escape(key)}&oe=utf-8"

    result = url.read

    parser = LibXML::XML::Parser.new()
    parser.string = result
    xml_doc = parser.parse

    hits = []

    xml_doc.find("//kml:Placemark", @@NS).each do |pm|
      res = OpenStruct.new

      coordinates=pm.find_first('.//kml:coordinates', @@NS).content.split(',')
      res.lat=coordinates[1]
      res.lng=coordinates[0]
      extract(res, :country_code, pm, "xal:CountryNameCode")
      res.provider='google'
      extract(res, :postcode, pm, "xal:PostalCodeNumber")

      extract(res, :city, pm, 'xal:LocalityName')
      extract(res, :state, pm, 'xal:AdministrativeAreaName')
      extract(res, :full_address, pm, 'kml:address')
      extract(res, :street_address, pm, 'xal:ThoroughfareName')

      address_details = pm.find_first('//xal:AddressDetails', @@NS)
      accuracy = address_details ? address_details.attributes['Accuracy'].to_i : 0
      res.precision=%w{unknown country state state city zip zip+4 street address}[accuracy]
      res.success=true
      hits << res
    end

    return hits
  end

end
