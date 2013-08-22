class Topic < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true, length: { minimum: 5 }

    belongs_to :category
    belongs_to :user

    has_many :posts
end
