class Persona < ActiveRecord::Base

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
