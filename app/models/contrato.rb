class Contrato < ActiveRecord::Base

	has_many :contratos_items, dependent: :destroy
	accepts_nested_attributes_for :contratos_items, :allow_destroy => true, :reject_if => lambda { |a| a[:monto].blank? }
end
