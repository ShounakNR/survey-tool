class ResponsesController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build(answer: answer_param)

    if @response.save
      redirect_to @survey, notice: "Thanks for your response!"
    else
      redirect_to @survey, alert: "Failed to save response."
    end
  end

  private

  def answer_param
    params[:answer] == "yes"
  end
end
