require 'rails_helper'

RSpec.describe Admin::SurveysController, type: :controller do
  let(:superadmin) { create(:user, role: "superadmin") }
  let(:valid_attributes) { attributes_for(:survey) }
  let!(:survey) { create(:survey) }

  before do
    allow(controller).to receive(:current_user).and_return(superadmin)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new survey and redirects" do
      expect {
        post :create, params: { survey: valid_attributes }
      }.to change(Survey, :count).by(1)
      expect(response).to redirect_to(admin_survey_path(Survey.last))
    end
  end

  describe "GET #edit" do
    it "renders the edit form" do
      get :edit, params: { id: survey.id }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    it "updates the survey and redirects" do
      patch :update, params: { id: survey.id, survey: { title: "Updated Title" } }
      survey.reload
      expect(survey.title).to eq("Updated Title")
      expect(response).to redirect_to(admin_survey_path(survey))
    end
  end

  describe "DELETE #destroy" do
    it "deletes the survey and redirects" do
      expect {
        delete :destroy, params: { id: survey.id }
      }.to change(Survey, :count).by(-1)
      expect(response).to redirect_to(admin_surveys_path)
    end
  end
end
