class AddPhoneNumberToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :phone_number, :string
  end
end
