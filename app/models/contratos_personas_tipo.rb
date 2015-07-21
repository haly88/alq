class ContratosPersonasTipo < ActiveRecord::Base
	#aca sabe por el nombre :inquilino que el campo que tiene que usar es 
	#inquilino_id
	belongs_to :inquilino, class_name: "Persona" 
	belongs_to :propietario, class_name: "Persona"
	belongs_to :garante, class_name: "Persona"
	belongs_to :contrato
end
