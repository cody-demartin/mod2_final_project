class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :questions
  has_many :answers 
  has_one_attached :image

  def email_required?
    false
  end

  def self.all_emp_email
    self.all.map do |user|
      if user.employee
        user.email 
      end 
    end 
  end 


  def responses
    self.answers
  end

  def response
    self.answers.map(&:question_id)
  end

  def response_user_instance
    self.response.map do |number|
      Question.all.select{|i|i.id == number}
    end.flatten
  end

  def response_user_id
    self.response_user_instance.map(&:user_id)
  end

  def response_user_i
    self.response_user_id.map do |number|
      User.all.select{|i|i.id == number}
    end.flatten.uniq
  end

  def response_email
    self.response_user_i.map(&:email)
  end



  def self.search(search)
    if search
      company = User.where(company: search)
    end
  end

  def both_arrays(array1,array2)
    array1.select{|i| array2.include?(i)}
  end


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end


  # def self.create_from_provider_data(provider_data)
  #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
  #   user.email = provider_data.info.email
  #   user.password = Devise.friendly_token[0, 20]
  #   end
  # end


  ### for your views you can login using:
#   %= link_to "Sign in with Google", user_google_oauth2_omniauth_authorize_path %>

# <%# Devise prior 4.1.0: %>
# <%= link_to "Sign in with Google", user_omniauth_authorize_path(:google_oauth2) %>


end
