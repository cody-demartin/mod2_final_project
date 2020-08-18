class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    
    has_rich_text :body
end
