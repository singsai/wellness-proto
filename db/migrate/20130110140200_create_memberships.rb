class CreateMemberships < ActiveRecord::Migration
  def up
    create_table :memberships do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :role_id
      t.string :shib

      t.timestamps
    end    
  end

  def down
    drop_table :memberships
  end
end
