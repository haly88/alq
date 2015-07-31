class Inmueble < ActiveRecord::Base
	has_one :contrato
	belongs_to :inmueble_tipo

	validates :codigo, :uniqueness => {:case_sensitive => false}, :presence => true
	#Validacion compuesta
	validates :direccion, :presence => true, :uniqueness => {:case_sensitive => false, :scope => [:piso, :depto]}
	validates :piso, :uniqueness => {:case_sensitive => false, :scope => [:direccion, :depto]}
	validates :depto, :uniqueness => {:case_sensitive => false, :scope => [:direccion, :piso]}

	scope :sin_usar, ->{includes(:contrato).where(:contratos => {:inmueble_id => nil})}


	def direccion_completa
			direccion + ' ' + piso + ' ' + depto
	end 
end
