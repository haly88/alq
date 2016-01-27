# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless InmuebleTipo.any?
	InmuebleTipo.create!(:id => 1, :codigo => 'DEP', :nombre => 'Departamento')
	InmuebleTipo.create!(:id => 2, :codigo => 'CAS', :nombre => 'Casa')
	InmuebleTipo.create!(:id => 3, :codigo => 'PH', :nombre => 'PH')
	InmuebleTipo.create!(:id => 4, :codigo => 'CBC', :nombre => 'Countrie, Barrio Cerrado	')
	InmuebleTipo.create!(:id => 5, :codigo => 'QUI', :nombre => 'Quinta')
	InmuebleTipo.create!(:id => 6, :codigo => 'TLO', :nombre => 'Terreno, Lote')
	InmuebleTipo.create!(:id => 7, :codigo => 'CAM', :nombre => 'Campo')
	InmuebleTipo.create!(:id => 8, :codigo => 'GDE', :nombre => 'Galpon, Deposito')
	InmuebleTipo.create!(:id => 9, :codigo => 'OFI', :nombre => 'Oficina')
	InmuebleTipo.create!(:id => 10, :codigo => 'COC', :nombre => 'Cochera')
end

unless Empresa.any?
	Empresa.create!(:id => 1)
end

unless Caja.any?
	Caja.create!(:id => 1, :codigo => "cajachica", :nombre => "Caja Chica")
end

unless CajasConcepto.any?
	CajasConcepto.create!(:id => 1, :codigo => "cobroinquilino", :nombre => "Cobro a Inquilino", :interno => true)
	CajasConcepto.create!(:id => 2, :codigo => "pagopropietarios", :nombre => "Pago a Propietarios", :interno => true)
	CajasConcepto.create!(:id => 3, :codigo => "varios", :nombre => "Varios", :interno => false)
end