class ContratosPersonasTipo < ActiveRecord::Base
	belongs_to :inquilino, class_name: "Persona" 
	belongs_to :propietario, class_name: "Persona"
	belongs_to :garante, class_name: "Persona"
	belongs_to :contrato
end
