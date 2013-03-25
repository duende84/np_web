OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env.production?
		provider :facebook, '500414270016500', '882c5e95753ef6ec7f216969b4d405ce',
						 :scope => 'email,user_birthday'
	else
		provider :facebook, '584950538198110', 'd12da22d298e172a824a65da7c27ef06',
  				   :scope => 'email,user_birthday'
	end
end