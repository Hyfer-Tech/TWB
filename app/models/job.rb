class Job < ApplicationRecord
	belongs_to :client, polymorphic: true, foreign_key: "client_id"
	belongs_to :agent, polymorphic: true, foreign_key: "agent_id"

	enum job_type: [:broker, :forward_freight]

	default_scope {order("created_at DESC")}

	scope :this_month, -> {where(created_at: (Time.now.beginning_of_month..Time.zone.now))}

	validate :user_job_limit
	validates :job_title, :shipment_id, :date_of_shipment, :location_of_shipment, :place_being_shipped_to, :border_expected_to_cross, :client_id,:client_type, presence: true

	EXPECTED_BORDERS_TO_BE_CROSSED = ["US", "Canada"]

	belongs_to :shipment

	has_many :bids


	acts_as_taggable

	# def clone_job
	# 	job_type = job_type.broker? forward_freight : broker
	# 	job = Job.new(business_user_id: current_business_user.id, job_type: job_type, agent_id: nil)
	# 	job.save
	# end

	private

	def user_job_limit
		client = client_type.constantize.find(client_id)

		return unless client.free_account?

		return unless limit_objects = UserLimit.find_by(user_type: BusinessUser.class.name.underscore, limit_type: :job_post_limit)

		return unless client.jobs.this_month.count >= limit_objects.amount

		errors.add(:base, "Exceeds monthly limit")
	end

	def self.search_on(user)
		return BusinessUser if user.class.name == 'ForwardFreight' || user.class.name == 'Broker'
	end
end
