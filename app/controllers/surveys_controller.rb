class SurveysController < ApplicationController
  def index
    @surveys = Survey.order(created_at: :desc)
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: "Survey created."
    else
      flash.now[:alert] = "Please provide a question."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question)
  end
end
