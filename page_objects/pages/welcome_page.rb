class WelcomePage < SitePrism::Page
  # element :welcome_msg, :xpath, '/html/body/div[1]/div/div[2]/main/div[2]/div/div/h2'
  element :welcome_msg, :xpath, '//*[@id="content-body"]/div[2]/div/div/h2'
  element :user_role, :xpath, '//*[@id="user_role”]'
  element :get_started_btn, '#get_started_button'
  element :gitlab_quote, '#content-body > div.container > div.gl-text-center.gl-pt-6.gl-pb-7 > p'
end

  #/html/body/div[1]/div/div[2]/main/div[2]/div/div/h2
  # //*[@id="content-body"]/div[2]/div/div/h2
