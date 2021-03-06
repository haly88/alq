class Persona < ActiveRecord::Base

  has_many :comentarios, as: :comentable, :dependent => :destroy
	#aca es el unico lugar donde debemos especificar que campo.. porque iria a buscar persona_id a la tabla y no la encontraria
	has_many :contratos_inquilinos, class_name: "ContratosPersonasTipo", foreign_key: "inquilino_id", :dependent => :restrict_with_error
  has_many :contratos_propietarios, class_name: "ContratosPersonasTipo", foreign_key: "propietario_id", :dependent => :restrict_with_error
  has_many :contratos_garantes, class_name: "ContratosPersonasTipo", foreign_key: "garante_id", :dependent => :restrict_with_error

  validates :nombre, :tipo,  presence: true 
  validates :nombre,  :uniqueness => {:case_sensitive => false}

  scope :inquilinos, ->{where(tipo: 'Inquilino')}
  scope :propietarios, ->{where(tipo: 'Propietario')}
  scope :garantes, ->{where(tipo: 'Garante')}
  scope :otros, ->{where(tipo: 'Otro')}

  # def tipo_de_persona
  # 	 errors.add(:es_inquilino, "sin tipo") unless self.es_algo?
  # end

  # def es_algo?
  # 	es_inquilino || es_propietario || es_garante || es_otro
  # end
end
