# Rails Commands

rails g model Sport title:string description:text image_link:string
rails g model Club name:string image_link:string country:string established:integer description:text sport:references
rails g model Player name:string position:string country:string image_link:string description:text club:references

# rails d model Sport
# rails d model Club
# rails d model Player

rake db:create
# rake db:drop
rake db:migrate
# rake db:rollback

rails g controller sports
rails g controller clubs


rails g controller players
