Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, App.google_client_id, App.google_client_secret
  provider :github, App.github_client_id, App.github_client_secret, scope: 'user:email'
end
