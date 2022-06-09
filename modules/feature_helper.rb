module FeatureHelper
  def sign_in_user(username, password)
    @sign_in_page = SignInPage
    @sign_in_page.load
    @sign_in_page.login_field.set username
    @sign_in_page.password_field.set password
    @sign_in_page.sign_in_btn.click
  end

  def registered_user(firstname, lastname, username, email, password)
  @sign_up_page = SignUpPage
  @sign_up_page.load
  @sign_up_page.first_name_field.set firstname
  @sign_up_page.last_name_field.set lastname
  @sign_up_page.username_field.set username
  @sign_up_page.user_email_field.set email
  @sign_up_page.password_field.set password
  @sign_up_page.register_btn.click
   end
  end