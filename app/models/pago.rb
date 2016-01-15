class Pago < ActiveRecord::Base

  has_many :comentarios, as: :comentable, :dependent => :destroy

  belongs_to :contrato
  belongs_to :contratos_item
  belongs_to :propietario, class_name: "Persona"

  validates :contrato, :fecha, :propietario_id, :presence => true
  validates :total, :numericality => {:greater_than => 0}

  validate :valor_pago

  def valor_pago
    if neto - (neto_was.nil? ? 0 : neto_was) > contratos_item.get_a_pagar
      errors.add(:neto, "No puede superar el pendiente de la cuota")
    end
  end

end
