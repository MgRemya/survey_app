class Admin::QuestionsController < Admin::BaseController
    before_action :set_survey
    before_action :set_category
    before_action :set_question, only: [:edit, :update, :destroy]

    def new
      @question = @category.questions.build
    end

    def create
      @question = @category.questions.build(question_params)
      if @question.save
        redirect_to admin_survey_path(@survey), notice: "Question added!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to admin_survey_path(@survey), notice: "Question updated!"
      else
        render :edit
      end
    end

    def destroy
      @question.destroy
      redirect_to admin_survey_path(@survey), notice: "Question deleted."
    end

    private

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def set_category
      @category = @survey.categories.find(params[:category_id])
    end

    def set_question
      @question = @category.questions.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:content)
    end
end
