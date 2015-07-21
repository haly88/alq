class Persona < ActiveRecord::Base
	#aca es el unico lugar donde debemos especificar que campo.. porque iria a buscar persona_id a la tabla y no la encontraria
	has_many :contratos_inquilinos, class_name: "ContratosPersonasTipo", foreign_key: "inquilino_id"
  has_many :contratos_propietarios, class_name: "ContratosPersonasTipo", foreign_key: "propietario_id"
  has_many :contratos_garantes, class_name: "ContratosPersonasTipo", foreign_key: "garante_id"

	validates :codigo,  presence: true 
  validates :nombre,  presence: true 

  validate :tipo_de_persona

  def tipo_de_persona
  	 errors.add(:persona_id, "sin tipo") unless self.es_algo?
  end

  def es_algo?
  	es_inquilino || es_propietario || es_garante || es_otro
  end
end
