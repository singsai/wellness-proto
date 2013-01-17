class AddCountryCodeToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :country_code, :string, :limit => 4
  end
end
