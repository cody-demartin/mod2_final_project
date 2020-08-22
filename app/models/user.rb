class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers 
  has_one_attached :image

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


end
