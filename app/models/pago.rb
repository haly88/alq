class Pago < ActiveRecord::Base

  has_one :movimiento, :dependent => :destroy

  has_many :comentarios, as: :comentable, :dependent => :destroy

  belongs_to :contrato
  belongs_to :contratos_item
  belongs_to :propietario, class_name: "Persona"

  validates :contrato, :fecha, :propietario_id, :presence => true
  validates :total, :numericality => {:greater_than => 0}

  validate :valor_pago

  after_create :set_movimiento
  after_update :update_movimiento

  private

  def valor_pago
    if neto - (neto_was.nil? ? 0 : neto_was) > contratos_item.get_cobrado
      errors.add(:neto, "No puede superar el pendiente de la cuota")
    end
  end

  def set_movimiento
    Movimiento.create!(:caja_id => contrato.caja_id, :fecha => Date.today, :cajas_concepto_id => 1, :monto => total*-1, :pago_id => id,
    :descripcion => "Generado por cobro #{id}")
  end

  def update_movimiento
    movimiento.update!(:monto => total*-1)
  end

end
