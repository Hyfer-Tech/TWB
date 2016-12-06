class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :bidder, polymorphic: true

  validates :bidder_id, :job_id, :bidder_type, :accepted, :cover_letter, :attachment, presence: true
end
