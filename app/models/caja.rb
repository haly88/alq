class Caja < ActiveRecord::Base

	validates :nombre, :uniqueness => {:case_sensitive => false}
	validates :codigo, :uniqueness => {:case_sensitive => false}
	validates :nombre, :codigo,  presence: true 
end
