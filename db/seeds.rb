require 'watir'

browser = Watir::Browser.new
email = "kenzodouchet33@gmail.com"
password = "Mouhaha1234@"
browser.goto('https://kitt.lewagon.com/alumni?search=&places=Bordeaux')
browser.element(css: ".btn.btn-blue").click
browser.text_field(id: 'login_field').set(email)
browser.text_field(id: 'password').set(password)
browser.input(value: 'Sign in').click
browser.element(css: ".alumni-card-link").click
  full_name = browser.h1.text
  batch_string = browser.h4.text
  github = browser.element(css: ".alumnus-link").following_sibling(tag_name: 'a').href
  description = browser.div(css: ".alumnus-info-card-content").text
  avatar = browser.img(css: ".rounded-circle.alumnus-avatar").src
  if browser.div.span.exists?
     status = "alumni"
  else
    status = browser.div.span.text
  end

  p batch = batch_string.split("(")[0].split("#")[1].split()[0]
  p batch_date = batch_string.split("(")[1].split(" - " )[0]
  p city = batch_string.split("(")[1].split(" - " )[1].split()[0]
  p first_name = full_name.split()[0]
  p last_name = full_name.split()[1]
  p github
  p description.split("DESCRIPTION")[1].split("SKILL")[0]
  p avatar
  p status
