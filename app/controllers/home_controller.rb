class HomeController < ApplicationController
  
  require 'httparty'
  require 'json'

  BASE_URL = 'https://developer.citymapper.com'

  def index
    @result = get_json('/api/1/singlepointcoverage/',{'coord': '15.578973,-0.124147'})
  end

  private 

  def get_json(root_path, query = {})
    query_string = query.map{|k,v| "#{k}=#{v}"}.join("&")
    query_string +="&key=#{ENV['CITYMAPPER_KEY']}"
    path = query.empty?? root_path : "#{root_path}?#{query_string}"
    request = HTTParty.get(BASE_URL+path).to_json
    @response_hash = JSON.parse(request)
  end


end
