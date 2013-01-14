class ChangeWeighInsWeekToInteger < ActiveRecord::Migration
  def up
    change_column :weigh_ins, :week, :integer
  end

  def down
    change_column :weigh_ins, :week, :string
  end
end
