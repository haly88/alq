class ContratosImpuesto < ActiveRecord::Base
  belongs_to :contrato
  belongs_to :impuesto

  validates :impuesto_id, :fecha_pago, :presence => true 

  default_scope { order('impuesto_id', 'fecha_pago') } 
end
