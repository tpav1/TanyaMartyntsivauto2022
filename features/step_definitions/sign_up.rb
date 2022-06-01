Given(/^Gitlab signup page is opened$/) do
  visit 'https://gitlab.testautomate.me/users/sign_up'
end

When(/^I fill in first name$/) do
  find(:xpath, '//*[@id="new_user_first_name"]').set 'Tetiana'
end

And(/^I fill in last name$/) do
  find(:xpath, '//*[@id="new_user_last_name"]').set 'Martyntsiv'
end

And(/^I fill in username$/) do
  find(:xpath, '//*[@id="new_user_username"]').set "user_#{Time.now.to_i}"
end

And(/^I fill in email$/) do
  find(:xpath, '//*[@id="new_user_email"]').set "user#{Time.now.to_i}@gmail.com"
end

And(/^I fill in password$/) do
  find(:xpath, '//*[@id="new_user_password"]').set 'asdfgh123'
end

And(/^I click register button$/) do
  find(:xpath, '//*[@id="new_new_user"]/div[7]/input').click
end

Then(/^I see Welcome to GitLab text$/) do
  expect(find(:xpath, '//*[@id="content-body"]/div[2]/div/div/h2').text).to eql "Welcome to GitLab,\nTetiana!"
end
