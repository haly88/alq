class Caja < ActiveRecord::Base

	has_many :comentarios, as: :comentable, :dependent => :destroy

	validates :nombre, :uniqueness => {:case_sensitive => false}
	validates :codigo, :uniqueness => {:case_sensitive => false}
	validates :nombre, :codigo,  presence: true 
end
