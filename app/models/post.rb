class Post < ActiveRecord::Base
    validates :body, presence: true, length: { minimum: 5 }

    belongs_to :topic
    belongs_to :user
end
