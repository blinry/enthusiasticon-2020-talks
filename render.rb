talks = [
  {
    speakers: "blinry",
    title: "Gamma correction: the secret behind pretty colors",
    start: "0:26:56",
    end: "0:39:42",
  },
  {
    speakers: "Fabian Tamp",
    title: "What is a digital photo, really?",
    start: "0:40:06",
    end: "0:49:00",
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
    speakers: "Serena Peruzzo, John Earnest",
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

video = "'EnthusiastiCon 2020.mp4'"

run "mkdir -p tmp output"
run "inkscape ending.svg --export-area-page --export-width=1280 --export-filename=tmp/ending.png 2>/dev/null"
# without the next line (and using it in concat) we get a horrible crying rubberduck
run "ffmpeg -y -i tmp/ending.png -c:v libx264 -pix_fmt yuv420p -crf 0 -r 29.97 -video_track_timescale 30k tmp/endingframe.mp4"
run "ffmpeg -y -i tmp/ending.png -i outro.mp3 -c:v libx264 -pix_fmt yuv420p -crf 0 -r 29.97 -video_track_timescale 30k -c:a aac tmp/ending.mp4"
talks[0..2].each_with_index do |talk, i|
  run "sed \"s/SPEAKERS/#{talk[:speakers]}/;s/TITLE/#{talk[:title]}/\" <title.svg >tmp/title#{i}.svg"
  run "inkscape tmp/title#{i}.svg --export-area-page --export-width=1280 --export-filename=tmp/title#{i}.png 2>/dev/null"
  run "ffmpeg -y -i tmp/title#{i}.png -i intro.mp3 -c:v libx264 -pix_fmt yuv420p -crf 0 -r 29.97 -video_track_timescale 30k -c:a aac tmp/title#{i}.mp4"
  run "ffmpeg -y -i #{video} -ss #{talk[:start]} -to #{talk[:end]} -c copy tmp/talkonly#{i}.mp4"

  run "echo -e \"file tmp/title#{i}.mp4\nfile tmp/talkonly#{i}.mp4\nfile tmp/endingframe.mp4\nfile tmp/ending.mp4\" | ffmpeg -y -f concat -protocol_whitelist file,pipe,crypto -i - -c copy output/talk#{i}.mp4"
end
