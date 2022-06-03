require 'watir'

browser = Watir::Browser.new
browser.goto('https://kitt.lewagon.com/alumni?search=&places=Bordeaux')
browser.element(css: ".btn.btn-blue").click
browser.text_field(id: 'login_field').set(ENV["PSEUDO"])
browser.text_field(id: 'password').set(ENV["PASSWORD"])
browser.input(value: 'Sign in').click
sleep(5)
12.times do browser.scroll.to :bottom
  sleep(4)
end
cards_links = []
 links = browser.divs(css: ".alumni-card")
 p links.count
 links.map do |link|
    link.as.map do |a|
      if a.href.include?("https://kitt.lewagon.com/")
        cards_links << a.href
      end
    end
  end
all_links = cards_links.select {|link| link.include?("https://kitt.lewagon.com/")}
all_links.each do |link|
  browser.goto(link)
  full_name = browser.h1.text
  batch_string = browser.h4.text
  github = browser.element(css: ".alumnus-link").following_sibling(tag_name: 'a').href
  description = browser.div(css: ".alumnus-info-card-content").text
  avatar = browser.img(css: ".rounded-circle.alumnus-avatar").src
  if browser.div.span(css: ".alumnus-badge").present?
    status = browser.div.span(css: ".alumnus-badge").text
  else
    status = "alumni"
  end
  batch = batch_string.split("(")[0].split("#")[1].split()[0]
  batch_date = batch_string.split("(")[1].split(" - " )[0]
  city = batch_string.split("(")[1].split(" - " )[1].split()[0]
  first_name = full_name.split()[0]
  last_name = full_name.split()[1]
  description = description.split("DESCRIPTION").dig(1)&.split("SKILL")
  card = Card.new(
    first_name:    first_name,
    last_name:    last_name,
    github:    github,
    avatar:    avatar,
    batch_date:    batch_date,
    batch:    batch,
    city:    city,
    status:    status,
    description:    description,
  )
  card.save
end
