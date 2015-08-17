class ContratosItem < ActiveRecord::Base
	
  belongs_to :contrato

  validates :monto, :fecha_desde, :fecha_hasta, :presence => true 
  validates :monto, :numericality => {:greater_than => 0}
end
