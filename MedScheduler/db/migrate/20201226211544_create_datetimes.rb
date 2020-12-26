class CreateDatetimes < ActiveRecord::Migration[6.0]
  def change
    create_table :datetimes do |t|
      t.string :date

      t.timestamps
    end
  end
end
