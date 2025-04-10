class SurveysController < ApplicationController
  before_action :get_survey, only: [:show, :attempt, :submit, :preview]
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
    ActiveRecord::Base.transaction do
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
    end
  
    redirect_to dashboard_path, notice: "Survey submitted successfully!"
  rescue => e
    redirect_to attempt_survey_path(@survey), alert: "Something went wrong: #{e.message}"
  end
  
  def preview
    @user_survey = UserSurvey.find_by(survey: @survey, user: current_user)
    @user = current_user
    @user_survey_responses = @user_survey.user_survey_responses.includes(:question, :answer, :category)
    @total_score = @user_survey_responses.sum(&:score)
    # KPI 1 categorywise avergae score
    @avg_score_by_category = @user_survey_responses.group_by(&:category).transform_values do |res|
      (res.sum(&:score).to_f/res.size).round(2)
    end
    # KPI 2 Engagement index- score obtained out of maximum score
    @maximum_score = @user_survey_responses.size *  5
    @engagement_index = ((@total_score.to_f/@maximum_score)*100).round(1)
    # KPI 3 high performance bracket- high scored count calculaton
    high_scored_performance =  @user_survey_responses.select{|r| r.score >= 4}.count
    @high_perf_percent = ((high_scored_performance.to_f/@user_survey_responses.size)*100).round(1)
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
