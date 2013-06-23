# Simple-Ducky Payload Generator v1.1.1


## Overview

The simple-ducky is designed to quickly create reliable payloads and launch listener's.The  Simple-Ducky currently uses version 2.6 of the duck encoder. The lastest version of the Simple-Ducky supports all Debian Linux distro's (i.e. Kali-Linux, Ubuntu, Linux Mint etc). The smart installer will take care of all the work for you.

With the simple-ducky in a matter of seconds you can;

 - Create your evil executable (its automatically placed in your web directory)
 - Create your inject.bin
 - And launch a listener (meterpreter or netcat). 

Note: The newest version supports all Debian distro's i.e. Kali, Backtrack, Ubuntu, Linux Mint, Backbox, etc... 


## Installation

To install the Simple-Ducky on any Debian distro:

 - git clone --recursive git://github.com/skysploit/simple-ducky.git /usr/share/simple-ducky
 - bash /usr/share/simple-ducky/install.sh
 - Once installed run the simple-ducky by typing: simple-ducky
 
Note 1: Be sure to run option 9 "Dependency Checker" prior to running any other functions.

Note 2: If you have prior installs (v1.1.0 or prior) issue this command:
 - rm -rf /usr/share/ducky
 
## Updating
To keep simple-ducky and all its modules updated:
 - On Debian-based distros: run simple-ducky-update from the command prompt
 - On Windows-based systems: run the included update.bat

## Change Log

Here what has changed throughout the different version's of the simple-ducky.

### v 1.1.1 Changes
 - Added tons of new features; Shells with dbd (incredibly powerful) and the Custom Payload Builder
 - Cleaned up the menu options
 - Made bug fixes to several payloads
 - Replaced Netcat with Ncat

### v 1.1.0 Changes
 - Upgraded the encoder to version 2.6
 - Made changes to the main menu
 - Added a new paylod: LM/NTLM Hash Dump From Live System
 - Added an LM/NTLM Password Hasher
 - Added a new tool: Site2lst Custom Wordlist Builder
 - Upgraded the installer: Now there is just one version of the simple-ducky that supports all Debian distro's (Only tested on Linux Mint and Ubuntu)
 - Added a new directory titled "misc" this file will hold often used files during attacks

### v 1.0.9 Changes
 - Added a new payload subset titled "Forced Phishing & Web Attacks"
 - Intergrated: SE-Toolkikt, Browser_Autopwn, and BurpSuite.
 - Added Payload: Local DNS Poisoning | SE-Toolkit's Java Applet Attack
 - Added Payload: Local DNS Poisoning | Metasploit's Browser_Autopwn
 - Added Payload: Proxy in the Middle (PiTM) | No Admin Access Needed | Burpsuite

### v 1.0.8 Changes
 - Added OSX Single User Mode Reverse Shell Payload
 - Made minor scripting changes
 - Changed Encoder to version 2.5
 - Fixed bugs in the FTP Server Setup option
 - Created a User add function for the FTP Server Setup

### v 1.0.7 Changes
 - Fixed command line entrance method on all Windows no UAC Vista/7 Payloads (Props to arzen)

### v 1.0.6 Changes
 - Created two separate versions of the simple-ducky (1 for Kali-Linux and the other for Other Linux Distros)
 - Removed the install dependencies option on the Kali-Linux version (Kali will keep these up to date)(Other-Linux version still has it)
 - Updated the Powershell Download & Payloads to provide better obfuscation (tested on fully patched windows Vista/7/8 running McAfee) 
 - Added a new function that configures the Pure-FTPD server for the user

### v1.0.5 Changes
 - Complete Payload and Menu Revamp
 - Updated menu options

### v1.0.4 Changes
 - Added ~Persistence~ payload
 - Updated menu options

### v1.0.3 Changes
 - Payload Update
 - JDK update support for 64bit systems added
 - Added initial delay function (allows you to set a custom delay for driver install time).
 - Changed encoder version from 2.4 to 3.0

### v1.0.2 Changes
 
 - International keyboard mapping added. -- Tester's would be greatly appreciated.
 - Aesthetic changes to text. 
 
### v1.0.1 Changes
 
 - Added Payloads
 - Encoder downgraded from v3.0 to v2.4 due to issues encoding the Windows 7 Reverse shell payload.
 
If you would like to contribute your payload to the Simple-Ducky please contact me - skysploit@gmail.com 



# Encoder Readme


This new version allows you to use alternative layout. It supports ASCII, ISO-8859-1 and unicode.

 - $java -jar duckencode.jar -i script.txt -o inject.bin -l fr
   - or
 - $java -jar duckencode.jar -i script.txt -o inject.bin -l resources/mylayout.properties


### Hak5 Duck Encoder 2.6

 - usage: duckencode -i [file ..] encode specified file
 - or: duckencode -i [file ..] -o [file ..] encode to specified file

### Arguments:
  - -i [file ..]         Input File
  - -o [file ..]         Output File
  - -l [file ..]         Keyboard Layout (us/uk/fr/pt or a path to a properties file)

### Script Commands:

 - ALT [key name] (ex: ALT F4, ALT SPACE)
 - ALT-SHIFT (Input Lanugage Swap)
 - CTRL | CONTROL [key name] (ex: CTRL ESC)
 - CTRL-ALT [key name] (ex: CTRL-ALT DEL)
 - CTRL-SHIFT [key name] (ex: CTRL-SHIFT ESC)
 - DEFAULT_DELAY | DEFAULTDELAY [Time in millisecond * 10] (change the delay between each command)
 - DELAY [Time in millisecond * 10] (used to overide temporary the default delay)
 - COMMAND | COMMAND [key] (For OSX Users ex: COMMAND SPACE)
 - GUI | WINDOWS [key name] (ex: GUI r, GUI l)
 - REM [anything] (used to comment your code, no obligation :) )
 - SHIFT [key name] (ex: SHIFT DEL)
 - REPEAT [Number] (Repeat last command N times)
 - STRING [any character of your layout]
 - [key name] (anything in the keyboard.properties)

Note:
   Getting strange behaviour with GUI to open windows-menu, WINDOWS appears to work ok (but GUI maps to WINDOWS), strange?
