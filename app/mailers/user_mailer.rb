class UserMailer < ApplicationMailer
    default from: "admin@surveyapp.com"

    def login_credentials(user, password)
      @user = user
      @password = password
      mail(to: @user.email, subject: "Your SurveyApp Login Credentials")
    end
end
