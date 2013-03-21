OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, '500414270016500', '882c5e95753ef6ec7f216969b4d405ce'
  provider :facebook, '584950538198110', 'd12da22d298e172a824a65da7c27ef06',
  				 :scope => 'email,user_birthday'
end

# Heroku credentials
	# App ID:	500414270016500
	# App Secret:	882c5e95753ef6ec7f216969b4d405ce

# Localhost credentials
	# App ID:	584950538198110
  # App Secret:	d12da22d298e172a824a65da7c27ef06