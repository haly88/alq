class Liquidacion < ActiveRecord::Base

  belongs_to :contrato
  belongs_to :contratos_item
  belongs_to :inquilino, class_name: "Persona"

  validates :contrato, :presence => true, on: :create
  validates :fecha, :presence => true
  validates :total, :numericality => {:greater_than => 0}

  validate :pago_menor_a_total

  def pago_menor_a_total
    if total > contratos_item.get_a_pagar
      errors.add(:total, "No puede superar el total a pagar")
    end
  end

  def get_mora
    empresa = Empresa.find(1)
    get_a_pagar = contratos_item.get_a_pagar
    if fecha.day > empresa.mora_fija_dia
      mora_total = empresa.mora_fija_monto
      mora_total += get_a_pagar * (empresa.mora_fija_porc / 100)
    end
    if fecha.day > empresa.mora_var_dia
      mora_total += (fecha.day - empresa.mora_var_dia) * empresa.mora_var_monto
      mora_total += (fecha.day - empresa.mora_var_dia) * (get_a_pagar * (empresa.mora_var_porc / 100))
    end
    return mora_total
  end

  def get_a_pagar
    contratos_item.get_a_pagar + get_mora
  end

  # private

  # before_save :guardar_saldo

  # def guardar_saldo
  #   contratos_item_saldo = self.contratos_item.saldo + self.total
  #   self.contratos_item.update_attributes(saldo: contratos_item_saldo)
  # end

end
