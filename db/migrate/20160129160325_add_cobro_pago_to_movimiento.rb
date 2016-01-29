class AddCobroPagoToMovimiento < ActiveRecord::Migration
  def change
    add_reference :movimientos, :liquidacion, index: true, foreign_key: true
    add_reference :movimientos, :pago, index: true, foreign_key: true
  end
end
