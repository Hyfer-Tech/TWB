module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise      
      if verified_user = env["warden"].user("business_user") || env["warden"].user("forward_freight") || env["warden"].user("broker")
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end