# In the seed, I am creating 2 crisis staffs and 4 delegates. Each delegate will have around 3 personal directives and maybe 1 resolution. 
# Each will sponsor 1 resolutions and sign 2 resolutions.
# Each crisis director will submit 2 crisis updates. 
# There will be three tags (#Racism, #Awkwardness, #Socialism). Tag will be added later in the interface. 


# Crisis Director 1

Crisis.create!(name: "Crisis One",
            committee: "Election",
            position: "Crisis",
            email: "crisis1@example.com",
            password: "foobar123",
            password_confirmation: "foobar123",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)
            
# Crisis Director 2

Crisis.create!(name: "Crisis Two",
            committee: "Election",
            position: "Crisis",
            email: "crisis2@example.com",
            password: "foobar123",
            password_confirmation: "foobar123",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)
            
# Delegate 1

Delegate.create!(name: "Delegate One",
            committee: "Election",
            position: "Donald Trump",
            email: "delegate1@example.com",
            password: "foobar123",
            password_confirmation: "foobar123",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

# Delegate 2

Delegate.create!(name: "Delegate Two",
            committee: "Election",
            position: "Hillary Clinton",
            email: "delegate2@example.com",
            password: "foobar123",
            password_confirmation: "foobar123",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

# Delegate 3

Delegate.create!(name: "Delegate Three",
            committee: "Election",
            position: "Bernie Sanders",
            email: "delegate3@example.com",
            password: "foobar123",
            password_confirmation: "foobar123",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

# Delegate 4

Delegate.create!(name: "Delegate Four",
            committee: "Election",
            position: "Jeb Bush",
            email: "delegate4@example.com",
            password: "foobar123",
            password_confirmation: "foobar123",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)


Manage.create!(crisis_id: 1, delegate_id: 3)
Manage.create!(crisis_id: 1, delegate_id: 4)
Manage.create!(crisis_id: 1, delegate_id: 5)
Manage.create!(crisis_id: 1, delegate_id: 6)
Manage.create!(crisis_id: 2, delegate_id: 3)
Manage.create!(crisis_id: 2, delegate_id: 4)
Manage.create!(crisis_id: 2, delegate_id: 5)
Manage.create!(crisis_id: 2, delegate_id: 6)


# Crisis 1 Update 1

Crisis.find_by(name:"Crisis One").crisis_updates.create!(
    title: "Donald Trump is running for president",
    content: "The associate press have just announced that Donald J. Trump, the American
    Billionarie, is running for the president of the United States. During his announcment speech
    Trump promised to make 'America Great Again' by expelling all immigrants and declear 
    the United States a constitutional Monarchy under his rule. So far, major political
    analysts believe that Donald Trump is not a threat to established candidates.",
    created_at: Time.now
    )
    

# Crisis 2 Update 1

Crisis.find_by(name:"Crisis Two").crisis_updates.create!(
    title: "Hillary Clinton likely the only viable democratic candidate",
    content: "While multiple republicans, including Donald Trump, have announced their
    candidacy, the Democratic playing field is much clearer. Currently, former secretary
    of the State Hilary Clinton is substantially ahead of other democratic candidates,
    which include Gov. O Maliey and Independent Vermont senetor Bernie Sanders.",
    created_at: Time.now
    )

# Donald Trump PD 1

Delegate.find_by(position:"Donald Trump").personal_directives.create!(
    title: "Build a Wall",
    content: "Annouce my plan of building a wall between U.S. and Mexico boarder to prevent immigrants 
    from coming in, and let mexico pay for it",
    created_at: Time.now)


# Hilary Clinton PD 1

Delegate.find_by(position:"Hillary Clinton").personal_directives.create!(
    title: "Use my own email server",
    content: "No one cares about rules anyway, let's use my own email server to process confidential
    information cause it obviously will not cause trouble",
    created_at: Time.now)
    
# Donald Trump PD 2

Delegate.find_by(position:"Donald Trump").personal_directives.create!(
    title: "Expell all Muslims",
    content: "All muslims are terroists, that's why they all need to be expelled from the United States.
    All muslims are ISIS, and they are threat to American Security",
    created_at: Time.now)

# Jeb Bush PD 1

Delegate.find_by(position:"Jeb Bush").personal_directives.create!(
    title: "I Have Money",
    content: "Hey look, i'm a member of the great Bush family, I have a lot of money, I can for sure win.",
    created_at: Time.now)
    
# Bernie Sanders PD 1

Delegate.find_by(position:"Bernie Sanders").personal_directives.create!(
    title: "Democratic Socialism",
    content: "Um, guys, I am actually not a commuism maniac. I stand for something called
    democratic socialism, its bascially the idea that you get all the free stuff. So young
    people, look here, Uncle Bernie is good Bernie.",
    created_at: Time.now)
    
# Trump Resolution 1

Delegate.find_by(position:"Donald Trump").created_resolutions.create!(
    title: "Expell all Muslims",
    content: "Expell all people of Muslim decendent out of the United States, effective immediatly. 
    Also increases background check on all foreigners within the United States and track them like
    an UPS package. But encourages gun ownership around the United States because
    it will increase people's sense of security.",
    created_at: Time.now)

# Jeb Bush PD 2

Delegate.find_by(position:"Jeb Bush").personal_directives.create!(
    title: "Trump is Crazy",
    content: "Holy Crap Donald Trump is creazy, I need to attack him more 
    in future debates. Yolo.",
    created_at: Time.now)
    
# Crisis 2 Update 2

Crisis.find_by(name:"Crisis Two").crisis_updates.create!(
    title: "Hillary Clinton runs into email scandle",
    content: "Hillary Clinton is discovered using her personal email to process
    confidential state information during her tenure as Secretary of the State.
    She might be indicited by the court for leaking of confidential information.",
    created_at: Time.now
    )
    
# Hillary Clinton PD 2

Delegate.find_by(position:"Hillary Clinton").personal_directives.create!(
    title: "I'm in trouble",
    content: "Holy shit I'm in trouble, I am just going to lie and say I didnt do it
    and hope the storm will eventually pass.",
    created_at: Time.now)

# Bernie Sanders PD 2

Delegate.find_by(position:"Bernie Sanders").personal_directives.create!(
    title: "Surge in Support",
    content: "Hey guys Hillary is another established candidate who is dishonst and
    only care about big bank's interests. She will be a bad president, vote Uncle Bernie!",
    created_at: Time.now)
    
# Bernie Sanders Resolution 1

Delegate.find_by(position:"Bernie Sanders").created_resolutions.create!(
    title: "Free College for Everyone",
    content: "Remove all tuitions from all state owned instiutions in the United States, 
    also conduct Medicare reform to make it more comprehensive. Also crack down on all big banks.
    How is it going to be paid for? Shush.",
    created_at: Time.now)
    
# Donald Trump PD 3

Delegate.find_by(position:"Bernie Sanders").personal_directives.create!(
    title: "Attack Everyone",
    content: "Everytime I got attacked or attack someone my poll goes up, so I am going to 
    keep doing that until I win. Winter is TRUMPING!!!",
    created_at: Time.now)

# Hillary Clinton Resolution 1

Delegate.find_by(position:"Hillary Clinton").created_resolutions.create!(
    title: "Basically Continue Everything Obama Has Done",
    content: "President Obama is super handsome and is the best president in the United States
    ever. I am previliged to be his Secretary of State, I know him the best. I will continue
    his awesomeness like no other. So we should continue all programs under the Obama Administration.",
    created_at: Time.now)

# Jeb Bush PD 3

Delegate.find_by(position:"Jeb Bush").personal_directives.create!(
    title: "Please pay attention to me, please clap",
    content: "Please clap. Why am I so not important right now.",
    created_at: Time.now)
    
# Bernie Sanders PD 3

Delegate.find_by(position:"Bernie Sanders").personal_directives.create!(
    title: "Feel the Bern",
    content: "I am actually leading in polls now in New Hampire, is the bern actually
    happening? Let's continue our momentum.",
    created_at: Time.now)

# Crisis 1 Update 2

Crisis.find_by(name:"Crisis One").crisis_updates.create!(
    title: "Bernie Sanders and Trump Surge in Poll",
    content: "Two craziest candidate in American Election history: Donald Trump
    and Bernie Sanders, are actually leading in polls now. Trump is so far ahead of everyone
    else and Bernie probably have a legit chance of beating Hillary, pay attention to those two.",
    created_at: Time.now
    )
