class ProjectMembersPage < SitePrism::Page
  set_url'https://gitlab.testautomate.me/username/my-awesome-project-name/-/project_members'
  element :invite_members_btn, :xpath, '//*[@id="content-body"]/div[2]/div/div[1]/div[2]/div/button[2]/span'
end