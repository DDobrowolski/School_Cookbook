require 'nokogiri'

class RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @recipes = Recipe.all
    respond_to do |format|
      format.xml {render xml: @recipes.as_json}
    end
  end

  def validate
    errors = XmlValidator.validate(File.read('app/xml_schemas/recipe.xsd'), request.body.read)
    render json: errors.to_json
  end
end
