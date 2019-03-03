class User
	include Mongoid::Document
	include BCrypt
	include ActiveModel::SecurePassword

	field :full_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :age, type: Integer
  field :profession, type: String
  field :created_at, type: Time, default: -> { Time.now }
  field :updated_at, type: Time, default: -> { Time.now }

  validates :full_name, presence: :true
  validates :email, presence: :true, 
  									format: { with: URI::MailTo::EMAIL_REGEXP }, 
  									uniqueness: true
  validates :password_digest, length: { minimum: 6 }                  

  has_many :posts								

  has_secure_password
end