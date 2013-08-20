class Category < ActiveRecord::Base
    has_many :topics
    validates :title, presence: true, length: { minimum: 5 }
end
