class AddAgeToDoctors < ActiveRecord::Migration[6.0]
  def change

    add_column :doctors, :age, :integer
  end
end
