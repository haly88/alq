class Contrato < ActiveRecord::Base

	attr_accessor :fecha_inicio, :cuotas, :monto_inicio, :incremento, :cada

	has_many :liquidaciones, :dependent => :destroy

	has_many :contratos_impuestos, :dependent => :destroy
	accepts_nested_attributes_for :contratos_impuestos, :allow_destroy => true

	belongs_to :inmueble
	has_many :contratos_inquilinos, class_name: "ContratosPersonasTipo" 
 	has_many :contratos_propietarios, class_name: "ContratosPersonasTipo"
  has_many :contratos_garantes, class_name: "ContratosPersonasTipo"
	has_many :inquilinos, through: :contratos_inquilinos
  has_many :propietarios, through: :contratos_propietarios
	has_many :garantes, through: :contratos_garantes

	has_many :contratos_items, dependent: :destroy
	accepts_nested_attributes_for :contratos_items, :allow_destroy => true#, :reject_if => lambda { |a| a[:monto].to_d == 0 or a[:fecha_desde].blank? or a[:fecha_hasta].blank?}
	#Validaciones
	validates :codigo, :inmueble_id, :presence => true 
	validates :inmueble_id, :uniqueness => true

	def selector_contratos
		nombre + " - " + inmueble.direccion + " " + inmueble.piso + " " + inmueble.depto
	end

	def total
		contratos_items.sum(:monto)
	end

	def pagado
		liquidaciones.sum(:total)
	end

	def saldo
		total - pagado
	end
end
