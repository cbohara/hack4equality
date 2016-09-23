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
    @response = self.class.get("/api/api.htm?t.p=92900&t.k=jw0i2Cakuei&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&ps=1&q=#{@company_name}").parsed_response['response']['employers'][0]
  end

  def name
    @response['name']
  end

  def website
    @response['website']
  end

  def squareLogo
    @response['squareLogo']
  end

  def overallRating
    @response['overallRating']
  end

  def recommendToFriendRating
    @response['recommendToFriendRating']
  end

  def ratingDescription
    @response['ratingDescription']
  end

  def compensationAndBenefitsRating
    @response['compensationAndBenefitsRating']
  end

  def careerOpportunitiesRating
    @response['careerOpportunitiesRating']
  end

  def cultureAndValuesRating
    @response['cultureAndValuesRating']
  end

  def create!
    Company.create!(name: self.name,
                    website: self.website,
                    squareLogo: self.squareLogo,
                    overallRating: self.overallRating,
                    recommendToFriendRating: self.recommendToFriendRating,
                    ratingDescription: self.ratingDescription,
                    compensationAndBenefitsRating: self.compensationAndBenefitsRating,
                    careerOpportunitiesRating: self.careerOpportunitiesRating,
                    cultureAndValuesRating: self.cultureAndValuesRating)
  end
end


three = Glassdoor.new("3M Co.")
three.create!

aber = Glassdoor.new("Abercrombie & Fitch Co.")
aber.create!

acc = Glassdoor.new("Accenture")
acc.create!

adidas = Glassdoor.new("Adidas")
adidas.create!

adobe = Glassdoor.new("Adobe Systems Inc.")
adobe.create!

aetna = Glassdoor.new("Aetna Inc.")
aetna.create!

aig = Glassdoor.new("AIG")
aig.create!

airbnb = Glassdoor.new("Airbnb Inc.")
airbnb.create!

starbucks = Glassdoor.new("Starbucks")
starbucks.create!

tjs = Glassdoor.new("Trader Joe's")
tjs.create!
