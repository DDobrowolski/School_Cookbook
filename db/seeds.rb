# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recipes = Recipe.create([{name: 'Kanapka', description: 'fajna kanapka', preparation_method: 'Zloz to w calosc.'}])
ingredient_types = IngredientType.create([{name: 'Nabiał'}, {name: 'Mięso'}])
measure_units = MeasureUnit.create([{name: 'gramy', unit: 'g'}, {name: 'kilogramy', unit: 'kg'}])
ingredients = Ingredient.create([{type_id: 1, name: 'Jajo kurze', amount_of: 100.0, unit_id: 1, recipe_id: 1}])