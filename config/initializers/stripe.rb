# frozen_string_literal: true

Stripe.api_key = Rails.application.credentials[:stripe][:secret]
