class RemoveCostDoctors < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :cost, :integer
  end
end
