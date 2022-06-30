Given(/^I register 'Project Owner' user via 'API'$/) do
@user = User.new

payload = {
"name": "#{@user.firstname} #{@user.lastname}",
"username": @user.username,
"email": @user.email,
"password": @user.password,
"skip_confirmation": true
}
response = RestClient.post('https://gitlab.testautomate.me/api/v4/users', payload, headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})

user_credentials = { username: @user.username, password: @user.password, id: JSON.parse(response.body)['id']}.to_json
File.open('Project_owner_user.json', 'w') { |file| file.write(user_credentials) }
end

And(/^I see this 'Project Owner' user is registered via 'API'$/) do
response = RestClient.get("https://gitlab.testautomate.me/api/v4/users?username=#{@user.username}", headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})
expect(response.code).to eql 200
expect(JSON.parse(response.body)[0]['username']).to eql @user.username
expect(JSON.parse(response.body)[0]['email']).to eql @user.email
expect(JSON.parse(response.body)[0]['name']).to eql "#{@user.firstname} #{@user.lastname}"
end

And(/^I register 'Developer' user via 'API'$/) do
@user = User.new

payload = {
"name": "#{@user.firstname} #{@user.lastname}",
"username": @user.username,
"email": @user.email,
"password": @user.password,
"skip_confirmation": true
}
response = RestClient.post('https://gitlab.testautomate.me/api/v4/users', payload, headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})

user_credentials = { username: @user.username, password: @user.password, id: JSON.parse(response.body)['id']}.to_json
File.open('Developer_user.json', 'w') { |file| file.write(user_credentials) }
end

And(/^I see this 'Developer' user is registered via 'API'$/) do
response = RestClient.get("https://gitlab.testautomate.me/api/v4/users?username=#{@user.username}", headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})
expect(response.code).to eql 200
expect(JSON.parse(response.body)[0]['username']).to eql @user.username
expect(JSON.parse(response.body)[0]['email']).to eql @user.email
expect(JSON.parse(response.body)[0]['name']).to eql "#{@user.firstname} #{@user.lastname}"
end


And(/^I see new user welcome page$/) do
  @new_user_welcome_page = NewUserWelcomePage.new
  expect(@new_user_welcome_page.welcome_msg.text).to include 'Welcome to GitLab'
  expect(@new_user_welcome_page.role_field.text).to include 'Select a role'
  sleep 1
end

And(/^I see Role drop\-down field$/) do
  @new_user_welcome_page.find_field('Role').value
  sleep 1
end

And(/^I click on Role drop\-down$/) do
  @new_user_welcome_page.role_field.click
  sleep 1
end

And(/^I select 'Developer' role$/) do
  select "Software Developer", :from => "user_role"
  sleep 2
  end

And(/^I click 'Get started' button$/) do
  @new_user_welcome_page.get_started_btn.click
  sleep 2
end

And(/^I see this 'Developer' user is registered via 'UI'$/) do
  @dashboard_page = DashboardPage.new
  expect(@dashboard_page.welcome_msg.text).to include 'Welcome to GitLab'
  reset_session!
  sleep 2
end

When(/^I log in to gitlab with 'Project Owner' user$/) do
   @sign_in_page = SignInPage.new
   user_credentials = JSON.parse(File.read('Project_owner_user.json'))
   sign_in_user user_credentials['username'], user_credentials['password']
   sleep 2
end


And(/^I see the 'Project Owner' user is logged in$/) do
   @home_page = HomePage.new
   expect(@home_page.welcome_msg.text).to include 'Welcome to GitLab'
   sleep 2
end

Then(/^I can see 'Create a project' button on the 'Home Page'$/) do
  @home_page.create_project.click
  sleep 2
end

When(/^I create a new blank project$/) do
  @create_new_project_page = CreateNewProjectPage.new
  @create_new_project_page.create_blank_project.click
  sleep 2
end

Then(/^I see that project was successfully created$/) do
  @create_blank_project_page = CreateBlankProjectPage.new
  @create_blank_project_page.project_name_field.set 'My awesome project name'
  @create_blank_project_page.create_project_btn.click
end

#When(/^I open 'Project members' page$/) do
#@project_members_page = ProjectMembersPage.new
#@project_members_page.invite_members_btn.click
#end


#And(/^I click 'Invite members' button$/) do
#@project_members_page.invite_members_btn.click
#end


When(/^I press 'Project Information'$/) do
  @create_blank_project_page.project_information.click
end

And(/^I select 'Members'$/) do
  @create_blank_project_page.project_members_section.click
end

Then(/^I see 'Project Members' page$/) do
  expect(@create_blank_project_page.project_members_title.text).to include 'Project members'
  sleep 3
end


When(/^I log out$/) do
  @create_blank_project_page.chevron_down_icon.click
  @create_blank_project_page.sign_out.click
end

Then(/^I can delete 'Project Owner' user via API$/) do
  user_credentials = JSON.parse(File.read('Project_owner_user.json'))
  response = RestClient.delete("https://gitlab.testautomate.me/api/v4/users#{user_credentials['id']}?hard_delete=true", headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})
  expect(response.code).to eql 204
end

And(/^I can delete 'Developer' user via API$/) do
  user_credentials = JSON.parse(File.read('Developer_user.json'))
  response = RestClient.delete("https://gitlab.testautomate.me/api/v4/users#{user_credentials['id']}?hard_delete=true", headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})
  expect(response.code).to eql 204
end

