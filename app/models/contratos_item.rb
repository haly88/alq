class ContratosItem < ActiveRecord::Base

	attr_accessor :saldado

	has_many :liquidaciones
  
  belongs_to :contrato

  validates :monto, :fecha_desde, :presence => true 
  validates :monto, :numericality => {:greater_than => 0}

  validate :liquidado?, on: :update
  before_destroy :liquidado?

	default_scope { order('fecha_desde') }  

  def get_pagado
  	liquidaciones.sum(:neto)
  end

  def get_a_pagar
  	monto - get_pagado
  end

  private

  def liquidado?
    if liquidaciones.any?
      errors.add(:fecha_desde, "La cuota se encuentra liquidada.")
      return false
    end
  end
end
