class Inmueble < ActiveRecord::Base
	belongs_to :inmueble_tipo
	has_one :contrato

	validates :codigo, :uniqueness => {:case_sensitive => false}, :presence => true
	#Validacion compuesta
	validates :direccion, :presence => true, :uniqueness => {:case_sensitive => false, :scope => [:piso, :depto]}
	validates :piso, :uniqueness => {:case_sensitive => false, :scope => [:direccion, :depto]}
	validates :depto, :uniqueness => {:case_sensitive => false, :scope => [:direccion, :piso]}

  
end
