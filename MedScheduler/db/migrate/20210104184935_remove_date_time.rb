class RemoveDateTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :datetime, :integer
  end
end
