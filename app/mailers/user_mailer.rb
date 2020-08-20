class UserMailer < ApplicationMailer
    default from: 'flatironconsultinggroup@gmail.com'
    
    def answer_email(user)
        @user = user
        mail(to: user.email, subject: "Your question has been answered!")
    end 

    def new_question_email(user)
        @user = user 
        mail(to: user.email, subject: "Your question has been posted!")
    end 
end
