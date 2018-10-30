module ApplicationHelper

  require 'httparty'
  require 'json'

  BASE_URL = 'https://developer.citymapper.com'

  def get_request_to_json(root_path, query = {})
    query_string = query.map{|k,v| "#{k}=#{v}"}.join("&")
    query_string +="&key=#{ENV['CITYMAPPER_KEY']}"
    path = query.empty?? root_path : "#{root_path}?#{query_string}"
    response = HTTParty.get(BASE_URL+path)
    response
  end
end
