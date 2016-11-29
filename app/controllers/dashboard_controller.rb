class DashboardController < ApplicationController
  before_action :authenticate_any!
  layout 'dashboard'

  def index
    if business_user_signed_in? 
      if params[:query].present?      
        @brokers = UserDecorator.decorate_collection(Broker.search(params[:query]))
        @forward_freights = UserDecorator.decorate_collection(ForwardFreight.search(params[:query]))
      else
        @brokers = Broker.all.decorate
        @forward_freights = ForwardFreight.all.decorate
      end 
    else
      if params[:query].present?    
        @business_users = UserDecorator.decorate_collection(BusinessUser.search(params[:query]))
      else
        @business_users = BusinessUser.all.decorate
      end
    end   
  end

  def search
    if business_user_signed_in? 
      if params[:query].present?      
        @brokers = UserDecorator.decorate_collection(Broker.search(params[:query]))
        @forward_freights = UserDecorator.decorate_collection(ForwardFreight.search(params[:query]))
      elsif params[:tag]
        @brokers = UserDecorator.decorate_collection(Broker.tagged_with(params[:tag], any: true))
        @forward_freights = UserDecorator.decorate_collection(ForwardFreight.tagged_with(params[:tag], any: true))
      else
        @brokers = Broker.all.decorate
        @forward_freights = ForwardFreight.all.decorate
      end 
    else
      if params[:query].present?    
        @business_users = UserDecorator.decorate_collection(BusinessUser.search(params[:query]))
      elsif params[:tag]
        @business_users = UserDecorator.decorate_collection(BusinessUser.tagged_with(params[:tag], any: true))
      else
        @business_users = BusinessUser.all.decorate
      end
    end   
  end

  def favorites
    @user = current_user.decorate  
    @following = UserDecorator.decorate_collection(@user.all_following)
  end
end
