class Admin::AnswersController < Admin::BaseController
    before_action :set_answer, only: [:edit, :update, :destroy]

    def index
      @answers = Answer.order(:score)
    end

    def new
      @answer = Answer.new
    end

    def create
      @answer = Answer.new(answer_params)
      if @answer.save
        redirect_to admin_answers_path, notice: "Answer added."
      else
        render :new
      end
    end

    def edit; end

    def update
      if @answer.update(answer_params)
        redirect_to admin_answers_path, notice: "Answer updated."
      else
        render :edit
      end
    end

    def destroy
      @answer.destroy
      redirect_to admin_answers_path, notice: "Answer deleted."
    end

    private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content, :score)
    end
end
