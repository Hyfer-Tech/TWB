class Broker < ApplicationRecord
  include CountriesList
  include Storext.model
  include Filterable

  BID_LIMIT = 10
  POSTAL_CODE =  (/(\A[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d\z)|(\A\d{5}([ \-](?:\d{4}|\d{6}))?\z)/)

  acts_as_taggable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :first_name, :last_name, :phone, :firm_name,:address_line_1, :city, :zip_postal_code,:state_province_county, :country, :broker_number, presence: true
  validates :zip_postal_code, format: { with: POSTAL_CODE }

  mount_uploader :avatar, AvatarUploader
  acts_as_followable
  acts_as_follower

  has_many :jobs, as: :agent
  has_many :bids, as: :bidder
  has_many :uploads, as: :user
  has_many :feedbacks, as: :agent
  has_many :audit_requests, as: :agent

  store_attributes :settings do
	  show_phone_number Boolean, default:false
	  show_email Boolean, default:false
  end

  scope :city, -> (search) { where city: search}
  scope :with_tags, ->(search) { Broker.tagged_with(search, any: true) }

  def has_requested_audit_for?(audit)
    audit_requests.where(audit: audit).any?
  end

  def has_approved_audit_request_for?(audit)
    audit_requests.where(audit: audit, status: :approved).any?
  end

  def bid_limit_exceeded?
    return account_type == 0 && bids.this_month.count >= BID_LIMIT
  end

  def suggested_users
    BusinessUser.tagged_with(tag_list, :any => true).order("RANDOM()").limit(10)
  end

  def self.successful_bids(current_user)
    Bid.where('accepted = ? AND bidder_id = ? AND bidder_type = ?', true, current_user.id, current_user.class.name).includes(:job, job: :client)
  end
end
