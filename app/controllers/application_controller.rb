# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Apartment::TenantNotFound, with: :render_404

  private

  def render_404(_exception)
    render 'errors/not_found'
  end
end
