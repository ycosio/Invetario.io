class Producto < ActiveRecord::Base
	validates :nombre, :presence  => { :message => ": 	Este campo es requerido" }
	validates :precio_pesos, :presence  => { :message => ": 	Este campo es requerido" }
	validates_numericality_of :precio_pesos, less_than: 101
end

