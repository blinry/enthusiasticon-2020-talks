talks = [
  {
    speakers: "blinry",
    title: "Gamma correction: the secret behind pretty colors",
    start: "0:27:28",
    end: "0:38:27",
    description: "Until recently, I thought that \"gamma correction\" would be a relic from the era of CRT monitors, and no longer be relevant today. I was surprised to learn that this concept is closely related to how our eyes perceive light non-linearly, and that it's extremely relevant in all contexts where we work with pixels, like when blending colors, resizing images, or rendering 3D scenes!

In this talk, I'll introduce you to what gamma correction is, and how knowing about it will help you make prettier images!",
  },
  {
    speakers: "Fabian Tamp",
    title: "What is a digital photo, really?",
    start: "0:40:09",
    end: "0:50:17",
    description: "There's a lot of cleverly-hidden magic that goes into digital photography. Humans and image sensors perceive light differently, so there's a lot of processing required to make a digital image into something our eyes can understand! This talk covers some of the basic technologies used by digital cameras and considers how the choices we make as programmers are often about reconciling human perception with the preexisting systems and tech available to us.",
  },
  {
    speakers: "Naomi",
    title: "AI Explainability",
    description: "Neural networks are all the rage - input data, output magic results! In between is a black box of magic. In many use cases - from finance to healthcare - this black box is actually a challenge preventing AI adoption. Enter Explainability! Using one extra layer, we can also have our AI explain how it arrived at the decision. This opens up a world of possibility for those working within the constraints of GDPR, and those that would prefer a human factor as the final decision maker.",
    start: "0:52:40",
    end: "1:02:47",
  },
  {
    speakers: "Gargi Sharma",
    title: "Printing floating point numbers is surprisingly hard!!",
    start: "1:05:51",
    end: "1:17:37",
    description: "Not many of us have wondered \"how are floating-point numbers rendered as text strings?\" and for good reason! This doesn't seem like a hard problem to solve! But even in 2020, you don’t have guarantees in some languages that when you convert a string to float and vice versa you will get the same number! In this talk we will explore why printing floating point numbers is hard, arbitrary precision arithmetic, and the state-of-the-art dragon algorithms for printing floating point numbers!",
  },
  {
    speakers: "Theoriz_se",
    title: "The World's Largest Jigsaw Puzzle",
    start: "1:44:01",
    end: "1:53:42",
    description: "The genome is often thought of as nature's code. It encodes everything from eye colour to gender and can reveal our genetic pre-dispositions to disease. But how do we actually 'read' our DNA? And why is computer science involved?

DNA sequencing machines provide a jigsaw of DNA fragments, that need to be reassembled back into the original genome - the picture on the box. We'll talk about how to sort these jigsaw pieces into a suffix array. Along the way, we'll use and tweak some common algorithms you may recognise and illustrate the importance of allowing your data to drive your development.",
  },
  {
    speakers: "Anu Unnikrishnan",
    title: "Tales from coding in physics",
    start: "1:55:49",
    end: "2:06:21",
    description: "Have you ever wondered how to break quantum cryptography - or how to search for dark matter? Well, turns out you can do all this (and more!) with your favourite programming language! In this talk I’ll tell you about some of my experiences writing code for physics research.",
  },
  {
    speakers: "Jakob Runge",
    title: "Permuting the cube",
    start: "2:08:03",
    end: "2:17:53",
    description: "Below the stickers of the rubiks cube lies a beautiful structure arising from just a handful of rules.
Let us explore permutations by the example of this twisty puzzle and see how they can turn into the building blocks of the structure behind it.
We can use an exciting dualism between function and data to explore the problem space and sketch a route towards finding your own solution for this and similar puzzles.

Slides and source code used with the talk can be found on https://github.com/runjak/2020-06-06.enthusiasticon.",
  },
  {
    speakers: "Veit Heller",
    title: "All I have is a hammer, now give me your nails!",
    start: "2:19:50",
    end: "2:30:00",
    description: "Have you heard the old adage “if all you have is a hammer, everything looks
like a nail”? It’s one of those proverbs that make sense at first—cultivating a
diverse toolbox is usually a good idea.

But once you get to the other end of the spectrum, you arrive at a comparably
interesting—and I would argue, comparably useful—paradigm. I don’t know that
this concept has a name, but I like to think of it as asking the question “what
if everything was a...”

A lot of the most revered, feared, loved, and hated languages fall into that
category: Lisp, APL, SmallTalk, and Forth, to name only a few.

In my talk, I’m going to explore why this paradigm might be interesting, and
how you can tackle problems if all you have is a hammer—by forming some nails.",
  },
  {
    speakers: "Nikki Stevens",
    title: "Keynote",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Lisa Passing",
    title: "Build your own controller!",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Ilo_ul",
    title: "A “How-To” for writing a “How-To” for Open Source Software",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Vicky Twomey-Lee",
    title: "My First Maker Project: Print Your Own Adventure Game",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Tamas Kadar",
    title: "Little Printing for everyone!!1",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Em Lazer-Walker",
    title: "So THAT’S how my phone knows where I am!",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "bleeptrack",
    title: "Exploring Generative Spaces",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Serena Peruzzo and John Earnest",
    title: "The Meaning of K",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Knut Hühne",
    title: "What's in a name? A gentle introduction to DNS",
    start: "0:00:00",
    end: "0:00:00",
  },
]

