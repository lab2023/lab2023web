class Admins::RegistrationsController < Devise::RegistrationsController
  layout "admins/application"
  def update
    super
  end
  protected

  def after_update_path_for(resource)
    admins_dashboard_index_path
  end
end