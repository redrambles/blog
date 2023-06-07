module ApplicationHelper
  def body_class
    controller_name.dasherize.to_s
  end
end
