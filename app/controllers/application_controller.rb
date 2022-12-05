class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  unless Rails.env.production? || Rails.env.test?
    around_action :n_plus_one_detection

    def n_plus_one_detection
      Prosopite.scan
      yield
    ensure
      Prosopite.finish
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
