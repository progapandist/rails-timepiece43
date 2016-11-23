# Hope this doesn't break anything, remove if it does

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_KEY'], ENV['FB_SECRET'], image_size: 'large'
end