def run(cmd)
  puts cmd
  `#{cmd}`
end

@year = 2020
@video = "'EnthusiastiCon #{@year}.mp4'"

def generate_youtube_text(talk, i)
  open("output/description#{i}.txt", "w") do |f|
    f.puts talk[:description]
    f.puts
    f.puts "A talk at EnthusiastiCon #{@year} by #{talk[:speakers]}"
    f.puts
    f.puts "Intro and closing music: \"Open Those Bright Eyes\" by Kevin MacLeod (incompetech.com), licensed under CC-BY 3.0 https://creativecommons.org/licenses/by/3.0/"
  end
  open("output/title#{i}.txt", "w") do |f|
    f.puts "EnthusiastiCon #{@year} – #{talk[:title]}"
  end
end

def prepare_the_ending
  run "inkscape ending.svg --export-area-page --export-width=1280 --export-filename=tmp/ending.png 2>/dev/null"
  # without the next line (and using it in concat) we get a horrible crying rubberduck
  run "ffmpeg -y -i tmp/ending.png -c:v libx264 -pix_fmt yuv420p -crf 0 -r 29.97 -video_track_timescale 30k tmp/endingframe.mp4"
  run "ffmpeg -y -i tmp/ending.png -i outro.mp3 -c:v libx264 -pix_fmt yuv420p -crf 0 -r 29.97 -video_track_timescale 30k -c:a aac tmp/ending.mp4"
end

def cut_talk(talk, i)
  run "sed \"s/SPEAKERS/#{talk[:speakers]}/;s/TITLE/#{talk[:title]}/\" <title.svg >tmp/title#{i}.svg"
  run "inkscape tmp/title#{i}.svg --export-area-page --export-width=1280 --export-filename=tmp/title#{i}.png 2>/dev/null"
  run "ffmpeg -y -i tmp/title#{i}.png -i intro.mp3 -c:v libx264 -pix_fmt yuv420p -crf 0 -r 29.97 -video_track_timescale 30k -c:a aac tmp/title#{i}.mp4"
  run "ffmpeg -y -i #{@video} -ss #{talk[:start]} -to #{talk[:end]} -c copy tmp/talkonly#{i}.mp4"

  run "echo -e \"file tmp/title#{i}.mp4\nfile tmp/talkonly#{i}.mp4\nfile tmp/endingframe.mp4\nfile tmp/ending.mp4\" | ffmpeg -y -f concat -protocol_whitelist file,pipe,crypto -i - -c copy output/talk#{i}.mp4"
end

from = 0
to = 1

run "mkdir -p tmp output"
prepare_the_ending

talks[from..to].each_with_index do |talk, i|
  generate_youtube_text talk, i
  cut_talk talk, i
end
