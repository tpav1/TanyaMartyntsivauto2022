user = User.new

Given(/^Gitlab signup page is opened$/) do
@sign_up_page = SignUpPage.new
@sign_up_page.load
end

When(/^I fill in first name$/) do
  @sign_up_page.first_name_field.set user.firstname
end

And(/^I fill in last name$/) do
  @sign_up_page.last_name_field.set user.lastname
end

And(/^I fill in username$/) do
  @sign_up_page.username_field.set user.username
end

And(/^I fill in email$/) do
  @sign_up_page.user_email_field.set user.email
end

And(/^I fill in password$/) do
  @sign_up_page.password_field.set user.password
end

And(/^I click register button$/) do
  @sign_up_page.register_btn.click
end

Then(/^I see Welcome to GitLab text$/) do
  @welcome_page = WelcomePage.new
  expect(@welcome_page.welcome_msg.text).to eql "Welcome to GitLab,\n#{user.firstname}!"
end

#Given(/^Gitlab user is signed up$/) do
#user
#end

file_to_save = File.new("current_user_credentials.rtf", 'w+')
file_to_save.puts(user.username, user.password)
file_to_save.close

#And(/^I select role$/) do
#@welcome_page.user_role.set 'Software Developer'
#sleep 1
#end

#And(/^I click get started$/) do
# @welcome_page.get_started_btn.click
# sleep 1
#end

#Then(/^I see GitLab quote$/) do
#expect(@welcome_page.gitlab_quote.text).to eql '#<p class="gl-m-0">Faster releases. Better code. Less pain.</p>'
#sleep 1
#end

#Given(/^I am signed up$/) do
# user
#end


#And(/^I click header user drop\-down toggle$/) do
# @home_page.chevron_down_icon.click
#end

#And(/^I click sign out$/) do
#@home_page.sign_out_btn.click
#end

#Then(/^I see sign in page$/) do
#@sign_in_page.load
#sleep 2
#end