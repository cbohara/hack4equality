# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'

module Glassdoor
  include HTTParty
  base_uri "api.glassdoor.com"

  def self.company_name(company_name)
    data = get("/api/api.htm?t.p=92900&t.k=jw0i2Cakuei&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&ps=1&q=#{company_name}").parsed_response
    data['response']['employers'][0]['name']
  end
end

p Glassdoor.company_name("trader joe's")
