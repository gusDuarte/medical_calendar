include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara as well.                                  
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in _('Email address'),    with: user.email
    fill_in _('Password'),         with: user.password
    click_button _('Sign in')
  end
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

