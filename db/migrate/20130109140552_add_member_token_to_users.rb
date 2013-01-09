class AddMemberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_token, :string
  end
end
