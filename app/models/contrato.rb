class Contrato < ActiveRecord::Base

  has_many :comentarios, as: :comentable, :dependent => :destroy
	
  has_many :liquidaciones, :dependent => :restrict_with_error
	
  has_many :contratos_impuestos, :dependent => :destroy
	accepts_nested_attributes_for :contratos_impuestos, :allow_destroy => true
	
  belongs_to :inmueble
	
  has_many :contratos_inquilinos, class_name: "ContratosPersonasTipo"
 	has_many :contratos_propietarios, class_name: "ContratosPersonasTipo"
  has_many :contratos_garantes, class_name: "ContratosPersonasTipo"
	has_many :inquilinos, through: :contratos_inquilinos, :dependent => :destroy
  has_many :propietarios, through: :contratos_propietarios, :dependent => :destroy
	has_many :garantes, through: :contratos_garantes, :dependent => :destroy
	
  has_many :contratos_items, dependent: :destroy
	accepts_nested_attributes_for :contratos_items, :allow_destroy => true#, :reject_if => lambda { |a| a[:monto].to_d == 0 or a[:fecha_desde].blank? or a[:fecha_hasta].blank?}
	
  #Validaciones
	validates :nombre, :inmueble_id, :inquilino_ids, :propietario_ids, presence: true
	validates :inmueble_id, uniqueness: true
  validates :nombre, :uniqueness => {:case_sensitive => false}
  validate :liquidado?, :on => :update

  def get_primer_cuota_impaga(fecha_desde)
    contratos_items.find_by_sql([
      "select contratos_items.*
      from contratos_items
      Left join (select contratos_item_id, sum(neto) as suma from liquidaciones group by contratos_item_id) Liquidaciones
      ON contratos_items.id = Liquidaciones.contratos_item_id
      where contrato_id = ?
      and fecha_desde <= ?
      and monto > coalesce(Liquidaciones.suma,0) 
      order by fecha_desde", self.id, fecha_desde]).first
  end

	def direccion_inmueble
		inmueble.direccion_completa
	end

  private

  def liquidado?
    if liquidaciones.any?
      errors.add(:base, "El contrato se encuentra liquidado.")
    end
  end

  # def calcular_total_a_pagar(fecha)
  #   total_a_pagar = contratos_items.where('fecha_desde <= ?', fecha).sum(:monto) - calcular_pagado
  #   if total_a_pagar > 0
  #     total_a_pagar
  # 	else
  # 		0
  # 	end
  # end

  # def contratos_items_cuotas
  # 	pago_total = calcular_pagado
  #   contratos_items.each do |c|
  #     if c.monto <= pago_total
  #     	c.saldado = c.monto
  #     elsif pago_total >= 0
  #     	c.saldado = pago_total
  #     else
  #     	c.saldado = 0
  #     end
  #   pago_total = pago_total - c.monto
  #   end
  # end
end
