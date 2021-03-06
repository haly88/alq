class CustomFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template
  
  %w[text_field text_area password_field collection_select select check_box number_field grouped_collection_select].each do |method_name|
    define_method(method_name) do |name, *args|
      if field_label(name, *args).nil?
        super(name, *args)
      else
        field_label(name, *args) + super(name, *args)
      end
    end
  end

  # def check_box(name, *args)
  #   content_tag :div, class: "field" do
  #     super + " " + field_label(name, *args)
  #   end
  # end
  
  
  def error_messages
    if object.errors.full_messages.any?
      content_tag(:div, :class => "error_messages") do
        content_tag(:div, "Verifique los datos cargados", :class => "alert-box alert", id: "data-alert", :data => {:alert =>  nil} ) +
        content_tag(:ul) do
          object.errors.full_messages.map do |msg|
            content_tag(:li, msg)
          end.join.html_safe
        end
      end
    end
  end
  
private

  def field_label(name, *args)
    options = args.extract_options!
    required = object.class.validators_on(name).any? { |v| v.kind_of? ActiveModel::Validations::PresenceValidator }
    label(name, options[:label], class: ("required" if required)) unless options[:label] == ""
  end
  
  def objectify_options(options)
    super.except(:label)
  end
end