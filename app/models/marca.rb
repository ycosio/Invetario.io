class Marca < ActiveRecord::Base
	validates :nombre, presence: true, uniqueness: true
end
