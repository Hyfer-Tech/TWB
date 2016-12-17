class ForwardFreight < ApplicationRecord
  # include Searchable
  acts_as_taggable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader


  # Regex expression where the first regex is of Canada and the second regex is of US
  POSTAL_CODE =  (/(\A[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d\z)|(\A\d{5}([ \-](?:\d{4}|\d{6}))?\z)/)

  validates :email, :first_name, :last_name, :phone, :address_line_1, :city, :zip_postal_code, :state_province_county, :country, presence: true
  validates :zip_postal_code, format: { with: POSTAL_CODE }


  acts_as_followable
  acts_as_follower

  has_many :jobs, as: :agent

  has_many :bids, as: :bidder


  has_many :uploads, as: :user

  def bid_limit_exceeded?
    return account_type == 0 && bids.this_month.count >= 15
  end
end
