class Liquidacion < ActiveRecord::Base

	attr_accessor :contrato_total, :contrato_pagado, :contrato_saldo

  belongs_to :contrato
  belongs_to :inquilino, class_name: "Persona"
  belongs_to :propietario, class_name: "Persona"
end
