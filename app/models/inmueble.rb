class Inmueble < ActiveRecord::Base

	has_many :comentarios, as: :comentable, :dependent => :destroy
	
	has_one :contrato, :dependent => :restrict_with_error
	belongs_to :inmueble_tipo

	validates :inmueble_tipo, :presence => true
	validates :codigo, :uniqueness => {:case_sensitive => false}, :presence => true
	#Validacion compuesta
	validates :direccion, :presence => true, :uniqueness => {:case_sensitive => false, :scope => [:piso, :depto]}
	validates :piso, :uniqueness => {:case_sensitive => false, :scope => [:direccion, :depto]}
	validates :depto, :uniqueness => {:case_sensitive => false, :scope => [:direccion, :piso]}

	scope :sin_usar, ->{includes(:contrato).where(:contratos => {:inmueble_id => nil})}


	def direccion_completa
		(direccion + ' ' + piso + ' ' + depto).strip
	end 
end
