class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :bidder, polymorphic: true

  validates :bidder_id, :job_id, :bidder_type, :cover_letter, :attachment, :price, presence: true

  def toggle_accept(status)
    update(accepted: !status)
  end
end
