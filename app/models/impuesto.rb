class Impuesto < ActiveRecord::Base

	has_many :comentarios, as: :comentable, :dependent => :destroy
	
	has_many :contratos_impuestos, :dependent => :restrict_with_error
	has_many :contratos, :through => :contratos_impuestos
end
