include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

def sign_in(user, options = {})
  if options[:no_capybara]
    # Signin when not using capybara
    sign_in user
  else
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
  end
end



def fill_valid_signup_details
  fill_in "First Name", with: "Chandan"
  fill_in "Last Name", with: "Kumar"
  fill_in "Email", with: "chandan.jhun@example.com"
  fill_in "Password", with: "foobar"
  fill_in "Confirm Password", with: "foobar"
end
