class Admin::CategoriesController < Admin::BaseController
    before_action :set_survey
    before_action :set_category, only: [:edit, :update, :destroy]

    def new
      @category = @survey.categories.build
    end

    def create
      @category = @survey.categories.build(category_params)
      if @category.save
        redirect_to admin_survey_path(@survey), notice: "Category added!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to admin_survey_path(@survey), notice: "Category updated!"
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_survey_path(@survey), notice: "Category deleted."
    end

    private

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def set_category
      @category = @survey.categories.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
