class EventSubdomainConstraint
  def matches?(request)
    req_subdomain = request.subdomain || ''
    (req_subdomain.present? && req_subdomain != 'www') ? Event.exists?(tenant_name: req_subdomain) : false
  end
end
