class Api::QuestionsController < ApplicationController
  before_action :set_api_question, only: [:show, :edit, :update, :status, :destroy]

  def index
    @api_questions = Api::Question.where(category_id: params[:category_id])
  end

  def create
    @api_question = Api::Question.new(api_question_params)

    if @api_question.save
      respond_to json { render action: 'show', status: :created, location: @api_question }
    else
      respond_to json { render json: @api_question.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @api_question.update(api_question_params)
      respond_to json { head :no_content }
    else
      respond_to json { render json: @api_question.errors, status: :unprocessable_entity }
    end
  end

  def status
    if @api_question.update(status_params)
      render json: { status: @api_question.status }, status: :created
    else
      render json: @api_question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_question.destroy
    respond_to json { head :no_content }
  end

  private
    def set_api_question
      @api_question = Api::Question.find(params[:id])
    end

    def api_question_params
      params.require(:question).permit(:status, :title, :body, :comments_count, :category_id)
    end

    def status_params
      params.permit(:status)
    end
end
