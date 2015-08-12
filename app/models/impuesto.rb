class Impuesto < ActiveRecord::Base
	has_many :contratos_impuestos
	has_many :contratos, :through => :contratos_impuestos
end
