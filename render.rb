talks = [
  {
    speakers: "blinry",
    title: "Gamma correction: the secret behind pretty colors",
    start: "0:26:56",
    end: "0:39:42",
    description: "Until recently, I thought that \"gamma correction\" would be a relic from the era of CRT monitors, and no longer be relevant today. I was surprised to learn that this concept is closely related to how our eyes perceive light non-linearly, and that it's extremely relevant in all contexts where we work with pixels, like when blending colors, resizing images, or rendering 3D scenes!

In this talk, I'll introduce you to what gamma correction is, and how knowing about it will help you make prettier images!",
  },
  {
    speakers: "Fabian Tamp",
    title: "What is a digital photo, really?",
    start: "0:40:06",
    end: "0:49:00",
    description: "There's a lot of cleverly-hidden magic that goes into digital photography. Humans and image sensors perceive light differently, so there's a lot of processing required to make a digital image into something our eyes can understand! This talk covers some of the basic technologies used by digital cameras and considers how the choices we make as programmers are often about reconciling human perception with the preexisting systems and tech available to us.",
  },
  {
    speakers: "Naomi",
    title: "AI Explainability",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Gargi Sharma",
    title: "Printing floating point numbers is surprisingly hard!!",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Theoriz_se",
    title: "The World's Largest Jigsaw Puzzle",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Anu Unnikrishnan",
    title: "Tales from coding in physics",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Jakob Runge",
    title: "Permuting the cube",
    start: "0:00:00",
    end: "0:00:00",
  },
  {
    speakers: "Veit Heller",
    title: "All I have is a hammer, now give me your nails!",
    start: "0:00:00",
    end: "0:00:00",
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
