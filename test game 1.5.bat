@echo off
title ------------------------ZOMBIE TXT GAME--------------------------------------
color f0
:choice1
cls
echo  -------------------------------ZOMBIE TEXT GAME-----------------------
echo.
echo Choose what you want to do: 
echo.
echo 1.)Start game
echo 2.)Quit
set /p var=Set Command: 
if %var%==1 goto Start
if %var%==2 goto exit
goto choice1
:Start
cls
:choice2
cls
echo You hear an old man being eaten by zombies out your window. Do you try to save him? Or will you leave him die?
echo.
echo 1.)Save Him
echo 2.)Leave him to die (meanie)
set /p var=Set Command:
if %var%==1 goto save
if %var%==2 goto lethimdie
goto choice2
:save
cls
echo You sneak outside your safehouse quietly, but then a zombie comes up behind you and eats your face off.
echo.
pause>nul
:die1
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Exit
echo 2.) Retry
set /p var=Set Command: 
if %var%==1 goto exit
if %var%==2 goto start
goto die1
:lethimdie
cls
echo You decide you need to keep yourself alive. what if you got into the same mess he did?
echo.
pause>nul
cls
echo You go to bed after watching the man get ripped apart by the zombie from the safety of your 2nd storie bedroom. You decide to go to sleep, but first you will need dinner.
echo.
pause>nul.
:45
cls
echo 1.) Eat baked beans for dinner.
echo 2.) Have a bowl of cereal
set /p var=Set Command:
if %var%==1 goto yummy
if %var%==2 goto yummy
goto 45
:yummy
cls
echo That was pretty nice. I guess.
echo.
pause>nul
echo You go to sleep with a well fed belly.
echo.
pause>nul
:ght
cls
echo When you wake up, you hear some screaming from outside, so you go to have a look out of your window to see what is going on. You see four people running away from a horde of zombies. You need to make a decision what to do.
echo.
echo 1.) You decide to keep quiet and watch them run
echo 2.) You yell to them from your window.
echo 3.) You run out the front door and start running with them.
echo 4.) You pick up a rifle and some ammo and start killing some zombies to buy them some time.
set /p var=Set Command: 
if %var%==1 goto keepquiet
if %var%==2 goto yellwindow
if %var%==3 goto run
if %var%==4 goto buytime
goto ght
:keepquiet
cls
echo You watch the people run away. You wonder if they will make it, or if you'll ever see them again.
echo.
pause>nul
cls
echo You relise you are running low on food. There doesn't seem to be any zombies, the group that just passed lead them away from you.
echo.
echo You decide to go out for scavenging. You know of a supermarket that is about 400 yards down the street.
echo.
echo You pick up your rifle and some ammo, in case worse comes to worse.
echo.
pause>nul
:123
cls
echo You sneak out the front door down to  the supermarket. The door is locked, and the security camera seems to be on. You need to find a way to shut it down, without making too much noise.
echo.
echo 1.) You shoot the camera through the window, giving you an entry point as well.
echo 2.) You shoot the lock and walk into the supermarket. Maybe the alarm won't go off.
echo 3.) You look around the building to see if you can find something to cut off the power.
set /p var=Set Command: 
if %var%==1 goto shootcamera
if %var%==2 goto shootlock
if %var%==3 goto fusebox
goto 123
:shootcamera
cls
echo You decide to shoot the camera through the window. Maybe there won't be any zeds around to hear the shot.
echo.
echo You take a steady aim and pull the trigger. You are right on target. The gun makes a very loud noise, but lucky for you, there is no zeds around to hear it. You walk into the shop and grab all the food you can, before quietly walking out the door to your safehouse.
echo.
pause>nul
cls
echo When you get home you take a look at what you got. Four cereal boxes, ten packets of plain biscuts, a loaf of bread, and some peanut butter. This will keep you going for a while.
echo.
echo You look  out your window, and begin to think about the group you saw earlier. Are they still alive? Did they get to a safehouse? Did they kill any of the zombies?
echo.
echo You realise it is getting dark. You need to have something for dinner
echo.
pause>nul
:food2
cls
echo What do you have for dinner?
echo.
echo 1.) A bowl of cereal
echo 2.) A peanutbutter sandwich
echo 3.) Some peanutbutter from the jar.
set /p var= Set Command: 
if %var%==1 goto yummy1
if %var%==2 goto yummy1
if %var%==3 goto yummy1
goto food2
:yummy1
echo That was delicious!
echo
pause>nul
cls
echo After going into a restless sleep, you wake up at about 5:00am. You can't go back to sleep, so you just start planning out what to do next.
echo.
echo Your mind isn't participating with the matter at hand. You can't think of anything, then a zombie bursts into your room and rips you to pieces, blood flying everywhere, but you're still living, bleeding and screaming in pain, before you fall to the floor. dead.
echo.
pause>nul
:56
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Wake up
set /p var= Set Command
if %var%==1 goto wakeup
goto 56
:wakeup
color f0
cls
echo You wake up from your terrible dream, sweat dripping down from your messy hair.
echo.
echo "Oh damn!" You whisper to yourself, still trying to figure out what the hell is happening. You see rectangles of light through your closed blinds, and look at your watch. It is about 7:48am. a typical morning, a light layer of clouds and about two or three zeds on the road.
echo.
pause>nul
:fff
cls
echo 1.) go on.
set /p var=Set Command: 
if %var%==1 goto end
goto fff
:yellwindow
cls
echo You yell "Hey!" at them as loud as you can. They keep on running, but turn to look at you while on the move. They then look away, then they keep on running ahead as they were. The zombies take no notice of you. That didn't seem to work.
echo.
pause>nul
cls
echo You need to grab their attention before it's too late. "HEY!" You yell even louder. But this time, it's the zeds that hear you first. They see easy prey up in your safehouse, so they smash into your bedroom and rip you to shreds.
pause>nul
:ghty
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Retry
echo 2.) Exit
set /p var=Set Command: 
if %var%==1 goto start
if %var%==2 goto exit
goto ghty
:run
cls
echo You decide to run out of your house and catch up with them. You grab a gun just in case you need it. You burst out the front door and start running with them.
echo.
echo One of the people in the group says to you as you pull up beside them "Are you crazy?! You're going to die running with us like this!" "Too late now," You yell, "They're all blocking the door to my house now."
echo.
echo "You should've stayed there in the first place!" "Oh well." You say to the man. "At least I've got a gun." "What are you gonna do with that apart from kill yourself with it?"
echo.
echo "Kill zombies maybe? Were you raised by a turd?" You say. "No way jerk!" says the man. "STOP ARGUING!!!" one of the other men yells at you both. "We have to escape from these things!"
echo.
pause>nul
cls
echo "Do you guys have any kind of safehouse around here?" You ask the group while running, "Nope." the four respond at the same time. "Then were did you spend the night?" you ask in disbelief. "We're nomadic." One of the men says.
echo.
echo "You guys need to find a safe place to stay put until the military deals with this infestaton." You say to the group. You are starting to get a bit puffed. "I don't think there are any half smart soldiers left on the planet." Says the man you were agrguing with earlier.
echo.
echo "You might be right there." You say to him. "If there were, they would have to be up in New York or something like that. LA is probably going to be the last target." "Maybe, but they might not-"
echo.
pause>nul
cls
echo "Look out!" Says the man that held you two up last time, "There's about ten just in front of us!"
pause>nul
:asd
cls
echo You need to decide how to deal with this. There is no running away.
echo.
echo 1.) Shoot the ten zeds with your gun.
echo 2.) charge into the small group of ten and try to dodge through them.
echo 3.) Stand still and see what happens
echo 4.) Stage dive into the massive horde
set /p var=Set Command
if %var%==1 goto shootzeds
if %var%==2 goto dodgezeds
if %var%==3 goto staystill
if %var%==4 goto instadeath
goto asd
:shootzeds
cls
echo "I'll handle this!" You say. You take quick aim and shoot each of the ten zombies in the head. Good thing your pistol olds twelve 9mm rounds in one clip!
echo.
echo You turn around to see the horde getting closer to you, so you bolt off in the same direction you were going.
echo.
pause>nul
cls
echo "We need to find some place to stay put for a while." You say as you stopped to take a breather. The horde is about three-hundred yards away from you, and comming up slowly.
echo.
echo "You're right," Says the only girl in the group. "Any chance of getting to your safehouse from here?" "Maybe, but it would take a while." You say. "We'd need to get rid of the horde, then getting back should be a piece of cake."
echo.
echo "Don't you have a gun?" says the man you were arguing with, "Yes." You say. "But I'm not planning on using up all my ammo."
echo.
pause>nul
cls
echo "Does anyone here have some matches? Or an empty glass bottle?" You ask the group. "Yeah, I have 'em both." Says the man that pulled you and the other guy up. "There's a gas station just up the road, come on!" You say to the group.
echo.
echo You get to the gas station, and get the bottle and matches from the man. You fill the bottle up with gas, and put your singlet into the bottle. You light the match, and set the singlet alight.
echo.
pause>nul
cls
echo You throw the molotov cocktail into the horde, and the zombies set alight.
echo.
echo "OH YEAH!" You all yell at once as the zombies burn up and die for good. "THAT WAS AMAZING!"
pause>nul
cls
echo You and the group walk down the street back to your safehouse. "That was pretty fun to watch." You say to the rest of the group. "Anyway, we haven't had a formal introduction yet. I'm Ryan." You say. "I'm Steve." Said the guy you were arguing with. " I'm Daloria." Said the girl. "I'm James" Said the guy that called the ten zeds. "And I'm Mitch." Said the man who hadn't spoken yet.
echo.
echo "Do you guys need a place to stay? You say to the group. "'Cause my place has a few free rooms on the second storie. It'd be nice to have some company." "We might stay for one or two nights, but then we'd have to move on." Said James. "I think we should stay for a bit longer." Said Mitch, "Remember what happened last time?" "We just got a little unlucky then." said James, "But think about it, what happens if we got into the same scenario again? We were lucky Ryan was there to help us."
echo.
pause>nul
cls
echo "I don't know about staying at all," said Daloria, "How do we know we can trust this guy?" "He saved our lives Dal,  I think he is trustworthy enough." Said James. "Do you have any more weapons?" Asked Mitch. "Just a rifle. I also have a swisse army knife in my pocket, but that would make a crap melee weapon." You say.
echo.
echo "Maybe we can go look for some guns. There is a weapon store about ten miles from here." Says Mitch. "That is a little far though. And I'm also running low on food. There is however a supermarket up the street we could go to." You say. "That sounds like a good idea." Says James.
echo.
pause>nul
cls
echo You go out of the safehouse and sneak down to the supermarket. When you get there, you see the doors locked, and the security camera seems to be on. "Damn." You say, "If the alarm goes off, it will attract zeds from miles away." "We need to disable it" says Dal. "How are we going to do that?" You ask.
echo.
echo "We could try to find a fuse box, or we could shoot the camera and disable the alarm. That pistol of yours is pretty quiet, zeds shouldn't be attracted to it from far away, and there don't seem to be any in this area."
echo.
echo "I know how to disable an alarm system from a fuse box." Said James. "I was an electrition in my younger days." "Can you do it then?" You ask politely. "If we find a fuse box." He replys. "Lets go then!"
echo.
pause>nul
cls
echo You walk around the shop and find the fuse box. James flicks and turns a few switches and then closes the box. "Okay. Done." He says.
echo.
echo You go around to the front of the shop and realise you forgot about the locked door. "I guess this is comming down to the gun." You say as you take aim at the lock and pull the trigger.
echo.
pause>nul
:op
cls
echo 1.) go on
set /p var=Set Command: 
if %var%==1 goto end
goto op
:dodgezeds
cls
echo You decide you don't want to use up ammo. "Follow me!" You yell to the four, and charge into the ten. You all manage to get past them, until one of them grabs you in the leg and pulls you to the ground. So as you watch them run to safety, you pull out your gun and shoot at the zed that's grabbing you.
echo.
echo You manage to make contact with the bullet, but only through the leg. As the other nine zeds approach you, you decide you don't want to be eaten alive.
pause>nul
cls
echo You know that you will not be able to take out the zombies, but being eaten alive sounds like a terrible death. 
echo.
echo You point your pistol at your head and pull the trigger
pause>nul
:ii
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Retry
echo 2.) Exit
set /p var=Set Command: 
if %var%==1 goto start
if %var%==2 goto exit
goto ii
:staystill
cls
echo You tell the rest of the group to stay as still as a rock, but zeds know what a human smells like! So as your standing still, the zombies close you all into a circle and start munching on your flesh
echo.
pause>nul
:kkk
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Retry
echo 2.) Exit
set /p var=Set Command: 
if %var%==1 goto start
if %var%==2 goto exit
goto kkk
:instadeath
cls
echo You jump into the massive horde headfirst, while the others climb an old wooden powerline pole. You watch the pole snap under their weight, causing them do die on the concrete, while you get your flesh torn apart.
pause>nul
:ppp
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Retry
echo 2.) Exit
set /p var=Set Command: 
if %var%==1 goto start
if %var%==2 goto exit
goto ppp
:buytime
cls
echo You pick up your gun and run to the front door and start shooting zombies. Your rifle bullets rip through the zombie's weak flesh, taking out about three zeds with each bullet. You have to be careful though, you don't want to loose all of your ammo!
pause>nul
echo The zeds star heading in your direction, but by that time you had started to get a bit cocky. You see a zombie approach you from behind, so you turn around and realise that you need to reload.
pause>nul
echo You try to pull out anoter clip, but it slips from your trembling hands. As you reach for another one, the zed lunges onto you and eats you alive.
pause>nul
:pop
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Retry
echo 2.) Exit
set /p var=Set Command: 
if %var%==1 goto start
if %var%==2 goto exit
goto pop
:fusebox
cls
echo You decide to look around the building for a fuse box to shut off the cameras. As you get to the back of the building, you see it. You open it up, and you see a bunch of switches that you have no idea what they do.
echo.
echo You flick a few switches, and you start to feel a bit nervous. You should stop for a bit and think about what you're doing. Should you either shoot the box, or go back to the front and ry something else?
echo.
echo 1.) Shoot the box
echo 2.) Go back to the front.
set /p var=Set Command
if %var%==1 goto shootbox
if %var%==2 goto backtofront
goto fusebox
:shootbox
cls
echo You decide to shoot the box, what could go wrong? You take aim, and let it rip. Unexpectadly, the box makes a massive explosion and you go flying onto the road. You can't move, so you must've broken your spine. The zeds will find you eventually, and you hope it's soon.
echo.
pause>nul
:lllp
cls
color 04
echo Too bad, You died :(
echo.
echo 1.) Retry
echo 2.) Exit
set /p var=Set Command
if %var%==1 goto start
if %var%==2 goto exit
goto lllp
:shootlock
cls
echo You decide that you should just break into the shop and ignor the alarm. Your gun made a loud noise, but nothing compared to the loud ring of the alarm. You start togather food, but the alarm could be heard from miles away.
echo.
echo As you leave the store, you see a massive horde of zeds comming at you. There's no barricading the door, so this seems to be your end.
echo.
pause>nul
cls
echo And it is.
pause>nul
:sex
cls
color 04
echo Too bad, you died :(
echo.
echo 1.) Retry
echo 2.) Exit
set /p var=Set Command: 
if %var%==1 goto start
if %var%==2 goto exit
goto sex
:backtofront
cls
You decide it's too dangerous to keep messing with the box, what if you completely blew it up in your face? You walk back to the front of the store and...
echo.
echo 1.) Shoot the lock. Maybe the alarm wont go off.
echo 2.) Shoot the camera, there doesn't seem to be any zeds to hear the shot
echo 3.) Look around the grounds and try to find something useful
set /p var=Set Command: 
if %var%==1 goto shootlock
if %var%==2 goto shootcamera
if %var%==3 goto lookaround
goto backtofront
:lookaround
cls
echo You decide to look around the grounds. You might just find something useful. You wonder around for a bit, then see a zed in a uniform stuck under a lamp post. It doesn't appear to be moving, so you...
echo.
echo 1.) Approach the zed cautiously and try to loot it's body
echo 2.) Go back to the store
set /p var=Set Command: 
if %var%==1 goto backtofront1
if %var%==2 goto lootzed
goto lookaround
:backtofront1
cls
echo You go back to the front of the store and...
echo 1.) Shoot the lock. Maybe the alarm wont go off.
echo 2.) Shoot the camera, there doesn't seem to be any zeds to hear the shot
echo 3.) Look around the grounds and try to find something useful
set /p var=Set Command: 
if %var%==1 goto shootlock
if %var%==2 goto shootcamera
if %var%==3 goto lookaround
goto backtofront1
:lootzed
cls
echo You decide to loot the zed's body. It looks like it's in a shop uniform, so it might have a card that will let you in without the alarm going off. You walk over to it carefuly and check it's living status.
echo.
echo It seems to be alive, but unconcious. You don't want to make much noise, so you smash the zed's brain with the butt of your rifle. You take a look at it's body, and grab an identification card labeled: Manager Shaun Peterson.
pause>nul
cls
echo You go to the front of the store and scan the card by the doors. They open up, and the alarm doesn't trigger when you step in! You walk in and grab eveything you can, and go back home.
pause>nul
:modee
cls
echo 1.) go on
set /p var=Set Command: 
if %var%==1 goto end
goto modes
:end
echo That is all for now! More adventure comming soon!!!!
echo 1.) Start Again
echo 2.) Exit
set /p var=Set Command: 
if %var%==1 goto start
if %var%==2 goto exit
goto end

:exit