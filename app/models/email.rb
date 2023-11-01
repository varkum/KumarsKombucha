class Email < ApplicationRecord
  validates :address, uniqueness: { case_sensitive: false, message: "is already subscribed" }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
