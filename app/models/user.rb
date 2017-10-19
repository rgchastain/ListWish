class User < ActiveRecord::Base
  has_secure_password

  has_many :items, dependent: :destroy
  has_many :wishes, dependent: :destroy
  has_many :wishing, through: :wishes, source: :item

  email_validate = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :dob, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: email_validate}

  before_save :downcase_email
  
  def downcase_email
      self.email.downcase!
  end
end
