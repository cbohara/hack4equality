# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Company.delete_all

require 'httparty'

class Glassdoor
  include HTTParty
  base_uri "api.glassdoor.com"

  def initialize(company_name)
    @company_name = company_name
    @response = self.class.get("/api/api.htm?t.p=92900&t.k=jw0i2Cakuei&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&ps=1&q=#{@company_name}").parsed_response
  end

  def name
    @response['response']['employers'][0]['name']
  end

  def website
    @response['response']['employers'][0]['website']
  end

  def squareLogo
    @response['response']['employers'][0]['squareLogo']
  end

  def overallRating
    @response['response']['employers'][0]['overallRating']
  end

  def recommendToFriendRating
    @response['response']['employers'][0]['recommendToFriendRating']
  end

  def ratingDescription
    @response['response']['employers'][0]['ratingDescription']
  end

  def compensationAndBenefitsRating
    @response['response']['employers'][0]['compensationAndBenefitsRating']
  end

  def careerOpportunitiesRating
    @response['response']['employers'][0]['careerOpportunitiesRating']
  end

  def cultureAndValuesRating
    @response['response']['employers'][0]['cultureAndValuesRating']
  end
end

tjs = Glassdoor.new("trader joe's")
Company.create!(name: tjs.name,
                website: tjs.website,
                squareLogo: tjs.squareLogo,
                overallRating: tjs.overallRating,
                recommendToFriendRating: tjs.recommendToFriendRating,
                ratingDescription: tjs.ratingDescription,
                compensationAndBenefitsRating: tjs.compensationAndBenefitsRating,
                careerOpportunitiesRating: tjs.careerOpportunitiesRating,
                cultureAndValuesRating: tjs.cultureAndValuesRating)
