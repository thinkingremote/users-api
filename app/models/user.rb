class User < ActiveRecord::Base
  
  geocoded_by :ip_address,
    :latitude => :lat, :longitude => :lon
  after_validation :geocode
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "Email address can't be blank" }, 
                    length: { maximum: 255, message: "Email must contain less the 255 characters" },
                    format: { with: VALID_EMAIL_REGEX, message: "Invalid email address" },
                    uniqueness: { case_sensitive: false, message: "Email already exists in the system" }
                                            
end
