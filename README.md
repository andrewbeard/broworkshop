# Bro Workshop
These are the materials from a workshop on the [Bro IDS](https://www.bro.org/) originally presented at [BSides NoVA](http://www.bsidesnova.org/) 2018 and later at [BSides Charleston](http://www.bsidescharleston.com/) 2018.

## The Virtual Machine
Most of the workshop involves interacting with a Ubuntu virtual machine. This VM is downloadable from [Release](https://github.com/andrewbeard/broworkshop/releases) section in VMware OVA format. If you don't have VMware Player/Workstation/Fusion a 30-day trial is available. At least one attendee said they were able to import the VM successfully using VirtualBox, but I have no idea how well it actually runs. As noted in the presentation the default login for the VM is bro:broUser.

## Docker
My Docker-fu is weak, but I've tried to put together a Dockerfile that can be used to build an image to run the workshop. On the plus side there's no VMware needed and setup should be a breeze (no virtual networking to configure, etc). On the minus side building the image does take a bit of bandwidth, so it's not great for a conference workshop unless everyone gets set up before hand.  After the fact it's a lot smaller than downloading the VM, though. From in the repo run:

```
docker build -t broworkshop .
docker run -it --mount type=bind,source=$(pwd),target=/root/workshop broworkshop
```

On the other hand if you don't really care how the sausage is made and just want a working environment you can pull the prebuilt image from the Docker Hub (faster and probably less bandwith than building it locally). You'll still want to run from within the repo so the bind copies over the lastest workshop files, though:

```
docker run -it --mount type=bind,source=$(pwd),target=/root/workshop bearda/broworkshop
```

## Presentation
The slides for the presentation are available in PDF format. Some of the slides regarding the shared lab system and WiFi network are no longer relevant, however.

## Exercises
Each exercise is in a named subdirectory and includes a pcap file, a text file with questions (identical to the ones in the presentation), and a text file with my suggested solution or solutions. Spoiler-free hints are available by contacting me per the feedback section below.

## Feedback
Comments, feedback, and suggestions can be sent to abeard at arbor.net or [@bearda24](https://twitter.com/bearda24). I really appreciate hearing what does and doesn't work for people, so please don't hesitate to drop me a line.

All nonconstructive criticism and flames may be sent to:
```
1701 JFK Boulevard
Philadelphia, PA 19103
```

## Licensing
All exercises, pcaps, questions, solutions, and Bro scripts are available under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) license. All materials subject to copyright under the docs directory are subject to the original licenses of the copyright holders as stated there. Want to use something under a license that allows commercial use? No problem, just get in touch with me.

The presentation is available under the [Creative Commons Attribution-NoDerivatives 4.0](https://creativecommons.org/licenses/by-nd/4.0/) license. Why the no derivatives license difference?  Long story short, I don't feel comfortable having people modify a presentation and redistributing it with my employer's logo on it.  If you'd like to modify the presentation just get in touch with me and I can send you a PowerPoint file with the template removed under a more permissive license.
