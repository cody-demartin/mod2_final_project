class EmployeeMailer < ApplicationMailer
    default to: -> {User.all_emp_email},
            from: 'flatironconsultinggroup@gmail.com'


    def new_customer_ques(user)
        @user = user 
        mail(subject: "New question from #{@user.email}")
    end
end
