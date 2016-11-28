class ProductosController < ApplicationController
   def index
  	@productos = Producto.all
  	@marca = Marca.joins("INNER JOIN productos ON marcas.id = productos.id_marca")
  	@suma_precios = Producto.sum("precio_pesos")
  	@marcas = Marca.select("id","nombre")
  	@producto = Producto.new
  end

  def show
  	@producto = Producto.find(params[:id])
  end

  def new
  	@producto = Producto.new
  end

  def create
  	@producto = Producto.new({nombre: params[:producto][:nombre], id_marca: params[:producto][:id_marca], descripcion: params[:producto][:descripcion], precio_pesos: params[:producto][:precio_pesos]})
  	if @producto.save
  		redirect_to "/productos"
  	else 
  		@productos = Producto.all
  		@marca = Marca.joins("INNER JOIN productos ON marcas.id = productos.id_marca")
  		@suma_precios = Producto.sum("precio_pesos")
  		@marcas = Marca.select("id","nombre")
  		render :index
  	end
  end

   def delete
  	Producto.find(params[:id]).destroy
  	redirect_to "/productos"
  end

  def edit
  	@marcas = Marca.select("id","nombre")
  	@marca = Marca.joins("INNER JOIN productos ON marcas.id = productos.id_marca WHERE productos.id=#{params[:id]}")
  	@producto = Producto.find(params[:id])
  end

  def update
  	@producto = Producto.find(params[:producto][:id])
  	@marcas = Marca.select("id","nombre")
  	@marca = Marca.joins("INNER JOIN productos ON marcas.id = productos.id_marca WHERE productos.id=#{params[:id]}")
  	if @producto.update(nombre: params[:producto][:nombre], id_marca: params[:producto][:id_marca], descripcion: params[:producto][:descripcion], precio_pesos: params[:producto][:precio_pesos])
  		redirect_to "/productos"
  	else 
  		render :edit
  	end
  end
end
