class CajasConcepto < ActiveRecord::Base

	validates :nombre, :uniqueness => {:case_sensitive => false}
	validates :codigo, :uniqueness => {:case_sensitive => false}
	validates :nombre, :codigo,  presence: true 
	validate :es_interno, on: :update
	before_destroy :es_interno

	private

	def es_interno
		if interno?
			errors.add(:base, "No se pueden modificar conceptos Internos.")
			return false
		end
	end
end
