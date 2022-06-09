
Given(/^Gitlab login page is opened$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

user_credentials_array = []

file = File.open("current_user_credentials.rtf", "r")
while (line = file.gets)
  user_credentials_array << line
end

file.close

user_name = user_credentials_array[0]
user_password = user_credentials_array[1]

puts(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> user_name = #{user_name}, user_password = #{user_password}")

When(/^I enter username$/) do
  @sign_in_page.login_field.set user_name # 'tmar'
end

And(/^I enter password$/) do
  @sign_in_page.password_field.set user_password # 'qwerty123'
end

And(/^I click sign in button$/) do
  @sign_in_page.sign_in_btn.click
end

Then(/^I see the welcome message text$/) do
  @home_page = HomePage.new
  expect(@home_page.welcome_msg.text).to eql 'Welcome to GitLab'
end

#Given(/^GitLab user is signed in$/) do
#user
#end