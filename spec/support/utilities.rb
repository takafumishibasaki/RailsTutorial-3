include SessionsHelper

def full_title(page_title = '')
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    page_title + " | " + base_title
  end
end

def sign_in(user, options={})
  if options[:no_capybara]
    # Capybaraを使用していない場合にもサインインする。
    login(user)
  else
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end
