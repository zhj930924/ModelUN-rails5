# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Crisis.create!(real_name: "Example Crisis",
            committee: "BooShoot",
            position: "major_booshooter",
            graduation_class: 2016,
            email: "crisis@example.com",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)


Crisis.create!(real_name: "Bill Su",
            committee: "BooShoot",
            position: "major_booshooter",
            graduation_class: 2016,
            email: "crisis2@example.com",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)
            
Delegate.create!(real_name: "Wade Wilson",
            committee: "Marvel Universe",
            position: "Deadpool",
            graduation_class: 2016,
            email: "deadpool@example.com",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)
            
Delegate.create!(real_name: "Ruoyu Su",
            committee: "Marvel Universe",
            position: "Captain Su",
            graduation_class: 2016,
            email: "su20yu1919@gmail.com",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

Crisis.find_by(real_name:"Example Crisis").crisis_updates.create(
    title: "The World Is Ending",
    content: "HahaJK")

Crisis.find_by(real_name:"Example Crisis").crisis_updates.create(
    title: "Example Post 2",
    content: "Hello")
    
Crisis.find_by(real_name:"Example Crisis").crisis_updates.create(
    title: "Example Post 3",
    content: "Hello2")

Delegate.find_by(real_name:"Wade Wilson").personal_directives.create(
    title: "Kill Francis", 
    content: "Boo Shoot TDOM Dklajsd;lfajks YOU ARE DEAD")

Delegate.find_by(real_name:"Wade Wilson").personal_directives.create(
    title: "Kill Wolvarine", 
    content: "Hum I might not be able to do that am I")

Delegate.find_by(real_name:"Wade Wilson").sponsored_resolutions.create(
    title: "Kill Wolvarine Together", 
    content: "Let's do it together")

Delegate.find_by(real_name:"Wade Wilson").sponsored_resolutions.create(
    title: "Kill Wolvarine2 TOGETHER@!!!!!", 
    content: "Let's do it together2")
    
Delegate.find_by(real_name:"Ruoyu Su").personal_directives.create(
    title: "Bill Su", 
    content: "He is the coolest person on planet earth2")
    
Delegate.find_by(real_name:"Ruoyu Su").personal_directives.create(
    title: "Bill Su2", 
    content: "He is the coolest person on planet earth233")
    
    


             