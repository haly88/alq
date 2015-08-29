class Liquidacion < ActiveRecord::Base

	attr_accessor :contrato_total, :contrato_pagado, :contrato_saldo

  belongs_to :contrato
end
