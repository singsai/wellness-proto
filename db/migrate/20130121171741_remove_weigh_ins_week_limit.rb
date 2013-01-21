class RemoveWeighInsWeekLimit < ActiveRecord::Migration
  def up
    change_column :weigh_ins, :week, :integer, :limit => nil
  end

  def down
    change_column :weigh_ins, :week, :string, :limit => 255
  end
end
