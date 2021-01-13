class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes, id: false do |t|
      t.bigint :id, primary_key: true
      t.string :name
      t.string :description
      t.text :preparation_method

      t.timestamps
    end
  end
end
