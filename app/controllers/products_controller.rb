class ProductsController < ApplicationController	
	before_action :authenticate_business_user!

	def new
		@product = Product.new
	end

	def create
		@product = current_business_user.products.create!(product_params)
		if @product.valid?
			redirect_to root_path
		else
			render :new, status: :inprocessable_entity
		end
	end

	private
	def product_params
		params.require(:product).permit(:title,:taxable,:featured_image,:available,:price,:grams, :height,:width, :compare_at_price,:product_code)
	end
end
