class ForwardFreight < ApplicationRecord
  include CountriesList
  include Storext.model
  include Filterable
  include Auditable
  include Messagable

  BID_LIMIT = 15  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader


  # Regex expression where the first regex is of Canada and the second regex is of US
  POSTAL_CODE =  (/(\A[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d\z)|(\A\d{5}([ \-](?:\d{4}|\d{6}))?\z)/)

  validates :email, :first_name, :last_name, :phone, :address_line_1, :city, :zip_postal_code, :state_province_county, :country, presence: true
  validates :zip_postal_code, format: { with: POSTAL_CODE }

  scope :city, -> (search) { where city: search}
  scope :with_tags, ->(search) { ForwardFreight.tagged_with(search, any: true) }

  acts_as_followable
  acts_as_follower
  acts_as_taggable

  has_many :jobs, as: :agent
  has_many :bids, as: :bidder
  has_many :uploads, as: :user

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

end
