class User < ActiveRecord::Base
  
  # geocoded_by :ip_address,
  #   :latitude => :lat, :longitude => :lon
  # after_validation :geocode
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255, message: "Can't create a record without a valid email" },
                    format: { with: VALID_EMAIL_REGEX, message: "Invalid email address" },
                    uniqueness: { case_sensitive: false, message: "Email already exists in the system" }
                                            
end
