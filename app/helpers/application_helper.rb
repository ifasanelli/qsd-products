module ApplicationHelper
  def t_model(model)
    t("activerecord.models.#{model}")
  end
end
