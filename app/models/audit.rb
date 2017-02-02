class Audit < ApplicationRecord
  belongs_to :business_user
  has_many :audit_requests
  has_many :feedbacks

  mount_uploader :nafta_certificate, AuditsUploader
  mount_uploader :canada_customs, AuditsUploader
  mount_uploader :b3_customs_entry, AuditsUploader
  mount_uploader :previous_ruling, AuditsUploader

  validates :nafta_certificate, :canada_customs, :b3_customs_entry, presence: true
end
