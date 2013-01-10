class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.integer :name

      t.timestamps
    end        
  end

  def down
    drop_table :roles
  end
end
