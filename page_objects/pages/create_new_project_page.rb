class CreateNewProjectPage < SitePrism::Page
  set_url'https://gitlab.testautomate.me/projects/new'
  element :create_blank_project, :xpath, '//*[@id="content-body"]/div[2]/div[2]/div[1]/div[1]/a/div[2]/h3'
end




