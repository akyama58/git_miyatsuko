module ApplicationHelper
  def relation_select(name, value, label)
    model = name.to_s.camelize.constantize
    model.pluck(label, value)
  end
end
