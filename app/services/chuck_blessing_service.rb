class ChuckBlessingService
  BLESSING_TEMPLATES = {
    "Mighty Texas Ranger" => [
      "Greetings, %{name}. Cordell Walker here. Out here in Texas, we don't back down from a showdown, and neither should you. I'm blessing your path today with unbreakable fortitude, straight shooting, and honest grit. Remember: the stars at night are big and bright, but your courage today will outshine them all. Go seize the day, partner!",
      "%{name}, this is Chuck. When duty calls, a true Ranger doesn't hit the snooze button; the alarm turns itself off out of respect. May your instincts be sharp, your coffee strong, and your integrity untouchable. Have an upright, victorious day!",
      "Listen up, %{name}. As Texas Rangers, we don't look for trouble, but when trouble knocks, we kick the door off its hinges. May peace follow your steps, and strength lead your charge today. Wishing you a mighty and blessed day!"
    ],
    "Delta Force Thunder" => [
      "%{name}, Major Scott McCoy reporting in. Target locked: another day of absolute greatness. May every obstacle in your way clear out before you even arrive. I bless your day with rapid precision, unstoppable momentum, and tactical supremacy. Dismissed to conquer!",
      "Listen closely, %{name}. In the Delta Force, failure isn't an option because failure knows better than to show up. Whatever missions you undertake today—big or small—tackle them with relentless confidence. May the wind be at your back and victory in your sights. Have a thunderous day!",
      "%{name}, Chuck here. You don't need luck today because you have the firepower of unwavering resolve. Hold the perimeter of your peace of mind and press forward. Chuck Norris gives you a full five-star blessing for today!"
    ],
    "Dragon Fist Master" => [
      "Salutations, %{name}. When Bruce Lee and I entered the Colosseum, the stones stood still in awe. True mastery is knowing that the greatest battle is within, and the greatest kick is the one delivered with honor. May your mind be calm as still water and your impact as thunderous as a roundhouse kick. Have an enlightened, magnificent day!",
      "%{name}, the journey of a thousand miles begins with a single roundhouse. Walk your path today with poise, focus, and unwavering balance. The world bends to a dedicated soul. May your day be filled with harmony, mastery, and unshakeable inner power!",
      "Greetings, warrior %{name}. Balance is not something you find; it's something Chuck Norris carves out of thin air. May all conflict dissolve in your presence today. Go forward with quiet strength and have a truly stellar day!"
    ],
    "Cosmic Overlord" => [
      "%{name}, I just glared at the Sun and instructed it to illuminate your brilliance today. The laws of gravity have been temporarily notified to give you extra bounce in your step. May your day be astronomical, boundless, and defying every known limit. Walk among giants today!",
      "Greetings, %{name}. Time waits for no man... except Chuck Norris, who told time to take five minutes and bless your morning. May everything you touch today turn into an undisputed triumph. Have an invincible, universe-shaking day!",
      "%{name}, when Alexander the Great wept because there were no more worlds to conquer, Chuck Norris showed him a parallel universe. You have worlds to conquer today. Step boldly, breathe deeply, and have a legendary day!"
    ]
  }.freeze

  DEFAULT_TONE = "Mighty Texas Ranger".freeze

  def self.blessing_for(name:, tone: DEFAULT_TONE, date: Date.current)
    name_str = name.presence || "Warrior"
    templates = BLESSING_TEMPLATES[tone] || BLESSING_TEMPLATES[DEFAULT_TONE]
    
    # Use deterministic index based on date + name hash so the user gets a consistent blessing for that day
    index = (date.mjd + name_str.sum) % templates.size
    format(templates[index], name: name_str)
  end

  def self.random_blessing(name: "Warrior", tone: DEFAULT_TONE)
    templates = BLESSING_TEMPLATES[tone] || BLESSING_TEMPLATES[DEFAULT_TONE]
    format(templates.sample, name: name.presence || "Warrior")
  end

  def self.tones
    BLESSING_TEMPLATES.keys
  end
end
