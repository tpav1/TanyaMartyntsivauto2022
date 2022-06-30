class CreateBlankProjectPage < SitePrism::Page
  set_url'https://gitlab.testautomate.me/projects/new#blank_project'
  element :project_name_field, :xpath, '//*[@id="project_name"]'
  element :create_project_btn, :xpath, '//*[@id="new_project"]/input[2]'
  element :project_information, :xpath, '/html/body/div[3]/aside/div/ul/li[2]/a/span[2]'
  element :project_members_section, :xpath, '//*[@id="js-onboarding-members-link"]/span'
  element :project_members_title, :xpath, '//*[@id="content-body"]/div[2]/div/div[1]/div[1]/div/h4'
  element :invite_members_btn, :xpath, '//*[@id="content-body"]/div[2]/div/div[1]/div[2]/div/button[2]/span'
  element :gitlab_member_modal_txt, :xpath, '//*[@id="invite-members-modal-3___BV_modal_header_"]/h4'
  element :gitlab_member_field, '#members-token-select-input'
  element :dev3_member, :xpath, '//*[@id="__BVID__2405"]/div/div/div[1]/div/div/span/span'
  element :invite_btn, :xpath, '//*[@id="invite-members-modal-3___BV_modal_footer_"]/button[2]/span'
  element :confirmation_msg, :xpath, '//*[@id="gl-toast-1"]/div'
  element :chevron_down_icon, :xpath, '/html/body/header/div/div/div[2]/ul/li[8]/a/img'
  element :sign_out, :xpath, '/html/body/header/div/div/div[2]/ul/li[8]/div/ul/li[13]/a'

end
