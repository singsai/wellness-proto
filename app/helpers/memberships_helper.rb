module MembershipsHelper
  def selected_country
    Country.find_country_by_alpha2(@membership.country_code).alpha2 unless @membership.country_code.nil?
  end
end