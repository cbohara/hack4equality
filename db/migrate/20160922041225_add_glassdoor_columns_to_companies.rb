class AddGlassdoorColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :website, :string
    add_column :companies, :squareLogo, :string
    add_column :companies, :overallRating, :string
    add_column :companies, :recommendToFriendRating, :string
    add_column :companies, :ratingDescription, :string
    add_column :companies, :compensationAndBenefitsRating, :string
    add_column :companies, :careerOpportunitiesRating, :string
    add_column :companies, :cultureAndValuesRating, :string
  end
end
