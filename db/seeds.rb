demo_event = Event.find_or_initialize_by(name: 'demo')
demo_event.description = "Apenas uma demonstração"
demo_event.event_type = Event.event_types[:wedding]
demo_event.celebration_date = DateTime.new(2018,12, 30, 19, 00)
demo_event.save if demo_event.changed?

if Rails.env.development?
  hugo_and_luana_event = Event.find_or_initialize_by(name: 'hugoeluana')
  hugo_and_luana_event.description = "Casal Perfeito"
  hugo_and_luana_event.event_type = Event.event_types[:wedding]
  hugo_and_luana_event.celebration_date = DateTime.new(2018,12, 30, 19, 00)
  hugo_and_luana_event.save if hugo_and_luana_event.changed?
end
