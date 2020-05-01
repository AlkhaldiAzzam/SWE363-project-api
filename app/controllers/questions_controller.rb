class QuestionsController < ApplicationController
    skip_before_action :authorize_request, only: [:index, :show], raise: false

    before_action :set_question, only: [:show, :update, :destroy]

    # GET /questions
    def index

        
      @questions = Question.all

      

      json_response(@questions)
    end

    def my_questions
        @questions = current_user.questions
        json_response(@questions)
    end
  
    # POST /questions
    def create
      @question = current_user.questions.create!(question_params)
      json_response(@question, :created)
    end


    def deletePost
        if current_user.user_type == "admin"
            Question.find(params[:id]).destroy
            response = {message: "Post is successfully deleted"}
            json_response(response)
        else 
            json_response({message: "you dont have the power"})

        end
    end

  
    # GET /questions/:id
    def show
      json_response(@question)
    end
  
    # PUT /questions/:id
    def update
      @question.update(question_params)
      head :no_content
    end
  
    # DELETE /questions/:id
    def destroy
      @question.destroy
      head :no_content
    end
  
    private
  
    def question_params
      # whitelist params
      params.permit(:title, :content)
    end
  
    def set_question

        @question = Question.find(params[:id])
    end

end
