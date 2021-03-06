include ApplicationHelper

def sign_in(user, options = {})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = SecureRandom.urlsafe_base64
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, Digest::SHA1.hexdigest(remember_token))
  else
    visit signin_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end
