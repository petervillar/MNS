; Merry Night Shift - A text adventure for the #DAADHolidayJam
;
; MNS.SCE source code for DAAD V2
; Peter Villar - December 2019
;
;------------------------------------------------------------------------------
;
;
#include symbols.sce
/CTL    ;Control Section (null char is an underline)
_       
/TOK    ;Tokens as supplied with PAW under CP/M
_the_
_you_
_are_
ing_
_to_
_and
_is_
You_
and_
The_
n't_
_of_
_you
ing
ed_
_a_
_op
ith
out
ent
_to
_in
all
_th
_it
ter
ave
_be
ver
her
and
ear
You
_on
en_
ose
no
ic
ap
_b
gh
__
ad
is
_c
ir
ay
ur
un
oo
_d
lo
ro
ac
se
ri
li
ti
om
bl
ck
I_
ed
ee
_f
ha
pe
e_
t_
in
s_
th
,_
er
d_
on
to
an
ar
en
ou
or
st
._
ow
le
at
al
re
y_
ch
am
el
_w
as
es
it
_s
ll
do
op
sh
me
he
bo
hi
ca
pl
il
cl
_a
of
_h
tt
mo
ke
ve
so
e.
d.
t.
vi
ly
id
sc
_p
em
r_
;------------------------------------------------------------------------------
/VOC    ;Vocabulary
;                       Movements ie verbs and nouns < 14
N       2       noun
NORTH   2       noun
S       3       noun
SOUTH   3       noun
E       4       noun
EAST    4       noun
W       5       noun
WEST    5       noun
NE      6       noun
NW      7       noun
SE      8       noun
SW      9       noun
U       10      noun
UP      10      noun
ASCEN   10      verb
D       11      noun
DOWN    11      noun
DESCE   11      verb
THREA	12	noun		; So we can thread the needle with a thread
;                       Nouns   <20 means can be used as verbs
;                               <50 means a proper noun ie not an 'IT'
I       14      noun
INVEN   14      noun
ALL     20      noun
LOT     20      noun
EVERY   20      noun
;
BUTTO	21	noun		; A button
NEEDL	22	noun		; A needle
SPECT	23	noun		; A pair of spectacles
GLASS	23	noun		; A pair of spectacles
NOTE	24	noun		; different notes
;
TORCH   100     noun
;                       Verbs
GET     20      verb
TAKE    20      verb
DROP    21      verb
PUT     21      verb
REMOV   22      verb
WEAR    23      verb
R       24      verb
REDES   24      verb
Q	25	verb
QUIT    25      verb
STOP    25      verb
SAVE    26      verb
LOAD    27      verb
RAMSA   28      verb
RAMLO   29      verb
LOOK    30      verb
SAY     31      verb
ASK     31      verb
TALK    31      verb
SPEAK   31      verb
X	30      verb
EXAMI   30      verb
;                               Adjectives
SMALL   2       adjective
BIG     3       adjective
LARGE   3       adjective
OLD     4       adjective
NEW     5       adjective
HARD    6       adjective
SOFT    7       adjective
SHORT   8       adjective
LONG    9       adjective
DANCE	10	adjective
PRANC	11	adjective
COMET	12	adjective
;                               Adverbs
QUICK   2       adverb
SLOWL   3       adverb
QUIET   4       adverb
LOUDL   5       adverb
CAREF   6       adverb
SOFTL   6       adverb
GENTL   6       adverb
;                               Prepositions
TO      2       preposition
FROM    3       preposition
IN      4       preposition
OUT     5       preposition
THROU   6       preposition
OVER    7       preposition
UNDER   8       preposition
BY      9       preposition
ON      10      preposition
OFF     11      preposition
AT      12      preposition
EXCEP   13      preposition
;                               Pronouns
IT      2       pronoun
THEM    2       pronoun
;                               Conjugations
AND     2       conjugation
THEN    2       conjugation
;
;------------------------------------------------------------------------------
/STX    ;System Message Texts
/0
It's too dark to see anything.
/1

I can also see 
/2
/3
/4
/5
/6
I was not able to understand any of that.

/7
I can't go in that direction.

/8
I can't do that.

/9
You are carrying 
/10
You are wearing 
/11 ;*Spare
/12
Are you sure? 
/13
Would you like another go? 
/14 ;*Spare
/15
OK.

/16
Press any key to continue.

/17 ;*You have taken
/18 ;*\sturn
/19 ;*s
/20 ;*.[CR]
/21 ;*You have scored
/22 ;*%[CR]
/23
I'm not wearing one of those.

/24
I can't. I'm wearing the _.

/25
I already have the _.

/26
There isn't one of those here.

/27
I can't carry any more things.

/28
I don't have one of those.

/29
I'm already wearing the _.

/30     ;One upper case character only
Y
/31     ;One upper case character only
N
/32
More...
/33

> 
/34 ;*Spare
/35

Time passes...

/36
I now have the _.

/37
I'm now wearing the _.

/38
I've removed the _.

/39
I've dropped the _.

/40
I can't wear the _.

