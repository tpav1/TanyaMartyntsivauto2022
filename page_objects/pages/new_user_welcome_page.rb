class NewUserWelcomePage < SitePrism::Page
  set_url'https://gitlab.testautomate.me/users/sign_up/welcome'

  element :welcome_msg, :xpath, '//*[@id="content-body"]/div[2]/div/div/h2'
  element :role_field, :xpath, '//*[@id="user_role"]'
  element :get_started_btn, :xpath, '/html/body/div[1]/div/div[2]/main/div[2]/div/div/form/div[5]/div/button'
end


