class PastClient
	def initialize(user)
		@user = user
	end

	def successful_bids
		Bid.where('accepted = ? AND bidder_id = ? AND bidder_type = ?', true, @user.id, @user.class.name).includes(:job, job: :client)
	end
end