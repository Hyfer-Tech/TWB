class ChatRoom < ApplicationRecord
  # belongs_to :user, foreign_key: :user_id, polymorphic: true
  # belongs_to :member, foreign_key: :member_id, polymorphic: true

  belongs_to :broker_user, foreign_key: :user_id, class_name: "Broker"
  belongs_to :broker_member, foreign_key: :member_id, class_name: "Broker"

  belongs_to :business_user, foreign_key: :user_id, class_name: "BusinessUser"
  belongs_to :business_member, foreign_key: :member_id, class_name: "BusinessUser"

  belongs_to :forward_freight_user, foreign_key: :user_id, class_name: "ForwardFreight"
  belongs_to :forward_freight_member, foreign_key: :member_id, class_name: "ForwardFreight"  

  has_many :messages, dependent: :destroy

  scope :most_recent, -> {order(updated_at: :desc).first}

  scope :broker_user_with_name, -> (name) { joins(:broker_user).where("LOWER(brokers.first_name) LIKE ? OR LOWER(brokers.last_name) LIKE ?", name, name) }
  scope :broker_member_with_name, -> (name) { joins(:broker_member).where("LOWER(brokers.first_name) LIKE ? OR LOWER(brokers.last_name) LIKE ?", name, name) }
  scope :business_user_with_name, -> (name) { joins(:business_user).where("LOWER(business_users.first_name) LIKE ? OR LOWER(business_users.last_name) LIKE ?", name, name) }
  scope :business_member_with_name, -> (name) { joins(:business_member).where("LOWER(business_users.first_name) LIKE ? OR LOWER(business_users.last_name) LIKE ?", name, name) }
  scope :forward_freight_user_with_name, -> (name) { joins(:forward_freight_user).where("LOWER(forward_freights.first_name) LIKE ? OR LOWER(forward_freights.last_name) LIKE ?", name, name) }
  scope :forward_freight_member_with_name, -> (name) { joins(:forward_freight_member).where("LOWER(forward_freights.first_name) LIKE ? OR LOWER(forward_freights.last_name) LIKE ?", name, name) }

  def other_user_for(current_user) 
    return member if current_user == user
    user
  end

  def self.find_with_name(name)
    broker_user_with_name(name) + broker_member_with_name(name) + business_user_with_name(name) + business_member_with_name(name) + forward_freight_user_with_name(name) + forward_freight_member_with_name(name)    
  end

  def self.room_with(user, member)
    where(user_id: user.id, user_type: user.class.name, member_id: member.id, member_type: member.class.name).first ||  where(user_id: member.id, user_type: member.class.name, member_id: user.id, member_type: user.class.name).first
  end

  private

  def member
    member_type.constantize.find(member_id)
  end

  def user
    user_type.constantize.find(user_id)
  end
end
