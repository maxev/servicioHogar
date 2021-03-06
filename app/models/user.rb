class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    #Validaciones
    validates :email, presence: true, uniqueness: true, email: true
    

    #Asocioaciones
    has_and_belongs_to_many :categories
    has_many :ratings


    #gem paperclip
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
    					default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
