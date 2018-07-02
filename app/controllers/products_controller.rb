class ProductsController < ApplicationController

	# lo que va hacer es que cada vez que se llame algunas de esas rutas 
	# el va primero va ejecutar un metodo llamado private_access
	# exceptuando index y show porque esos metodos si deben ser visibles 
	# asi no estes autenticado pero los demas como create update edit si solo 
	# son paginas privadas
    
	before_action :private_access, except: [:index, :show]
	def index
		@products = Product.all		
	end

	def new
		@product = Product.new		
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path, notice:"El producto fue guardado con éxito"
		else
			render :new

		end	
	end

	def show
		@product = Product.find(params[:id])
		
	end

	def edit
		@product = Product.find(params[:id])		
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to products_path, notice: "el producto ha sido modificado con exito"
		else
			render :edit
		end 		
	end

	def destroy
		product = Product.find(params[:id])
		product.destroy

		redirect_to products_path, notice: "El producto fue eliminado con éxito"
		
	end

	private
		def product_params
			params.require(:product).permit(:name,:url,:description)
			
		end

end 