r = Role.create :title => 'Refinery'

u = User.new
u.login = 'admin'
u.email = 'change-me@example.com'
u.password = 'admin'
u.password_confirmation = 'admin'
u.save

# Refinery settings
Dir[Rails.root.join('db', 'seeds','*.rb').to_s].each do |file|
  load(file)
end

# Update plugins position
u.reload
%W{ refinery_dashboard refinery_pages features refinerycms_blog events galleries refinery_files refinery_images refinery_inquiries refinery_users refinery_settings }.each_with_index do |plugin, i|
  if p = u.plugins.find_by_name(plugin)
    p.update_attribute(:position, i)
  else
    u.plugins.create(:name => plugin, :position => i)
  end
end

u.roles << r


# Feature attributes
attributes = <<-ATTRIBUTES
ecs_id:string
state:string
ref:string
status:string
submission_date:string
area:string
limit:string
description:string
firstname:string
lastname:string
address:string
zip:string
city:string
state:string
ratification:string
geology_of_the_area:string
resources_of_the_area:string
maritime_transport_through_the_area:string
harbors_in_the_area:string
climate:change:text
eutrophication:text
hazardous_substances:text
radioactive_substances:text
offshore_and_gas_industry:text
fishing:text
other_human_uses_and_impacts:text
biodiversity_and_ecosystems:text
order_of_submission:string
date_of_submission:string
comment:text
communications_received_with_regard_to_the_submission:text
provisions_of_article_76:text
maximal_water_depth_in_metres_in_submission_area:string
average_water_depth_in_metres_in_submission_area:string
status_of_preparation:text
intended_date_of_making_a_submission:string
communication_from_other_states:string
ATTRIBUTES

RefinerySetting.set(:feature_attributes, attributes)