class Liquidacion < ActiveRecord::Base

	attr_accessor :liquidacion_refresh, :total

  belongs_to :contrato
  belongs_to :inquilino, class_name: "Persona"
  belongs_to :propietario, class_name: "Persona"

  validates :contrato, :presence => true, on: :create
  validates :total, :numericality => {:greater_than => 0}

  validate :doble_persona, on: :create

  def doble_persona
  	if inquilino_id and propietario_id
  	 		errors.add(:inquilino_id, "Debe liquidar solo 1 persona")
  	end
  end
end
