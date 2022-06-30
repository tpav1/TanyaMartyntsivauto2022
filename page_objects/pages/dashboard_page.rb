class DashboardPage < SitePrism::Page
  set_url'https://gitlab.testautomate.me/dashboard/projects'
  element :welcome_msg, :xpath, '//*[@id="content-body"]/div[2]/div[1]/h2'
end
