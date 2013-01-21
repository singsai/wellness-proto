class AddDatesToWeighIns < ActiveRecord::Migration
  def change
    add_column :weigh_ins, :start_date, :datetime
    add_column :weigh_ins, :end_date, :datetime
  end
end
