class ContratosItemsLiquidacion < ActiveRecord::Base
  belongs_to :contratos_item
  belongs_to :liquidacion
end
