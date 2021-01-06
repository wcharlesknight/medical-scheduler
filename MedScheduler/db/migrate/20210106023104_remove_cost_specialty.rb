class RemoveCostSpecialty < ActiveRecord::Migration[6.0]
  def change
    remove_column :specialties, :cost, :integer
  end
end
