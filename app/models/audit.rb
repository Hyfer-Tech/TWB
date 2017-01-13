class Audit < ApplicationRecord
  belongs_to :business_user

  mount_uploader :nafta_certificate, AuditsUploader
  mount_uploader :canada_customs, AuditsUploader
end
