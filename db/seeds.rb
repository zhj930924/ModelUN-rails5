# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Crisis.create!(real_name: "Michael Example",
            committee: "BooShoot",
            position: "major_booshooter",
            graduation_class: 2016,
            email: "michael2@example.com",
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

Crisis.find_by(real_name:"Michael Example").crisis_updates.create(
    title: "The World Is Ending",
    content: "HahaJK")

Delegate.find_by(real_name:"Wade Wilson").personal_directives.create(
    title: "Kill Francis", 
    content: "Boo Shoot TDOM Dklajsd;lfajks YOU ARE DEAD")


             