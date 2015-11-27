class Liquidacion < ActiveRecord::Base

  has_many :contratos_items_liquidaciones
  has_many :contratos_items, :through => :contratos_items_liquidaciones

  belongs_to :contrato
  belongs_to :contratos_item
  belongs_to :inquilino, class_name: "Persona"
  belongs_to :propietario, class_name: "Persona"

  validates :contrato, :presence => true, on: :create
  validates :fecha, :presence => true
  validates :total, :numericality => {:greater_than => 0}

  validate :doble_persona, on: :create

  

  def doble_persona
  	if inquilino_id and propietario_id
  	 		errors.add(:inquilino_id, "Debe liquidar solo 1 persona")
  	end
  end

  # private

  # before_save :guardar_saldo

  # def guardar_saldo
  #   contratos_item_saldo = self.contratos_item.saldo + self.total
  #   self.contratos_item.update_attributes(saldo: contratos_item_saldo)
  # end

end
