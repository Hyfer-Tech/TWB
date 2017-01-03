class Job < ApplicationRecord
	EXPECTED_BORDERS_TO_BE_CROSSED = ["US", "Canada"]

	enum job_type: [:broker, :forward_freight]

	# default_scope {order("created_at DESC")}

	scope :this_month, -> {where(created_at: (Time.now.beginning_of_month..Time.zone.now))}

	validate :user_job_limit
	validates :job_title, :shipment_id, :date_of_shipment, :location_of_shipment, :place_being_shipped_to, :border_expected_to_cross, :client_id,:client_type,:price, presence: true

	belongs_to :client, polymorphic: true, foreign_key: "client_id"
	belongs_to :agent, polymorphic: true, foreign_key: "agent_id"
	belongs_to :shipment

	has_many :bids
	has_many :brokers, through: :jobs
	has_many :business_users, through: :jobs

	# def clone_job
	# 	job_type = job_type.broker? forward_freight : broker
	# 	job = Job.new(business_user_id: current_business_user.id, job_type: job_type, agent_id: nil)
	# 	job.save
	# end

	acts_as_taggable

	def self.search(search)
		return Job.all unless search
		search_array = search.split(" ")
		where("lower(location_of_shipment) || lower(place_being_shipped_to) LIKE ?", "%#{search.downcase}%") || Job.tagged_with(search_array, :any => true)
	end

	private

	def user_job_limit
		client = client_type.constantize.find(client_id)

		return unless client.free_account?

		return unless limit_objects = UserLimit.find_by(user_type: BusinessUser.class.name.underscore, limit_type: :job_post_limit)

		return unless client.jobs.this_month.count >= limit_objects.amount

		errors.add(:base, "Exceeds monthly limit")
	end
end
