module ApplicationHelper


def devise_mapping
  Devise.mappings[:student]
end

def resource_question
  devise_mapping.question
end

def resource_class
  devise_mapping.to
end

end
