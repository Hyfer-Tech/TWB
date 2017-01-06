class ProductsController < ApplicationController
	before_action :authenticate_business_user!

	def index
		@products = Product.all.order("title ASC")
	end

	def new
		@product = Product.new
	end

	def create
		@product = current_business_user.products.new(product_params)
		if @product.save
			flash[:success] = "Product has been created!"
			redirect_to products_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)

		if @product.valid?
			flash[:updated] = "Product has been updated!"
			redirect_to products_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	private
	def product_params
		params.require(:product).permit(
			:title,
			:taxable,
			:featured_image,
			:available, :price,
		 	:grams,
			:height,
			:width,
			:compare_at_price,
			:product_code,
			:origin_of_manufacture,
			:materials_used,
			:date_of_manufacture)
	end
end
