class Liquidacion < ActiveRecord::Base

	attr_accessor :contrato_total, :contrato_pagado, :contrato_saldo

  belongs_to :contrato
  belongs_to :inquilino, class_name: "Persona"
  belongs_to :propietario, class_name: "Persona"

  validates :contrato, :presence => true, on: :create

  validate :doble_persona, on: :create

  def doble_persona
  	if inquilino_id and propietario_id
  	 		errors.add(:inquilino_id, "Debe liquidar solo 1 persona")
  	end
  end
end
