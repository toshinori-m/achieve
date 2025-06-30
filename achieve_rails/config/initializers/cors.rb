# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors'
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins [
      ENV['BRANCH_ORIGIN'],
      ENV['FRONTEND_ORIGIN'],
      'https://goals-achieve.click',
      'https://www.goals-achieve.click',
      'https://backend-goals-achieve.onrender.com'
    ].compact

    resource '*',
             headers: :any,
             expose: %w[access-token expiry token-type uid client],
             methods: %i[get post put patch delete options head],
             credentials: false
  end
end
