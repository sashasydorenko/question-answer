class Api::CategoriesController < ApplicationController
  before_action :set_api_category, only: [:show, :edit, :update, :destroy]

  def index
    @api_categories = Api::Category.all.order("id ASC")
  end

  def create
    @api_category = Api::Category.new(api_category_params)

    if @api_category.save
      respond_to json { render action: 'show', status: :created, location: @api_category }
    else
      respond_to json { render json: @api_category.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @api_category.update(api_category_params)
      respond_to json { head :no_content }
    else
      respond_to json { render json: @api_category.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @api_category.destroy
    respond_to json { head :no_content }
  end

  private
    def set_api_category
      @api_category = Api::Category.find(params[:id])
    end

    def api_category_params
      params.require(:api_category).permit(:name, :count)
    end
end
