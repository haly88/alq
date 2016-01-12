class ContratosItem < ActiveRecord::Base

	has_many :liquidaciones, :dependent => :restrict_with_error
  
  belongs_to :contrato

  validates :monto, :fecha_desde, :presence => true 
  validates :monto, :numericality => {:greater_than => 0}

  validate :validar_liquidado?, on: :update

	default_scope { order('fecha_desde') }  

  def get_pagado
  	liquidaciones.sum(:neto)
  end

  def get_a_pagar
  	monto - get_pagado
  end

  def liquidado?
    liquidaciones.any?
  end

  private

  def validar_liquidado?
    if liquidaciones.any?
      errors.add(:base, "Las cuotas se encuentran liquidadas.")
      return false
    end
  end
end
