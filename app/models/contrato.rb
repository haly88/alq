class Contrato < ActiveRecord::Base

	attr_accessor :fecha_inicio, :cuotas, :monto_inicio, :incremento, :cada, 
  :fecha_pago_refresh, :impuesto_refresh, :cuotas_impuestos_refresh, :cada_impuestos_refresh

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
		inmueble.direccion + " " + inmueble.piso + " " + inmueble.depto
	end

	def calcularTotal
    contratos_items.sum(:monto)
  end

  def calcularPagado
    liquidaciones.sum(:total)
  end

  def calcularSaldo
    calcularTotal - calcularPagado
  end

  def calcularTotalAPagar(fecha)
  	totalAPagar = contratos_items.where('fecha_desde <= ?', fecha).sum(:monto) - calcularPagado
  	if totalAPagar > 0
  		totalAPagar
  	else
  		0
  	end
  end

  def contratos_items_cuotas
  	contrato_items = contratos_items
  	pago_total = calcularPagado
    contrato_items.each do |contrato_items|
      if contrato_items.monto <= pago_total
      	contrato_items.saldado = contrato_items.monto
      elsif pago_total >= 0
      	contrato_items.saldado = pago_total
      else
      	contrato_items.saldado = 0
      end
    pago_total = pago_total - contrato_items.monto
    end
  end
end
