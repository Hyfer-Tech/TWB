class Feedback < ApplicationRecord
  belongs_to :audit
  belongs_to :agent, polymorphic: true, foreign_key: "agent_id"
end
