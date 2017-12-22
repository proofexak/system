json.array!(@appointments) do |appointment|
  json.title appointment.purpose
  json.start appointment.appointment_date
end