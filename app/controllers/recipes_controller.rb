require 'nokogiri'

class RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :xml
  def index
    if params[:q]
      @recipes = Recipe.where('name LIKE :q', q: "%#{params[:q]}%")
    else
      @recipes = Recipe.all
    end
    count = @recipes.count
    if params[:sort_type] and params[:sort_by]
      @recipes = @recipes.order("#{params[:sort_by]} #{params[:sort_type]}")
    end
    if params[:page] and params[:page_len]
      @recipes = @recipes.paginate(page: params[:page], per_page: params[:page_len])
    end
    render xml: {recipes: @recipes.as_json, count: count}, root: 'objects'
  end

  def show
    if params[:id]
      @recipe = Recipe.find_by(id: params[:id])
      if @recipe.nil?
        render json: {error: 'Cannot find'}.to_json
      else
        render xml: @recipe.as_json(include: {ingredients: {include: [:ingredient_type, :measure_unit]}}), root: 'recipe'
      end
    else
      render json: {error: 'Cannot find'}.to_json
    end
  end

  def create
    params =  Nokogiri::XML(request.body.read)
    hash_params = Hash.from_xml(params.xpath('//recipe')[0].to_s)['recipe']
    ingredients = hash_params['ingredients']
    new_ingredients = []
    ingredients.each do |i|
      ingredient = Ingredient.create(i.except('measure_unit', 'ingredient_type'))
      ingredient.ingredient_type = IngredientType.create(i['ingredient_type'])
      ingredient.measure_unit = MeasureUnit.create(i['measure_unit'])
      new_ingredients << ingredient
    end
    new_recipe = hash_params.except('ingredients')
    @recipe = Recipe.new(new_recipe)
    @recipe.ingredients << new_ingredients
    if @recipe.save
      render json: @recipe
    else
      render json: {error: 'Cannot save'}.to_json
    end
  end

  def validate
    body = request.body.read
    errors = XmlValidator.validate(File.read('app/xml_schemas/recipe.xsd'), body)
    if errors[:errors].empty?
      params =  Nokogiri::XML(body)
      hash_params = Hash.from_xml(params.xpath('//recipe')[0].to_s)
      render json: hash_params.to_json
    else
      render json: errors.to_json
    end
  end

  def destroy
    respond_to :json
    if params['ids'].respond_to?('each')
      params['ids'].each do |r|
        Recipe.destroy(r)
      end
    else
      Recipe.destroy(params['ids'])
    end
    render json: {log: 'Success'}
  end
end
