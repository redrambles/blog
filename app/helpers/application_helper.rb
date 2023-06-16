module ApplicationHelper
  include Pagy::Frontend

  def body_class
    controller_name.dasherize
  end
end
