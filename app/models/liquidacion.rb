class Liquidacion < ActiveRecord::Base

  has_many :comentarios, as: :comentable, :dependent => :destroy

  belongs_to :contrato
  belongs_to :contratos_item
  belongs_to :inquilino, class_name: "Persona"

  validates :contrato, :fecha, :inquilino_id, :presence => true
  validates :total, :numericality => {:greater_than => 0}

  validate :valor_cobro

  def valor_cobro
    if neto - (neto_was.nil? ? 0 : neto_was) > contratos_item.get_a_cobrar
      errors.add(:neto, "No puede superar el pendiente de la cuota")
    end
  end

  def get_mora
    empresa = Empresa.find(1)
    get_a_cobrar = contratos_item.get_a_cobrar
    mora_total = 0
    if fecha.day > empresa.mora_fija_dia
      mora_total = empresa.mora_fija_monto
      mora_total += get_a_cobrar * (empresa.mora_fija_porc / 100)
    end
    if fecha.day > empresa.mora_var_dia
      mora_total += (fecha.day - empresa.mora_var_dia) * empresa.mora_var_monto
      mora_total += (fecha.day - empresa.mora_var_dia) * (get_a_cobrar * (empresa.mora_var_porc / 100))
    end
    return mora_total
  end


  # private

  # before_save :guardar_saldo

  # def guardar_saldo
  #   contratos_item_saldo = self.contratos_item.saldo + self.total
  #   self.contratos_item.update_attributes(saldo: contratos_item_saldo)
  # end

end
