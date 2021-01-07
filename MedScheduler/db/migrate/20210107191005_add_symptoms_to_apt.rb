class AddSymptomsToApt < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :symptoms, :text
  end
end
