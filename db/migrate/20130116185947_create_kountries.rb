class CreateKountries < ActiveRecord::Migration
  def up
    create_table :kountries do |t|
      t.string :name
      t.string :code
      
      t.timestamps
    end
  end

  def down
    drop_table :kountries
  end
end
