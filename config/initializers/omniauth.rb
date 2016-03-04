Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, App.google_client_id, App.google_client_secret, skip_jwt: Rails.env.development?
  provider :github, App.github_client_id, App.github_client_secret, scope: 'user:email'
end

# Gracefully handle failures instead of exploding
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
