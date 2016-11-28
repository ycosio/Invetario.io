class MarcaController < ApplicationController

	#rails generate model Article title body:text count_visits:integer
  def index
  	@marcas = Marca.all
  	@marca = Marca.new
  end

  def show
  	@marca = Marca.find(params[:id])
  end

  def new
  	@marca = Marca.new
  end

  def create
  	@marca = Marca.new(nombre: params[:marca][:nombre])
  	if @marca.save
  		redirect_to "/"
  	else 
  		@marcas = Marca.all
  		render :index
  	end
  end

   def delete
  	Marca.find(params[:id]).destroy
  	redirect_to "/"
  end

  def edit
  	@marca = Marca.find(params[:id])
  end

  def update
  	@marca = Marca.find(params[:marca][:id])
  	 
  	if @marca.update(nombre: params[:marca][:nombre])
  		redirect_to "/"
  	else 
  		render :edit
  	end
  end

end
