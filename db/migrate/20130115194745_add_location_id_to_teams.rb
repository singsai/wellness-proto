class AddLocationIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :location_id, :integer
  end
end