/41
I can't remove the _.

/42
I can't remove the _. My hands are full.

/43
The _ weighs too much for me.

/44
The _ is in the 
/45
The _ isn't in the 
/46
, 
/47
 and 
/48
.

/49
I don't have the _.

/50
I'm not wearing the _.

/51
.

/52
There isn't one of those in the 
/53
Nothing.

/54 ;Letter for Tape
T
/55 ;Disc
D
/56
Drive not ready - press any key to retry.

/57
I/O Error.

/58
Disc or Directory may be full.

/59
Invalid filename.

/60
Type in name of file:
/61
Start tape.

/62
Tape or Disc?
;------------------------------------------------------------------------------
/MTX    ;Message Texts
/0
/1
*** The End, Merry Christmas ***
/2
Entrance Hall
/3
Corridor
/4
End of the Corridor
/5
Kitchen
/6
Bathroom
/7
Living Room
/8
Santa's Office
/9
Workshop
/10
In the Basement
/11
Spare Parts Room
/12
Store Room
/13
It is a black, mushroom domed button.
/14
A sewing needle, used for hand-sewing.
/15
It is basically a hand sewing thread.
/16
Comfortable, but not particularly stylish.
/17
The note says:

Quest #1
/18
The note says:

Quest #2
/19
The note says:

Quest #3
/20
The needle is threaded and ready to go.
/21
You painstakingly pass the thread through the tiny eye of the needle.
;------------------------------------------------------------------------------
/OTX    ;Object Texts
/0
A black button
/1
A needle
/2
A sewing thread
/3
A pair of spectacles
/4
A note from Dancer
/5
A note from Prancer
/6
A note from Comet
;------------------------------------------------------------------------------
/LTX    ;Location Texts
/0
     Merry Night Shift
  - A Christmas adventure -



Christmas eve is tonight and Santa Claus is off to work...


As every year, you have volunteered to be the Christmas Elf-on-duty 
and stay at Santa's toy workshop to deal with any problem that might arise
with the delivered toys during this magical night.


No shift can possibly be more exciting and rewarding than this one!


/1
; Inside the cupboard
/2
This is the entrance to Santa Claus workshop and home. A dimly lit corridor
leads east to the inside of the house.


Oddly enough, there is no Christmas tree at Santa's.
/3
You are in a dimly lit corridor, leading north to the kitchen and south
to the living room. The corridor continues to the east.
/4
This is the end of the corridor, with exits north towards the bathroom and
south towards Santa's office.


From here a flight of stairs leads down to the basement.
/5
The kitchen is warm and welcoming, and the smell of homemade cinnamon rolls
fills the air.
/6
The bathroom is small, with a clawfoot tub and blue and white tiled
walls. A mirror with shelf and washbasin underneath hangs against one
of the tiled walls.
/7
A cosy living room, with a soft rug that warms the space and gives a nice
homely feel.


Wood is burning in the fireplace.
/8
A massive bed covered in a thick duvet an a pile of pillows dominates the center
of the room. Against one of the walls you can see a big desk, high enough for
you to write upon when standing.

The room's large window is slightly open.
; with a sea of papers.
/9
This is a large shop well arranged and fully equipped with all sort of tools used
by carpenters and wood toy makers.


A lantern burns on a wooden workbench, giving adequate illumination to the room.
/10
This part of the basement is poorly lit, but you can make your way around. There
are exits to the west and to the south.


The stairs take you back up to the corridor.
/11
Shelves of cupboards, most of them unopened for years, line every wall of this
windowless room.
/12
The store room contains old, unfinished toys. There is firewood stacked and prepared
in a pile of wooden logs.
;------------------------------------------------------------------------------
/CON    ;Connections
/0
/1
/2
E 3
/3
N 5
W 2
E 4
S 7
/4
N 6
W 3
S 8
D 10
/5
S 3
/6
S 4
/7
N 3
E 8
/8
W 7
N 4
/9
E 10
S 11
/10
U 4
S 12
W 9
/11
N 9
E 12
/12
N 10
W 11
;------------------------------------------------------------------------------
/OBJ    ;Object Definitions
;obj  starts  weight    c w  5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0    noun   adjective
;num    at
/0      CARRIED	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    BUTTO  _
/1      CARRIED	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NEEDL  _
/2      CARRIED	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    THREA  _
/3      6	1       _ Y  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    SPECT  _
/4      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   DANCE
/5      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   PRANC
/6      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   COMET
/7      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NEEDL  THREA
;------------------------------------------------------------------------------
/PRO 0       ;Main Location Loop

_       _       AT      0               ; Starting game
                PROCESS 6               ; then we need init sequence

_       _       WINDOW  0               ; Select graphics window
                CLEAR   DarkF           ; Assume light
;                MINUS   2       1       ; Decrement flag 2    (See notes)
                NOTZERO 0
;                MINUS   3       1       ; & Flag 3 if Dark    (See notes)
                ABSENT  0
;                MINUS   4       1       ; & Flag 4 if No Lamp (See notes)
                SET     DarkF           ; Dark

