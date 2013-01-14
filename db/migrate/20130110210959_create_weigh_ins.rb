class CreateWeighIns < ActiveRecord::Migration
  def up
    create_table :weigh_ins do |t|
      t.string :week
      t.float :weight
      t.integer :membership_id

      t.timestamps
    end
  end

  def down
    drop_table :weigh_ins
  end
end
