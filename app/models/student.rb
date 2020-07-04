class Student < ApplicationRecord
  has_and_belongs_to_many :training_groups
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: URI::MailTo::EMAIL_REGEXP}
end
