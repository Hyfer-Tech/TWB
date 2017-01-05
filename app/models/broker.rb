class Broker < ApplicationRecord
  include CountriesList
  include Storext.model


  BID_LIMIT = 10

  acts_as_taggable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  POSTAL_CODE =  (/(\A[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d\z)|(\A\d{5}([ \-](?:\d{4}|\d{6}))?\z)/)


  validates :first_name, :last_name, :phone, :firm_name,:address_line_1, :city, :zip_postal_code,:state_province_county, :country, :broker_number, presence: true
  validates :zip_postal_code, format: { with: POSTAL_CODE }

  mount_uploader :avatar, AvatarUploader
  acts_as_followable
  acts_as_follower

  has_many :jobs, as: :agent

  has_many :bids, as: :bidder

  has_many :uploads, as: :user

  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
  # has_many :notifications, as: :actor, dependent: :destroy

  store_attributes :settings do
	  show_phone_number Boolean, default:false
	  show_email Boolean, default:false
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
  has_many :business_user, through: :rating
end
