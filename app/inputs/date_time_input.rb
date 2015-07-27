class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input_html_classe
    @builder.text_field(attribute_name,input_html_options)   
    super.push('datepicker')
  end
end