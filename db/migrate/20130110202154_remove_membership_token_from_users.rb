class RemoveMembershipTokenFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :membership_token
  end

  def down
    add_column :users, :membership_token, :string
  end
end
