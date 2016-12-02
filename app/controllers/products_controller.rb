class ProductsController < ApplicationController	
	before_action :authenticate_business_user!

	def new
		@product = Product.new
	end

	def create
		@product = current_business_user.products.new(product_params)
		if @product.save
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	private
	def product_params
		params.require(:product).permit(:title,:taxable,:featured_image,:available,:price,:compare_at_price, :product_code, :height, :width, :grams, :business_user_id, :origin_of_manufacture, :materials_used, :date_of_manufacture)
	end
end