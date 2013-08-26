class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
            :recoverable, :rememberable, :trackable, :validatable

    validates :display_name, presence: true, length: { minimum: 5 }, uniqueness: { :scope => :display_name }

    # Don't want to remove topics other users have posted on
    has_many :topics
    has_many :posts, :dependent => :destroy

    before_save :check_admin

    private
        def check_admin
            if (User.count == 0)
                self.admin = true
            end
            return true
        end
end
