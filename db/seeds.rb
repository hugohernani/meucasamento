# Default Roles
Role.default_roles.each do |role|
  Role.find_or_create_by(name: role)
end

default_theme = Theme.find_or_initialize_by(name: 'Default', layout_name: 'default')
default_theme.save if default_theme.changed?

demo_event = Event.find_or_initialize_by(name: 'demo')
demo_event.description = "Apenas uma demonstração"
demo_event.event_type = Event.event_types[:wedding]
demo_event.celebration_date = DateTime.new(2018,12, 30, 19, 00)
demo_event.save if demo_event.changed?

if Rails.env.development?
  hugo_and_luana_event = Event.find_or_initialize_by(name: 'hugoeluana')
  hugo_and_luana_event.description = "Casal Perfeito"
  hugo_and_luana_event.event_type = Event.event_types[:wedding]
  hugo_and_luana_event.celebration_date = DateTime.new(2017,6, 17, 19, 00)
  hugo_and_luana_event.save if hugo_and_luana_event.changed?
end

hugo_account = Account.find_or_initialize_by(email: 'hhernanni@gmail.com')
hugo_account.name = "Hugo Hernani Ferreira da Silva"
hugo_account.social_name = "Hugo"
hugo_account.password = hugo_account.password_confirmation = ENV['HUGO_PASSWORD']
hugo_account.save if hugo_account.changed?

hugo_account.add_role :super_admin unless hugo_account.has_role? :super_admin
hugo_account.add_role :fiance unless hugo_account.has_role? :fiance

hugo_account.event_participants.find_or_create_by(
  event: hugo_and_luana_event, event_role: EventParticipant.event_roles[:as_groom])

luana_account = Account.find_or_initialize_by(email: 'lualegresperta@gmail.com')
luana_account.name = "Nataly Luana Gomes Silva"
luana_account.social_name = "Luana"
luana_account.password = luana_account.password_confirmation = ENV['NATALY_PASSWORD']
luana_account.save if luana_account.changed?

luana_account.add_role :fiance unless luana_account.has_role? :fiance

luana_account.event_participants.find_or_create_by(
  event: hugo_and_luana_event, event_role: EventParticipant.event_roles[:as_bride])
