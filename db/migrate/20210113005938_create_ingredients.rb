class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients, id: false do |t|
      t.bigint :id, primary_key: true
      t.bigint :type_id
      t.string :name
      t.decimal :amount_of
      t.bigint :unit_id
      t.bigint :recipe_id

      t.timestamps
    end
  end
end
