class Contrato < ActiveRecord::Base

	has_many :contratos_impuestos, :dependent => :destroy
	has_many :impuestos, :through => :contratos_impuestos
	belongs_to :inmueble
	has_many :contratos_inquilinos, class_name: "ContratosPersonasTipo" 
 	has_many :contratos_propietarios, class_name: "ContratosPersonasTipo"
  has_many :contratos_garantes, class_name: "ContratosPersonasTipo"
	has_many :inquilinos, through: :contratos_inquilinos
  has_many :propietarios, through: :contratos_propietarios
	has_many :garantes, through: :contratos_garantes

	has_many :contratos_items, dependent: :destroy
	accepts_nested_attributes_for :contratos_items, :allow_destroy => true, :reject_if => lambda { |a| a[:monto].blank? }

	#Validaciones
	validates :codigo, :inmueble_id, :presence => true 
	validates :inmueble_id, :uniqueness => true
end
