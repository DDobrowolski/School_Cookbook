class CreateIngredientTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_types, id: false do |t|
      t.bigint :id, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
