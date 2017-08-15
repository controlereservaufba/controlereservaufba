module ControlesHelper
def formato_data(date)
  if date.present?
   date.strftime("%d/%m/%Y")
  else
    ''
  end 
end
end
