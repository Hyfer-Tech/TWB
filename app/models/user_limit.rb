class UserLimit < ApplicationRecord
	enum limit_type: [:job_post_limit, :bid_limit]

	validates :user_type, :limit_type, presence: true
end
