# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.create([
  {name: 'Naleśniki', description: 'Idealny przepis na pożywne śniadanie.', preparation_method: 'Mąkę wsypać do miski, dodać jajka, mleko, wodę i sól. Zmiksować na gładkie ciasto. Dodać roztopione masło lub olej roślinny i razem zmiksować (lub wykorzystać tłuszcz do smarowania patelni przed smażeniem każdego naleśnika).
  Naleśniki smażyć na dobrze rozgrzanej patelni z cienkim dnem np. naleśnikowej. Przewrócić na drugą stronę gdy spód naleśnika będzie już ładnie zrumieniony i ścięty.'}, {name: 'Tort', description: 'urodzinowy', preparation_method: 'Idealny na urodzinki. '},
  {name: 'Kanapka z dżemem', description: 'Idealny przepis na drugie śniadanie.', preparation_method: 'Posmarować jedną z kromek chleba dżemem.'}
  ])

IngredientType.create([{name: 'Nabiał'}, {name: 'Mięso'}, {name: 'Pieczywo'}, {name: 'Przetwory'}])
MeasureUnit.create([{name: 'sztuki', unit: 'szt'}, {name: 'mililitry', unit: 'ml'}, {name: 'gramy', unit: 'g'}, {name: 'kilogramy', unit: 'kg'}])
Ingredient.create([{type_id: 1, name: 'Jajo kurze', amount_of: 20.0, unit_id: 1, recipe_id: 1},
   {type_id: 1, name: 'Mleko', amount_of: 250.0, unit_id: 2, recipe_id: 1},
   {type_id: 3, name: 'Chleb biały', amount_of: 2.0, unit_id: 1, recipe_id: 2},
   {type_id: 4, name: 'Dżem wiśniowy', amount_of: 50, unit_id: 3, recipe_id: 2}
   ])