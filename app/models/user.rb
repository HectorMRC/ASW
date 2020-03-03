class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
         user = User.create(username: "dummyTest", personalName: data['name'],
            email: data['email'],
           password: "12341234"
        )
    end
    user
  end
end
