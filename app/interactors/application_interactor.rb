# frozen_string_literal: true

# Application Interactor
class ApplicationInteractor
  include Interactor

  private

  def error(message)
    context.fail!(error: message)
  end
end
