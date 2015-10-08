class ContratosItem < ActiveRecord::Base

	has_many :contratos_items_liquidaciones
	has_many :liquidaciones, :through => :contratos_items_liquidaciones
	
  belongs_to :contrato

  validates :monto, :fecha_desde, :presence => true 
  validates :monto, :numericality => {:greater_than => 0}

  def calcularSaldoCuota
  end
end
