class AddDatetimeToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :datetime, :datetime
  end
end
