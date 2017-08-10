module ReservasHelper
def formato_data(date)
 if date.present?
  date.strftime("%d/%m/%Y")
 end 
end
end
