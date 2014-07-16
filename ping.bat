:start
@echo off
title Text based RPG game
color 1F
mode con: cols=50 lines=25
//This game is property of Arjan van Helden
//Please do not claim this as yours!
//Thank you for downloading!
cls
echo --------------------------------------------------
echo.
echo Welcome to my text based role-play game...
echo.
echo Please enter all actions with a capital letter!
echo.
echo --------------------------------------------------
echo 1. Instructions...
echo.
echo 2. Credits...
echo.
echo 3. Start your adventure...
echo.
echo If you want to quit the game type "stop"
echo.
set /p input=What do you want to do?: 
if %input%==stop exit
if %input%==1 goto instructions
if %input%==2 goto credits
if %input%==3 goto create
if not %input%==1/2/3/stop goto start
:instructions
cls
echo --------------------------------------------------
echo.
echo Welcome to the instructions...
echo.
echo --------------------------------------------------
echo This is a text based role-play game
echo You will need to create a character
echo and do whatever you want
echo There are many options to choose from
echo Please enter all actions with a capital letter!
echo The system has a very sensitive input
echo.
echo Have fun!
echo.
echo If you want to go back to the menu type "A"
echo.
echo To stop type "stop"
echo.
set /p input=What do you want to do?: 
if %input%==stop exit
if %input%==A goto start
if not %input%==A/stop goto start
:credits
cls
echo --------------------------------------------------
echo.
echo Welcome to the credits
echo.
echo --------------------------------------------------
echo This game is written in batch and is property
echo of me, Arjan van Helden. Thank you for playing
echo my game, please share!
echo.
echo If you want to go back to the menu type "A"
echo.
echo To stop type "stop"
echo.
set /p input=What do you want to do?: 
if %input%==stop exit
if %input%==A goto start
if not %input%==A/stop goto start
:create
cls
echo --------------------------------------------------
echo.
echo Welcome to the character creation...
echo.
echo --------------------------------------------------
echo.
echo Pick your race!
echo.
echo A. Human
echo B. Dwarf
echo C. Elf
echo.
set /p input=Choise: 
if %input%==A goto createHuman
if %input%==B goto createDwarf
if %input%==C goto createElf
if not %input%==A/B/C goto create
:createHuman
color B1
echo -------------------------------------------------- 
echo.
echo You've chosen human as your race...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your class!
echo.
echo A. Warrior
echo B. Rogue
echo C. Mage
echo.
set /p input=Choise: 
if %input%==A goto humanWarrior
if %input%==B goto humanRogue
if %input%==C goto humanMage
if not %input%==A/B/C goto createHuman
:createDwarf
color 48
echo -------------------------------------------------- 
echo.
echo You've chosen dwarf as your race...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your class!
echo.
echo A. Warrior
echo B. Rogue
echo C. Bomber
echo.
set /p input=Choise: 
if %input%==A goto dwarfWarrior
if %input%==B goto dwarfRogue
if %input%==C goto dwarfBomber
if not %input%==A/B/C goto createDwarf
:createElf
color E5
echo -------------------------------------------------- 
echo.
echo You've chosen elf as your race...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your class!
echo.
echo A. Warrior
echo B. Rogue
echo C. Mage
echo.
set /p input=Choise: 
if %input%==A goto elfWarrior
if %input%==B goto elfRogue
if %input%==C goto elfMage
if not %input%==A/B/C goto createElf
:humanWarrior
echo -------------------------------------------------- 
echo.
echo You've chosen warrior as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Sword, maces, axes and shield
echo B. Greatswords and battleaxes
echo C. Flails and small shields
echo.
set /p input=Choise: 
if %input%==A goto humanWarrior1
if %input%==B goto humanWarrior2
if %input%==C goto humanWarrior3
if not %input%==A/B/C goto humanWarrior
:dwarfWarrior
echo -------------------------------------------------- 
echo.
echo You've chosen warrior as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Sword, maces, axes and shield
echo B. Greatswords and battleaxes
echo C. Flails and small shields
echo.
set /p input=Choise: 
if %input%==A goto dwarfWarrior1
if %input%==B goto dwarfWarrior2
if %input%==C goto dwarfWarrior3
if not %input%==A/B/C goto dwarfWarrior
:elfWarrior
echo -------------------------------------------------- 
echo.
echo You've chosen warrior as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Sword, maces, axes and shield
echo B. Greatswords and battleaxes
echo C. Flails and small shields
echo.
set /p input=Choise: 
if %input%==A goto elfWarrior1
if %input%==B goto elfWarrior2
if %input%==C goto elfWarrior3
if not %input%==A/B/C goto elfWarrior
:humanRogue
echo -------------------------------------------------- 
echo.
echo You've chosen rogue as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Knifes and small blades
echo B. Bow and arrow
echo C. Trowing knifes and brassknuckles
echo.
set /p input=Choise: 
if %input%==A goto humanRogue1
if %input%==B goto humanRogue2
if %input%==C goto humanRogue3
if not %input%==A/B/C goto humanRogue
:dwarfRogue
echo -------------------------------------------------- 
echo.
echo You've chosen rogue as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Knifes and small axes
echo B. Bow and arrow
echo C. Trowing axes and brassknuckles
echo.
set /p input=Choise: 
if %input%==A goto dwarfRogue1
if %input%==B goto dwarfRogue2
if %input%==C goto dwarfRogue3
if not %input%==A/B/C goto dwarfRogue
:elfRogue
echo -------------------------------------------------- 
echo.
echo You've chosen rogue as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Curved knifes and small blades
echo B. Elven bow and arrow
echo C. Trowing knifes and brassknuckles
echo.
set /p input=Choise: 
if %input%==A goto elfRogue1
if %input%==B goto elfRogue2
if %input%==C goto elfRogue3
if not %input%==A/B/C goto elfRogue
:humanMage
echo -------------------------------------------------- 
echo.
echo You've chosen mage as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Elemental magic
echo B. Conjuration magic
echo C. Blood magic
echo.
set /p input=Choise: 
if %input%==A goto humanMage1
if %input%==B goto humanMage2
if %input%==C goto humanMage3
if not %input%==A/B/C goto humanMage
:dwarfBomber
echo -------------------------------------------------- 
echo.
echo You've chosen bomber as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Small bombs and blades
echo B. Big explosives and battlesticks
echo C. Distraction explosives and clubs
echo.
set /p input=Choise: 
if %input%==A goto dwarfBomber1
if %input%==B goto dwarfBomber2
if %input%==C goto dwarfBomber3
if not %input%==A/B/C goto dwarfBomber
:elfMage
echo -------------------------------------------------- 
echo.
echo You've chosen mage as your class...
echo.
echo -------------------------------------------------- 
echo.
echo Pick your weaponset!
echo.
echo A. Elemental magic
echo B. Conjuration magic
echo C. Natural magic
echo.
set /p input=Choise: 
if %input%==A goto elfMage1
if %input%==B goto elfMage2
if %input%==C goto elfMage3
if not %input%==A/B/C goto elfMage
:humanWarrior1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto hW1start
if %input%==N goto stop
if not %input%==yes/no goto humanWarrior1
:humanWarrior2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto hW2start
if %input%==N goto stop
if not %input%==yes/no goto humanWarrior2
:humanWarrior3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto hW3start
if %input%==N goto stop
if not %input%==yes/no goto humanWarrior3
:humanRogue1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto hR1start
if %input%==N goto stop
if not %input%==yes/no goto humanRogue1
:humanRogue2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto hR2start
if %input%==N goto stop
if not %input%==yes/no goto humanRogue2
:humanRogue3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto hR3start
if %input%==N goto stop
if not %input%==yes/no goto humanRogue3
:humanMage1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on a chair. It's very quiet around
echo you and you stand up and take a look around.
echo You realize that you're in the college's library.
echo An old man walks up to you and tells you to see
echo the head wizard.
echo.
echo Y/N?
echo.
set /p input=Do you want to go to the head wizard? 
if %input%==Y goto hM1start
if %input%==N goto stop
if not %input%==yes/no goto humanMage1
:humanMage2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on a chair. It's very quiet around
echo you and you stand up and take a look around.
echo You realize that you're in the college's library.
echo An old man walks up to you and tells you to see
echo the head wizard.
echo.
echo Y/N?
echo.
set /p input=Do you want to go to the head wizard? 
if %input%==Y goto hM2start
if %input%==N goto stop
if not %input%==yes/no goto humanMage2
:humanMage3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young human begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on a chair. It's very quiet around
echo you and you stand up and take a look around.
echo You realize that you're in the college's library.
echo An old man walks up to you and tells you to see
echo the head wizard.
echo.
echo Y/N?
echo.
set /p input=Do you want to go to the head wizard? 
if %input%==Y goto hM3start
if %input%==N goto stop
if not %input%==yes/no goto humanMage3
:dwarfWarrior1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dW1start
if %input%==N goto stop
if not %input%==yes/no goto dwarfWarrior1
:dwarfWarrior2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto hW2start
if %input%==N goto stop
if not %input%==yes/no goto humanWarrior2
:dwarfWarrior3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dW3start
if %input%==N goto stop
if not %input%==yes/no goto dwarfWarrior3
:dwarfRogue1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dR1start
if %input%==N goto stop
if not %input%==yes/no goto dwarfRogue3
:dwarfRogue2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dR2start
if %input%==N goto stop
if not %input%==yes/no goto dwarfRogue3
:dwarfRogue3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dR3start
if %input%==N goto stop
if not %input%==yes/no goto dwarfRogue3
:dwarfBomber1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up tired from the day before.
echo You work in the local explosives factory.
echo Bombs are your speciality and you leave home to
echo work at the factory. You find a note saying that
echo your boss has some news for you at work.
echo You go outside and walk to the factory.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dB1start
if %input%==N goto stop
if not %input%==yes/no goto dwarfBomber1
:dwarfBomber2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up tired from the day before.
echo You work in the local explosives factory.
echo Bombs are your speciality and you leave home to
echo work at the factory. You find a note saying that
echo your boss has some news for you at work.
echo You go outside and walk to the factory.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dB3start
if %input%==N goto stop
if not %input%==yes/no goto dwarfBomber3
:dwarfBomber3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young dwarf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up tired from the day before.
echo You work in the local explosives factory.
echo Bombs are your speciality and you leave home to
echo work at the factory. You find a note saying that
echo your boss has some news for you at work.
echo You go outside and walk to the factory.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto dB3start
if %input%==N goto stop
if not %input%==yes/no goto dwarfBomber3
:elfWarrior1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto eW1start
if %input%==N goto stop
if not %input%==yes/no goto elfWarrior1
:elfWarrior2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto eW2start
if %input%==N goto stop
if not %input%==yes/no goto elfWarrior2
:elfWarrior3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up in bed next to a young women
echo You put on your clothes and realise that it's your
echo big day! Today you are going to the townhall
echo to get your gear and ready yourself for
echo adventure. You are excited and go off.
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto eW3start
if %input%==N goto stop
if not %input%==yes/no goto elfWarrior3
:elfRogue1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto eR1start
if %input%==N goto stop
if not %input%==yes/no goto elfRogue1
:elfRogue2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto eR2start
if %input%==N goto stop
if not %input%==yes/no goto elfRogue2
:elfRogue3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on the ground, alone.
echo You stand up and look around you.
echo You remember what happened. Last night, after the
echo hunt I fell asleep... But you have to get ready
echo to get your gear. 
echo.
echo Y/N?
echo.
set /p input=Do you want to go further? 
if %input%==Y goto eR3start
if %input%==N goto stop
if not %input%==yes/no goto elfRogue3
:elfMage1
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on a chair. It's very quiet around
echo you and you stand up and take a look around.
echo You realize that you're in the college's library.
echo An old man walks up to you and tells you to see
echo the head wizard.
echo.
echo Y/N?
echo.
set /p input=Do you want to go to the head wizard? 
if %input%==Y goto eM1start
if %input%==N goto stop
if not %input%==yes/no goto elfMage1
:elfMage2
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on a chair. It's very quiet around
echo you and you stand up and take a look around.
echo You realize that you're in the college's library.
echo An old man walks up to you and tells you to see
echo the head wizard.
echo.
echo Y/N?
echo.
set /p input=Do you want to go to the head wizard? 
if %input%==Y goto eM2start
if %input%==N goto stop
if not %input%==yes/no goto elfMage2
:elfMage3
cls
echo -------------------------------------------------- 
echo.
echo Your adventure as a young elf begins...
echo.
echo -------------------------------------------------- 
echo.
echo You wake up on a chair. It's very quiet around
echo you and you stand up and take a look around.
echo You realize that you're in the college's library.
echo An old man walks up to you and tells you to see
echo the head wizard.
echo.
echo Y/N?
echo.
set /p input=Do you want to go to the head wizard? 
if %input%==Y goto eM3start
if %input%==N goto stop
if not %input%==yes/no goto elfMage3
:stop
cls
echo.
echo Do you really want to quit?
echo Progress will not be saved!
echo.
echo Y/N?
echo.
set /p input=Do you want to leave? 
if %input%==Y exit
if %input%==N goto start
if not %input%==Y/N goto stop