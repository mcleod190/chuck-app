# Chuck Norris Jokes & Real Movie Meme Photos
puts "Seeding legendary Chuck Norris jokes and real movie meme photos..."

Joke.destroy_all

jokes_data = [
  {
    content: "Chuck Norris was once bitten by a king cobra. After five days of excruciating pain... the cobra died.",
    movie_title: "The Expendables 2 (2012)",
    character_name: "Booker 'The Lone Wolf'",
    scene_description: "Chuck delivers the greatest cobra deadpan in cinematic history.",
    category: "Movie Legends",
    featured: true,
    likes_count: 1337,
    image_url: "chuck/chuck_hero.jpg"
  },
  {
    content: "There is no theory of evolution. Just a list of creatures Chuck Norris allowed to live.",
    movie_title: "Walker, Texas Ranger (1993–2001)",
    character_name: "Cordell Walker",
    scene_description: "Walker pauses mid-saloon brawl, spins 360 degrees, and roundhouses three criminals without his hat falling off.",
    category: "Texas Ranger Grit",
    featured: true,
    likes_count: 3120,
    image_url: "chuck/walker_hat_real.jpg"
  },
  {
    content: "Chuck Norris's motorcycle does not run on gasoline. It runs on dual rocket launchers and pure vengeance.",
    movie_title: "The Delta Force (1986)",
    character_name: "Major Scott McCoy",
    scene_description: "McCoy jumps his missile-firing dirtbike through a plate glass window while the synth theme blasts.",
    category: "Movie Legends",
    featured: true,
    likes_count: 875,
    image_url: "chuck/delta_force_real.jpg"
  },
  {
    content: "Chuck Norris and Bruce Lee fought inside the Roman Colosseum. The Roman Empire fell 1,500 years earlier just to prepare the arena.",
    movie_title: "The Way of the Dragon (1972)",
    character_name: "Colt",
    scene_description: "The historic duel between Colt and Bruce Lee, officiated by a tiny Roman kitten watching from marble ruins.",
    category: "Martial Arts",
    featured: true,
    likes_count: 2450,
    image_url: "chuck/chuck_vintage_1976.jpg"
  },
  {
    content: "Chuck Norris doesn't get wet. Water knows better than to touch him. When he emerged from the swamp, the water begged for mercy.",
    movie_title: "Missing in Action (1984)",
    character_name: "Col. James Braddock",
    scene_description: "Braddock erupts out of the murky swamp in dramatic slow motion with an M60 machine gun.",
    category: "Movie Legends",
    featured: true,
    likes_count: 986,
    image_url: "chuck/chuck_tactical.jpg"
  },
  {
    content: "Chuck Norris was buried alive in a supercharged truck. He poured beer over his face, revved the engine, and drove straight out of his grave.",
    movie_title: "Lone Wolf McQuade (1983)",
    character_name: "J.J. McQuade",
    scene_description: "The immortal truck resurrection scene where McQuade revs his Dodge Ram out of the earth in pure testosterone.",
    category: "Texas Ranger Grit",
    featured: true,
    likes_count: 1042,
    image_url: "chuck/chuck_portrait.jpg"
  },
  {
    content: "Death once had a near-Chuck-Norris experience. Death has been on paid medical leave ever since.",
    movie_title: "Hellbound (1994)",
    character_name: "Frank Shatter",
    scene_description: "Detective Shatter tracks an immortal demon and defeats darkness with bare-knuckle Texas justice.",
    category: "Martial Arts",
    featured: false,
    likes_count: 812,
    image_url: "chuck/chuck_ranger_suit.jpg"
  },
  {
    content: "Chuck Norris wears double denim not as fashion, but because denim is the only alloy strong enough to contain his aura.",
    movie_title: "Invasion U.S.A. (1985)",
    character_name: "Matt Hunter",
    scene_description: "Matt Hunter dual-wields Micro-Uzis in double-shoulder holsters, staring down a rocket launcher: 'Time to die.'",
    category: "General Badassery",
    featured: false,
    likes_count: 654,
    image_url: "scenes/invasion_usa_denim.svg"
  },
  {
    content: "Chuck Norris doesn't sleep. He waits. And when the alarm goes off, the alarm apologizes for making noise.",
    movie_title: "Code of Silence (1985)",
    character_name: "Eddie Cusack",
    scene_description: "Cusack deploys the police assault combat robot 'Prowler' while taking down an entire syndicate.",
    category: "General Badassery",
    featured: false,
    likes_count: 730,
    image_url: "scenes/code_of_silence.svg"
  },
  {
    content: "When Chuck Norris looks into the night sky, outer space expands out of sheer panic to give him more room.",
    movie_title: "Silent Rage (1982)",
    character_name: "Sheriff Dan Stevens",
    scene_description: "Sheriff Stevens battles a genetically resurrected indestructible killer and roundhouses him down a bottomless well.",
    category: "Physics & Cosmos",
    featured: false,
    likes_count: 589,
    image_url: "scenes/silent_rage.svg"
  },
  {
    content: "Chuck Norris can divide by zero, count to infinity twice, and slam a revolving door.",
    movie_title: "Firewalker (1986)",
    character_name: "Max Donigan",
    scene_description: "Chuck treks through ancient jungle temples delivering spinning back-kicks to mystical guardians.",
    category: "Physics & Cosmos",
    featured: false,
    likes_count: 1420,
    image_url: "scenes/firewalker.svg"
  },
  {
    content: "Chuck Norris doesn't dial the wrong number. You answer the wrong phone.",
    movie_title: "Top Dog (1995)",
    character_name: "Jake Wilder",
    scene_description: "Jake Wilder and his police canine partner outwit international operatives through synchronised maneuvers.",
    category: "General Badassery",
    featured: false,
    likes_count: 495,
    image_url: "scenes/top_dog.svg"
  }
]

jokes_data.each { |attrs| Joke.create!(attrs) }
puts "Created #{Joke.count} legendary Chuck Norris jokes with real photos!"

Subscriber.find_or_create_by!(email: "warrior@chuckfacts.com") do |s|
  s.name = "Ranger Apprentice"
  s.blessing_tone = "Mighty Texas Ranger"
  s.active = true
end


