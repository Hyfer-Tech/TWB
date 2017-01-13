class Audit < ApplicationRecord
  belongs_to :business_user
  has_many :audit_requests

  mount_uploader :nafta_certificate, AuditsUploader
  mount_uploader :canada_customs, AuditsUploader
end
