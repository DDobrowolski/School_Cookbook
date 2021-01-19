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
    if params[:sort_type] and params[:sort_by]
      @recipes = @recipes.order("#{params[:sort_by]} #{params[:sort_type]}")
    end
    if params[:page] and params[:page_len]
      @recipes = @recipes.paginate(page: params[:page], per_page: params[:page_len])
    end
    render xml: @recipes.as_json, root: 'recipes'
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
    hash_params = Hash.from_xml(params.xpath('//object')[0].to_s)
    @recipe = Recipe.new(hash_params['object'])
    if @recipe.save
      render json: @recipe
    else
      render json: {error: 'Cannot save'}.to_json
    end
  end

  def validate
    errors = XmlValidator.validate(File.read('app/xml_schemas/recipe.xsd'), request.body.read)
    render json: errors.to_json
  end
end
