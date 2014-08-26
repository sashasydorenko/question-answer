class Api::CommentsController < ApplicationController
  before_action :set_api_comment, only: [:show, :edit, :update, :destroy]

  def index
    @api_comments = Api::Comment.where(question_id: params[:question_id])
  end

  def create
    @api_comment = Api::Comment.new(api_comment_params)

    if @api_comment.save
      render json: { comment: @api_comment }, status: :created
    else
      render json: @api_comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @api_comment.update(api_comment_params)
      respond_to json { head :no_content }
    else
      respond_to json { render json: @api_comment.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @api_comment.destroy
    respond_to json { head :no_content }
  end

  private
    def set_api_comment
      @api_comment = Api::Comment.find(params[:id])
    end

    def api_comment_params
      params.require(:comment).permit(:body, :question_id)
    end
end
