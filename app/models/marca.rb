class Marca < ActiveRecord::Base
	validates :nombre, :presence  => { :message => ": 	Este campo es requerido" }, :uniqueness  => { :message => ": Esta marca ya está registrada" }
end
