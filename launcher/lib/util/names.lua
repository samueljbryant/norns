include "lib/util/cache"
cache = Cache.new{}
function generate_random_name()
  a = math.random(1, #adjectives)
  b = math.random(1, #nouns)
  if cache:has(adjectives[a] .. " " .. nouns[b]) then
    return generate_random_name()
  end
  cache:set(adjectives[a] .. " " .. nouns[b], true)
  return adjectives[a] .. " " .. nouns[b]
end

-- user's should be able to load their own common names!
common_names = {
  "intro",
  "outro",
  "chorus",
  "verse",
  "prelude",
  "interlude",
}
function choose_from_list(index)
  if index > #common_names then
    return
  end
  if index < 1 then
    return
  end
  local name = common_names[index]
  if cache:has(name) then
    counter = 2
    while cache:has(name) == true do
      name = name .. counter
      counter = counter + 1
    end
  end
  return names
end



adjectives = {
    "abundant",
    "beautiful",
    "courageous",
    "dazzling",
    "eccentric",
    "fearless",
    "graceful",
    "harmonious",
    "inquisitive",
    "joyful",
    "kindhearted",
    "luminous",
    "mysterious",
    "nostalgic",
    "optimistic",
    "passionate",
    "quizzical",
    "resilient",
    "serene",
    "tenacious",
    "unique",
    "vibrant",
    "whimsical",
    "xenial",
    "yielding",
    "zealous",
    "adventurous",
    "brilliant",
    "candid",
    "dynamic",
    "eloquent",
    "fascinating",
    "gracious",
    "humble",
    "intuitive",
    "jovial",
    "keen",
    "lively",
    "magnificent",
    "nonchalant",
    "observant",
    "perceptive",
    "quaint",
    "radiant",
    "sincere",
    "tranquil",
    "upbeat",
    "versatile",
    "wholesome",
    "youthful",
    "zeppelin-like",
    "adaptable",
    "blissful",
    "captivating",
    "diligent",
    "exuberant",
    "flexible",
    "genuine",
    "hypnotic",
    "insightful",
    "jubilant",
    "kaleidoscopic",
    "lustrous",
    "mellow",
    "non-conformist",
    "optimistic",
    "profound",
    "quixotic",
    "resplendent",
    "surreptitious",
    "tantalizing",
    "unwavering",
    "vivacious",
    "wonderstruck",
    "x-factor",
    "yearning",
    "zestful",
    "amiable",
    "benevolent",
    "cordial",
    "delightful",
    "effervescent",
    "fearless",
    "gallant",
    "hospitable",
    "inventive",
    "jocular",
    "kinetic",
    "luminous",
    "mirthful",
    "nonchalant",
    "optimistic",
    "pensive",
    "quizzical",
    "resilient",
    "serene",
    "tactful",
    "urbane",
    "versatile",
    "winsome",
    "xenodochial",
    "yielding",
    "zephyr-like"
}

nouns = {
    "apple",
    "butterfly",
    "champion",
    "dragon",
    "elephant",
    "firework",
    "guitar",
    "horizon",
    "island",
    "jigsaw",
    "kaleidoscope",
    "lighthouse",
    "mountain",
    "notebook",
    "oasis",
    "paradise",
    "quasar",
    "rainbow",
    "silhouette",
    "treasure",
    "umbrella",
    "volcano",
    "waterfall",
    "xylophone",
    "yacht",
    "zeppelin",
    "acorn",
    "bookshelf",
    "compass",
    "dolphin",
    "eyeball",
    "fountain",
    "galaxy",
    "harbor",
    "infinity",
    "jungle",
    "knight",
    "labyrinth",
    "moonlight",
    "noodle",
    "orchard",
    "penguin",
    "quiver",
    "rhapsody",
    "stardust",
    "timekeeper",
    "unicorn",
    "vortex",
    "whisper",
    "xanadu",
    "yonder",
    "zenith",
    "apricot",
    "bubble",
    "carousel",
    "daisy",
    "enigma",
    "foghorn",
    "gondola",
    "harmony",
    "ivory",
    "jamboree",
    "kangaroo",
    "lagoon",
    "magenta",
    "novel",
    "opal",
    "peacock",
    "quasar",
    "rhapsody",
    "sapphire",
    "thistle",
    "umbrella",
    "vagabond",
    "willow",
    "xenon",
    "yuletide",
    "zeppelin",
    "alchemy",
    "bazaar",
    "cathedral",
    "daffodil",
    "ethereal",
    "fountain",
    "gazelle",
    "hologram",
    "infinity",
    "jubilee",
    "kaleidoscope",
    "lyric",
    "marvel",
    "nebula",
    "ocean",
    "panorama",
    "quasar",
    "radiance",
    "serenity",
    "twilight",
    "utopia",
    "volcano",
    "whimsy",
    "xenon",
    "yearning",
    "zephyr"
}