_       _       PICTURE [Player]        ; If there is a picture, Load it
                DISPLAY [DarkF]         ; & Display it if not dark, else CLS

_	_	WINDOW	2
		CLS
		MES	[38]

_       _       WINDOW  1
                NOTZERO DarkF           ; Dark
                SYSMESS 0

_       _       ZERO    DarkF
		CLS
                DESC    [Player]        ; Doesn't exit loop now

_       _       PROCESS 3

; Now we use Process 1 as the main code loop, a return from it is the end
; of the game

_       _       PROCESS 1

;------------------------------------------------------------------------------
/PRO 1
_       _       PROCESS 4               ; Do process 2 stuff here

;_       _       MINUS   5       1       ; Update auto flags
;                MINUS   6       1       ; These are not supported anymore
;                MINUS   7       1       ; as we use the low section as
;                MINUS   8       1       ; a small stack
;                NOTZERO 0               ; But should you need them
;                MINUS   9       1       ; this is the Version 1 DAAD code!
;                ABSENT  0
;                MINUS   10      1

_       _       PARSE   0               ; Get next LS from current buffer
                PROCESS 2               ; Failed cos of invalid or timeout
                REDO

_       _       EQ      Turns   255     ; Max for one byte
                PLUS    Turns+1 1
                CLEAR   Turns
                SKIP    1

_       _       PLUS    Turns   1

_       _       PROCESS 5               ; Do any commands
                ISDONE                  ; Done something
                REDO

_       _       MOVE    Player          ; No so try to move player
                RESTART                 ; Absolute jump to start process 0

_       _       NEWTEXT
                LT      Verb    14
                SYSMESS 7
                REDO

_       _       SYSMESS 8
                REDO


;------------------------------------------------------------------------------
/PRO 2
_       _       HASAT TIMEOUT
                SYSMESS 35
                DONE

_       _       SYSMESS 6               ; I didn't understand

;------------------------------------------------------------------------------
/PRO 3 ; Old process 1. Note that both the response table and the old PAW 
; process tables 1 and 2 can now be anywhere or completely absent. Everything
; is implemented in the DAAD language itself.

;This is better carried out thus
_       _       NEWLINE
                ZERO    DarkF            ; Isn't dark
                LISTOBJ

;than the old system needed in Version 1, without accesss to DarkF
;_       _       NEWLINE
;                ZERO    0               ;If it is light...
;                ABSENT  0               ;and the light source is absent...
;                LISTOBJ                 ;List the objects

;_       _       PRESENT 0               ;If the light source is present...
;                LISTOBJ                 ;List the objects

;------------------------------------------------------------------------------
/PRO 4 ; Old process 2
;------------------------------------------------------------------------------
/PRO 5 ; Command decoder

I       _       SYSMESS 9
                LISTAT  CARRIED
                SYSMESS 10
                LISTAT  WORN
                DONE

EXAMI	_	PROCESS 7
		DONE

GET     ALL     DOALL   HERE
GET     _       AUTOG
                DONE

DROP    ALL     DOALL   CARRIED
DROP    _       AUTOD
                DONE

REMOVE  ALL     DOALL   WORN
REMOVE  _       AUTOR
                DONE

WEAR    ALL     DOALL   CARRIED
WEAR    _       AUTOW
                DONE

R       _       RESTART

QUIT    _       QUIT
                END

QUIT    _       DONE                    ;Not like QUIT on PAW

SAVE    _       SAVE    0               ;ditto
                RESTART

LOAD    _       LOAD    0
                RESTART

RAMSA   _       RAMSAVE
                RESTART

RAMLO   _       RAMLOAD 255             ;Reload all flags
                RESTART

LOOK    _       RESTART
;------------------------------------------------------------------------------
/PRO 6 ; Initialise the DAAD system

_	_	WINDOW	2
_	_	WINAT	0	0
		WINSIZE	1	127
		CLS

_       _       WINDOW  1               ; Windows are random
_       _       WINAT   2       0	; 14?
                WINSIZE 23      127     ; Maximum window
                CLS
                DESC    0               ; Introduction
                ANYKEY
                CLS
                CLEAR   255             ; Clear all flags

_       _       NOTEQ   255     GFlags
                CLEAR   [255]

_       _       PLUS    255     1
                LT      255     255     ; Will be set at end to indicate init
                SKIP    -2              ; has been done once

_       _       RESET                   ; Set objects to start location & Flag 1
                LET     Strength 10
                LET     MaxCarr  4
                SET     CPNoun
                SET     CPAdject
		LET	53	64	; object lists printed as sentences.
                GOTO    2               ; Main game

;------------------------------------------------------------------------------
/PRO 7 ; Examine stuff

EXAMI	BUTTO	PRESENT	0
		MESSAGE	13
		DONE

EXAMI	NEEDL	PRESENT	1
		MESSAGE	14
		DONE

EXAMI	THREA	PRESENT	2
		MESSAGE	15
		DONE

EXAMI	SPECT	PRESENT	3
		MESSAGE	16
		DONE

