class Admin::SurveysController < Admin::BaseController
    before_action :get_survey, only: [:show, :edit, :update, :destroy]
    # before_action :set_survey, only: [:show, :edit, :update, :destroy]
    def index
      @surveys = Survey.all
    end
    def new
        @survey = Survey.new
    end
  
    def create
        @survey = Survey.new(survey_params)
        @survey.creator_id = current_user.id

        if @survey.save
            redirect_to admin_survey_path(@survey), notice: "Survey created!"
        else
            render :new
        end
    end
    def update
        if @survey.update(survey_params)
          redirect_to admin_survey_path(@survey), notice: "Survey updated!"
        else
          render :edit
        end
      end
    
    def destroy
        @survey.destroy
        redirect_to admin_surveys_path, notice: "Survey deleted!"
    end
    def show
        @categories = @survey.categories.includes(:questions)
    end
    def preview
      @survey = Survey.find(params[:id])
      @categories = @survey.categories.includes(:questions)
      @answers = Answer.order(:score)
    end
  
    private

    def survey_params
        params.require(:survey).permit(:title, :description)
    end

    def get_survey 
        @survey = Survey.find(params[:id])
        if @survey.nil?
          redirect_to admin_surveys_path, alert: "Survey not found!"
        end
    end
end
