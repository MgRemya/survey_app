class SurveysController < ApplicationController
  before_action :get_survey, only: [:show, :attempt, :submit]
  def index
    @surveys = Survey.all
  end

  def show
  end

  def attempt
    @categories = @survey.categories.includes(:questions)
    @answers = Answer.order(:score)
  end

  def submit
    user_survey = current_user.user_surveys.create!(survey: @survey)

    params[:responses]&.each do |question_id, answer_id|
      question = Question.find(question_id)
      answer = Answer.find(answer_id)
      category = question.category

      UserSurveyResponse.create!(
        user_survey: user_survey,
        question: question,
        answer: answer,
        category: category,
        score: answer.score
      )
    end
    redirect_to dashboard_path, notice: "Survey submitted successfully!"
  end
  def preview
    @survey = Survey.find(params[:id])
    @user_survey = UserSurvey.find_by(survey: @survey, user: current_user)
    @user = current_user
    puts "__________________________________________________"
    puts "user_survey: #{@user_survey.inspect}"
    @user_survey_responses = @user_survey.user_survey_responses.includes(:question, :answer)
    puts ")))))))))))))))))))))))))))))))))))))))))"
    puts "user_survey_responses: #{@user_survey_responses.inspect}"

    
    render 'preview'
  end

  private
  def get_survey
    @survey = Survey.find(params[:id])
    if @survey.nil?
      redirect_to surveys_path, alert: "Survey not found!"
    end 
  end
end
