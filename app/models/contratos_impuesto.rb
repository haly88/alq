class ContratosImpuesto < ActiveRecord::Base
  belongs_to :contrato
  belongs_to :impuesto

  validates :impuesto_id, :presence => true 
end
