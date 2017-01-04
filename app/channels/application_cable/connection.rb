module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

      def find_verified_user
        BusinessUser.find(session['warden.user.business_user.key'][0][0]) ||
        Broker.find(session['warden.user.broker.key'][0][0]) ||
        ForwardFreight.find(session['warden.user.forward_freight'][0][0])
      rescue
        reject_unauthorized_connection
      end
  end
end
