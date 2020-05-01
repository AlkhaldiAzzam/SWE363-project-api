class CommentsController < ApplicationController
    before_action :set_question
    before_action :set_question_comment, only: [:show, :update, :destroy]
    skip_before_action :authorize_request, only: :index, raise: false

  
    # GET /questions/:question_id/comments
    def index
      json_response(@question.comments)
    end
  
    # GET /questions/:question_id/comments/:id
    def show
      json_response(@comment)
    end
  
    # POST /questions/:question_id/comments
    def create
      @question.comments.create!(comment_params)
      json_response(@question, :created)
    end
  
    # PUT /questions/:question_id/comments/:id
    def update
      @comment.update(comment_params)
      head :no_content
    end
  
    # DELETE /questions/:question_id/comments/:id
    def destroy
      @comment.destroy
      head :no_content
    end
  
    private
  
    def comment_params
      params.permit( :content, :created_by)
    end
  
    def set_question
      @question = Question.find(params[:question_id])
    end
  
    def set_question_comment
      @comment = @question.comments.find_by!(id: params[:id]) if @question
    end
end
