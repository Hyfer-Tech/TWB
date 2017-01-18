class Audit < ApplicationRecord
  belongs_to :business_user
  has_many :audit_requests
  has_many :feedbacks

  mount_uploader :nafta_certificate, AuditsUploader
  mount_uploader :canada_customs, AuditsUploader

  validates :nafta_certificate, :canada_customs, presence: true
end
