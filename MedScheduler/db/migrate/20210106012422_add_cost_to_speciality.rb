class AddCostToSpeciality < ActiveRecord::Migration[6.0]
  def change
    add_column :specialties, :cost, :integer
  end
end
