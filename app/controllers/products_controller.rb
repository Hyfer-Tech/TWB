class ProductsController < ApplicationController	
	before_action :authenticate_business_user!

	def new
		@product = Product.new
	end

	def create
		binding.pry
		@product = current_business_user.products.create!(product_params)
		binding.pry
		if @product.valid?
			redirect_to root_path
		else
			render :new, status: :inprocessable_entity
		end
	end

	private
	def product_params
		params.require(:product).permit(:title,:taxable,:featured_image,:available,:price,:grams,:compare_at_price,:product_code)
	end
end
