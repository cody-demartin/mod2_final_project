class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    
    has_rich_text :body

    def self.no_answers
        self.select do |question|
            if question.answers == [] 
                question 
            end 
        end 
    end

    def self.has_answers
        self.select do |question|
            if question.answers.exists?
                question 
            end 
        end 
    end 


end


