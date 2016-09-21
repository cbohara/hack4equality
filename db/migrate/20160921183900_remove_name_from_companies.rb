class RemoveNameFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :name, :string
  end
end
