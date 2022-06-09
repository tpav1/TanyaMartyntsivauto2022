class HomePage < SitePrism::Page
  element :welcome_msg, '#content-body > div.row.gl-flex-grow-1 > div > div > h2'
  element :chevron_down_icon, '#body > header > div > div > div.navbar-collapse.collapse > ul > li.nav-item.header-user.js-nav-user-dropdown.dropdown.show > a > svg'
  element :sign_out_btn, '#body > header > div > div > div.navbar-collapse.collapse > ul > li.nav-item.header-user.js-nav-user-dropdown.dropdown.show > div > ul > li:nth-child(13) > a'
  end