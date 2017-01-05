class Notification < ApplicationRecord
	# belongs_to :broker, as: :recipient
	# belongs_to :broker, as: :actor
	# belongs_to :business_user, as: :recipient
	# belongs_to :business_user, as: :actor
	# belongs_to :forward_freight, as: :recipient
	# belongs_to :forward_freight, as: :actor
	# belongs_to :notifiable, polymorphic: true


	belongs_to :actor, polymorphic: true, foreign_key: "actor_id"
	belongs_to :recipient, polymorphic: true, foreign_key: "recipient_id"
	belongs_to :notifiable, polymorphic: true

	# belongs_to :recipient, polymorphic: true
	# belongs_to :actor, polymorphic: true
	# belongs_to :notifiable, polymorphic: true

	# belongs_to :recipient, class_name: "business_user"
	# belongs_to :actor, class_name: "broker"
	# belongs_to notifiable, polymorphic: true

end
