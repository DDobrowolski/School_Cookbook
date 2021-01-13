class Ingredient < ApplicationRecord
  belongs_to :ingredient_type, class_name: 'IngredientType', foreign_key: 'type_id' 
  belongs_to :measure_unit, class_name: 'MeasureUnit', foreign_key: 'unit_id'
  belongs_to :recipe
end
