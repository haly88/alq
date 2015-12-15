class ContratosItem < ActiveRecord::Base

	attr_accessor :saldado

	has_many :liquidaciones

	#has_many :contratos_items_liquidaciones
	#has_many :liquidaciones, :through => :contratos_items_liquidaciones
	
  belongs_to :contrato

  validates :monto, :fecha_desde, :presence => true 
  validates :monto, :numericality => {:greater_than => 0}

	default_scope { order('fecha_desde') }  

  def get_pagado
  	liquidaciones.sum(:neto) + liquidaciones.sum(:descuento)
  end

  def get_a_pagar
  	monto - get_pagado
  end
end
