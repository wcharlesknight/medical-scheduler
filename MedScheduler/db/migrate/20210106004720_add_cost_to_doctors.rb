class AddCostToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :cost, :integer
  end
end
