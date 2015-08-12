class ContratosImpuesto < ActiveRecord::Base
  belongs_to :contrato
  belongs_to :impuesto
end
