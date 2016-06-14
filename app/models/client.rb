class Client < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

    has_many :ratings

private
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |client|
		    client.email = auth.info.email
		    client.password = Devise.friendly_token[0,20]
		end
	end
	def self.new_with_session(params, session)
	    super.tap do |client|
	      	if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
				client.email = data["email"] if user.email.blank?
	    	end
	    end
  	end
end