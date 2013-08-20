class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
    validates :display_name, presence: true, length: { minimum: 5 }, uniqueness: { :scope => :display_name }
end
