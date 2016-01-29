module ApplicationHelper
	def link_to_add_fields(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s + "_fields", f: builder)
	    end
	    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def custom_form_for(object, options = {}, &block)
    options[:builder] = CustomFormBuilder
    form_for(object, options, &block)
  end
end
