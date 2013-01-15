class AddLocationIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :location_id, :integer
  end
end
