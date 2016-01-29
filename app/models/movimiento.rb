class Movimiento < ActiveRecord::Base
  belongs_to :liquidacion
  belongs_to :pago
  belongs_to :caja
  belongs_to :cajas_concepto

  validates :caja_id, :fecha, :cajas_concepto_id, presence: true
  validate :valor_monto

  private

  def valor_monto
  	if monto == 0
  		errors.add(:monto, "No puede ser 0.")
  	end
  end
end
