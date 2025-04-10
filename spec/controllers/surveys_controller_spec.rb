require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
    let(:superadmin) { create(:user, role: "superadmin") }
    let(:user)       { create(:user, role: "user") }
    let(:survey)     { create(:survey, creator: user) }
    let(:category)   { create(:category, survey: survey) }
    let(:question)   { create(:question, category: category) }
    let(:answer)     { create(:answer, content: "Mostly", score: 4) }

    before do
      allow(controller).to receive(:current_user).and_return(superadmin)
    end
  
    describe "GET #index" do
      it "returns a success response" do
        get :index
        expect(response).to be_successful
      end
    end
  
    describe "POST #submit" do
        it "saves survey responses" do
        expect {
            post :submit, params: {
            id: survey.id,
            responses: { question.id => answer.id }
            }
        }.to change(UserSurveyResponse, :count).by(1)

        expect(response).to redirect_to(dashboard_path)
        end          
     end
end
