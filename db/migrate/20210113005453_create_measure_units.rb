class CreateMeasureUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :measure_units, id: false do |t|
      t.bigint :id, primary_key: true
      t.string :name
      t.string :unit

      t.timestamps
    end
  end
end
