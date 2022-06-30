class HomePage < SitePrism::Page
  element :welcome_msg, :xpath, '//*[@id="content-body"]/div[2]/div[1]/h2'
  element :create_project, :xpath, '//*[@id="content-body"]/div[2]/div[2]/a[1]/div[2]'

end

