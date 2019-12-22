; Merry Night Shift - A text adventure for the #DAADHolidayJam
;
; MNS.SCE source code for DAAD V2
; Peter Villar - December 2019
;
; Fixme: message a bird is chirping does not appear
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
;                       Nouns   <20 means can be used as verbs
;                               <50 means a proper noun ie not an 'IT'
I       14      noun
INVEN   14      noun
ALL     20      noun
LOT     20      noun
EVERY   20      noun
BIRD	21	noun
MESSE	21	noun
SOMEO	21	noun
SOMET	21	noun
;
BUTTO	50	noun		; A button
EYE	50	noun		; A button
NEEDL	51	noun		; A needle
SPECT	52	noun		; A pair of spectacles
GLASS	52	noun		; A pair of spectacles
NOTE	53	noun		; different notes
LETTE	53	noun		; different notes
ELEPH	54	noun		; toy elephant
TRUMP	55	noun		; toy bugle
BUGLE	55	noun		; toy bugle
PERFU	56	noun		; perfume atomizer
BOTTLE	56	noun		; perfume atomizer
DUCK	57	noun		; a rubber duck
BULB	58	noun		; rubber bulb
WORKB	59	noun		; workbench
BENCH	59	noun		; workbench
COTTO	60	noun		; So we can thread the needle with a thread
STRAN	61	noun		; So we can thread the needle with a thread
MIRRO	62	noun		; the mirror
SHELF	63	noun		; the shelf
SHELV	63	noun		; shelves of cupboards
DOLL	64	noun		; the rag doll
WINDO	65	noun		; santa's window
WASHB	66	noun		; the washbasin
SINK	66	noun		; the washbasin
TUB	67	noun		; the clawfoot tub
CLAWF	67	noun		; the clawfoot tub
BATHT	67	noun		; the clawfoot tub
RUG	68	noun		; the rug
KITCH	69	noun		; the kitchen
ROLLS	70	noun		; cinnamon roll
WALL	71	noun		; could be useful
WALLS	71	noun		; could be useful
CUPBO	72	noun		; shelves of cupboards
FLASK	74	noun		; bottle of cognac
COGNA	74	noun		; bottle of cognac
CUTTE	75	noun		; box cutter
KNIFE	75	noun		; box cutter
CRATE	76	noun		; wooden crates and boxes
CARDB	76	noun		; wooden crates and boxes
BOX	76	noun		; wooden crates and boxes
BOXES	76	noun		; wooden crates and boxes
LAMP	77	noun		; lamp
;
TORCH   100     noun
;                       Verbs
GET     20      verb
TAKE    20      verb
DROP    21      verb
PUT     21      verb
INSERT  21      verb
PLACE   21      verb
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
X	30      verb
EXAMI   30      verb
READ	30      verb
SAY     31      verb
ASK     31      verb
TALK    31      verb
SPEAK   31      verb
THREA	31	verb
SEW	32	verb
OPEN	33	verb
CLOSE	34	verb
WAIT	35	verb
FIX	36	verb
MEND	36	verb
ABOUT	37	verb
CREDI	37	verb
GIVE	38	verb
PRESS	39	verb
DRINK	40	verb
CUT	41	verb
RIP	41	verb
SQUEE	42	verb
HUG	42	verb
DETAC	43	verb
LOOSE	43	verb
SEPAR	43	verb
DISJO	43	verb
PLAY	44	verb
BLOW	44	verb
ATTAC	45	verb
ASSEM	45	verb
STICK	45	verb
USE	45	verb
HELP	46	verb
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
DANCE	138	adjective		; dancer the reindeer
PRANC	139	adjective		; prancer the reindeer
SANTA	140	adjective		; the man himself
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
INSID   4       preposition
INTO	4	preposition
OUT     5       preposition
THROU   6       preposition
OVER    7       preposition
UNDER   8       preposition
BY      9       preposition
ON      10      preposition
OFF     11      preposition
AT      12      preposition
EXCEP   13      preposition
APART	14	preposition
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

You can also see 
/2
/3
/4
/5
/6
I was not able to understand any of that.

/7
You can't go in that direction.

/8
You can't do that.

/9
You are carrying 
/10
You are wearing 
/11 ;*Spare
/12
Are you sure? 
/13
Another game? 
/14 ;*Spare
/15
Ok.

/16
Press any key to continue.

/17 ;*You have taken
/18 ;*\sturn
/19 ;*s
/20 ;*.[CR]
/21 ;*You have scored
/22 ;*%[CR]
/23
You are not wearing one of those.

/24
You can't. You are wearing the _.

/25
You already have the _.

/26
There isn't one of those here.

/27
You can't carry any more things.

/28
You don't have one of those.

/29
You are already wearing the _.

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

Time passes..

/36
You now have the _.

/37
You are now wearing the _.

/38
You have removed the _.

/39
You have dropped the _.

/40
You can't wear the _.

/41
You can't remove the _.

/42
You can't remove the _. Your hands are full.

/43
The _ weighs too much.

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
You don't have the _.

/50
You are not wearing the _.

/51
.

/52
There isn't one of those in the 
/53
nothing.

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
Merry Night Watch by Peter Villar, December 2019

DAAD compiler 2.42 by Infinite Imaginations and Aventuras AD
/1
This note comes directly from Santa, and it says:


"I am very grateful for your help, I wouldn't have been able
to do this important task without it!


I think I can manage the rest by myself, so take a well reserved
rest and...


Merry Christmas!


S."

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
Storage Room
/13
It is a black, mushroom domed button.
/14
A sewing needle, used for hand-sewing.
/15
It is basically a hand sewing thread.
/16
Comfortable, but not particularly stylish.
/17
This note comes directly from Dancer the reindeer, and it says:


"One of the rag dolls came with a missing eye and Santa would
like to have it mended.


Please give it back to our feathered friend once you are done.


D."
/18
This note comes directly from Prancer the reindeer, and it says:


"Santa is probably beginning to get drunk as none of us can see what is
wrong with this elephant.


Whatever it is, please fix it and give it back to our
feathered friend once you are done.


P."
/19
The needle is threaded and ready to go.
/20
You painstakingly pass the thread through the tiny eye of the needle.
/21
The workbench is extremely stable and strong.
/22
It seems that old Santa finally has mended his torn socks, as he left a
needle and a strand of cotton thread lying on it.
/23
Your poor eyes deserve better lighting for needlework.
/24
Your sight is too poor for you to do any work.
/25
You surely are missing something.
/26
It is a small, rustic wood shelf.
/27
Your long-lost spectacles are perched on the shelf.
/28
You see nothing special.
/29
Your reflection looks at you straight in the eye.
/30
A sweet and soft rag doll, made from scraps of fabrics.
/31
The doll is missing one eye.
/32
The room's large window is slightly open.
/33
The room's large window is closed.
/34
You can hear a light tapping on a window.
/35
One of Santa's little bird messengers is waiting outside.
/36
Santa's little messenger enters through the window opening and lands on the desk.
/37
You open the window just a little, and you get a nice breeze from the outside.
/38
It's already open.
/39
You close the window.
/40
You can barely make out something little and feathery outside the window.
/41
The little bird is here on an errand from Santa.
/42
A little bird is sitting on the table.
/43
The bird leaves a note and what looks like a doll.
/44
Which note do you mean?
/45
Santa uses the cupboards as a convenient storage for lots of things.


One of them has a label that reads "emergency spare kit".
/46
You pull the cupboard open, not without some effort.
/47
The cupboard got stuck and won't close.
/48
You can't see anything useful in that mess right now.
/49
You spot something black and round that could be useful.
/50
One of the cupboards is open.
/51
You place the button where the missing eye is supposed to be,
but it falls off.
/52
You don't have everything you need.
/53
You sew the button where the missing eye is supposed to be.
/54
The doll has two beautiful matching dark eyes.
/55
That is exactly what you need to do.
/56
The house could use some fresh air, better leave it open.
/57
The bird refuses it, chirping angrily while looking at you.
/58
The bird grabs it with its beak and flies away through the window.
/59
The bird leaves a note and what looks like a stuffed elephant toy.
/60
Which note do you mean?
/61
The plush elephant toy is soft and easy to grasp and hug. 
/62
The elephant quacks when you give it a gentle squeeze.
/63
Santa's favourite.
/64
You take a sip, why not?


The taste of the cognac felt beautiful in the mouth.
/65
You better not abuse it.
/66
It has been really handy for opening up sealed boxes during the last unpacking job.
/67
Skillfully you cut open the toy, exposing its hollow interior.
/68
A rubber duck pops out of it, falling to the ground.
/69
You still feel happy when you squeeze it, but only a dull sound comes from it.
/70
Nobody wants that.
/71
quack! quack! quack!
/72
The water in the tub is clean and still warm.
/73
You put the rubber duck in the water.
/74
The rubber duck is swimming happily around in the tub.
/75
Yellow and cute.
/76
.. why would you do that?
/77
The bottle is almost empty.
/78
It has a bulb attached, so when you squeeze it it sprays perfume.
/79
You take the bulb apart.
/80
The rubber bulb is dried and cracked due to age, but it works.
/81
When you squeeze it, 
/82
the bottle sprays perfume.
/83
air comes out of it.
/84
The wooden crates have been used for storing bottles in the past, but now
they are only used for old discarded toys.
/85
You notice a tiny plastic bugle in reasonably good condition.
/86
The bugle is amazingly small.
/87
The bugle produces a sharp, high-pitched sound.
/88
You attach the bulb to the bugle.
/89
There is a rubber bulb attached to its end.
/90
The toy elephant is ripped open,
/91
revealing a hollow space inside.
/92
revealing a tiny bugle with a bulb inside.
/93
You put the bugle inside the body of the toy elephant.
/94
The elephant makes a happy trumpet noise.
/95
You sew the elephant back up nice and tightly.
/96
No way, after all this effort!
/97
The bird leaves a note.
/98
Not without fixing it first.
/99
Did you skip sewing class?
/100
You hear a bird chirping somewhere in the house.
/101
\/12
/102
Score 
/103
Time passes...
/104
How exactly do you want to use it?
/105
Assist Santa tonight plus get some extra points by performing a couple
of acts of kindness.


Use the compass directions to move around.


Try out the following commands:


EXAMINE(X), LOOK (INSIDE, IN ...)

INVENTORY(I), REDESCRIBE(R)

QUIT, SAVE/LOAD and RAMSAVE/RAMLOAD

GET, DROP, WEAR, REMOVE, GIVE ...
/106
The rug is soft and pleasant to walk on.
/107
The lamp gives a pleasant and warm light.
/108
You're not going cave exploring tonight.
;------------------------------------------------------------------------------
/OTX    ;Object Texts
/0
A black button
/1
A needle
/2
A strand of cotton thread
/3
A pair of spectacles
/4
A note from Dancer
/5
A note from Prancer
/6
A plush elephant toy
/7
A toy bugle
/8
A perfume bottle
/9
A rubber bulb
/10
A rubber duck
/11
A rag doll
/12
A flask of cognac
/13
A box cutter
/14
A note from Santa
;------------------------------------------------------------------------------
/LTX    ;Location Texts
/0
           Merry Night Shift


       - A Christmas Adventure -



Christmas Eve is tonight and Santa Claus is off to work...


As every year, you have volunteered to be the Christmas Elf-on-duty 
and stay at Santa's toy workshop to deal with any problem that might arise
with the delivered toys during this magical night.


No shift can possibly be more exciting and rewarding than this one!


/1
; Limbo room
/2
This is the entrance to Santa Claus' workshop and home. A dimly lit corridor
leads east to the inside of the house.
/3
You are in a dimly lit corridor, leading north to the kitchen and south
to the living room. The corridor continues to the east, and to the west
lies the entrance hall.
/4
This is the end of the corridor, with exits north towards the bathroom and
south towards Santa's office.


From here a flight of stairs leads down to the basement.
/5
The kitchen is warm and welcoming, and the smell of homemade cinnamon
rolls fills the air.
/6
The bathroom is small, with a clawfoot tub and white tiled walls.
A mirror with shelf and washbasin underneath hangs against one
of the walls.
/7
A cosy living room, with a soft rug that warms the space and gives a nice
homely feel.
/8
A massive bed covered in a thick duvet an a pile of pillows dominates the center
of the room. Against one of the walls you can see a big desk, high enough for
you to write upon when standing.
; with a sea of papers.
/9
This is a large shop well arranged and fully equipped with all sort of tools used
by carpenters and wood toy makers.


A lamp burns on a wooden workbench, giving adequate illumination to the room.
/10
This part of the basement is poorly lit, but you can make your way around. There
are exits to the west and to the south.


The stairs take you back up to the corridor.
/11
Shelves of cupboards, most of them unopened for years, line every wall of this
windowless room.
/12
Piles of cardboard boxes, wooden crates and packing material are spread around
the room.
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
/0      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    BUTTO  _
/1      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NEEDL  _
/2      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    STRAN  _
/3      252	1       _ Y  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    SPECT  _
/4      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   DANCE
/5      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   PRANC
/6      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    ELEPH  _
/7      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    BUGLE  _
/8      6	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    PERFU  _
/9      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    BULB   _
/10     252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    DUCK   _
/11     252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    DOLL   _
/12     7	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    FLASK  _
/13     12	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    CUTTE  _
/14     252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   SANTA
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

_	_	PROCESS	11		; print status
;_	_	WINDOW	2
;		CLS
;		MES	[38]
;		PRINTAT	0	33
;		MES	102
;		PRINT	100		; score in percentage
;		MES	101

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

_	_	AT	8		; Santa's office
		ZERO	66		; Window is closed
		NEWLINE
		MESSAGE	33

_	_	AT	8		; Santa's office
		NOTZERO	66		; Window is opened
		NEWLINE
		MESSAGE	32

_	_	AT	8		; At Santa's office
		EQ	65	1	; bird waiting outside
		NEWLINE
		MESSAGE	35		; say it

_	_	AT	8		; At Santa's office
		EQ	65	2	; bird waiting inside
		NEWLINE
		MESSAGE	42		; say it

_	_	AT	11		; spare room
		NOTZERO	68		; cupboard open
		NEWLINE
		MESSAGE	50

;------------------------------------------------------------------------------
/PRO 4 ; Old process 2

_	_	PROCESS	9		; The bird

;------------------------------------------------------------------------------
/PRO 5 ; Command decoder

I       _       SYSMESS 9
                LISTAT  CARRIED
		NEWLINE
                SYSMESS 10
                LISTAT  WORN
                DONE

EXAMI	_	PROCESS 7
		DONE

THREA	NEEDL	PROCESS	8

SEW	_	PROCESS	10		; all things sewing

USE	NEEDL	CARRIED	1		; needle
		MESSAGE	104		; how do you want to use it?
		DONE

USE	STRAN	CARRIED	2		; strand
		MESSAGE	104		; how do you want to use it?
		DONE

OPEN	WINDO	AT	8		; at santa's office
		ZERO	66		; window is closed
		SET	66		; open it
		MESSAGE	37		; tell it to player
		DONE

OPEN	WINDO	AT	8		; at santa's office
		NOTZERO	66		; is it open?
		MESSAGE	38		; already open
		DONE

OPEN	CUPBO	AT	11		; spare room
		ZERO	68		; closed?
		SET	68		; open it
		MESSAGE	46		; you open it
		DONE

OPEN	CUPBO	AT	11		; spare room
		NOTZERO	68		; open?
		MESSAGE	38		; already open
		DONE

CLOSE	CUPBO	AT	11		; spare room
		NOTZERO	68		; open?
		MESSAGE	47		; it won't close
		DONE

CLOSE	WINDO	AT	8		; santa's office
		NOTZERO	66		; window open?
		MESSAGE	56		; better leave it open
		DONE
FIX	EYE	LET	34	64	; 64 -> doll but it doesn't seem to work
FIX	DOLL	CARRIED	0		; the button
		CARRIED	11		; the doll
		MESSAGE	51		; the button falls
		LET	51	0	; the button drops
		PUTO	[38]		; puto uses the object in flag #51
		DONE

FIX	DOLL	CARRIED	11		; the doll
		MESSAGE	55		; that is what you need to do
		DONE

SQUEE	BULB	CARRIED	8		; the perfume bottle
		ISAT	9	252	; bulb attached to bottle
		MES	81		; when you squeeze it ...
		MESSAGE	82		; it sprays perfume
		DONE

SQUEE	BULB	CARRIED	7		; the bugle
		ISAT	9	1	; bulb attached to bugle
		MESSAGE	87		; high-pitched sound
		DONE

SQUEE	BULB	CARRIED	9		; bulb taken apart
		MES	81		; when you squeeze it ...
		MESSAGE	83		; it sprays air
		DONE

SQUEE	ELEPH	CARRIED	6		; the elephant
		ISAT	10	252	; duck still inside
		MESSAGE	62		; gives a quack
		DONE

SQUEE	ELEPH	CARRIED	6		; the elephant
		ISAT	7	1	; bugle in limbo room (inside elephant)
		MESSAGE	94		; gives a trumpet noise
		DONE

SQUEE	ELEPH	CARRIED	6		; the elephant
		MESSAGE	69		; dull sound
		DONE

SQUEE	DUCK	CARRIED	10		; a rubber duck
		MESSAGE	71		; quack
		DONE

DETAC	BULB	LET	34	56	; 56 -> bottle
DETAC	BOTTLE	CARRIED	8		; the perfume bottle
		ISAT	9	252	; bulb attached
		MESSAGE	79		; You take the bulb apart
		CREATE	9		; create bulb
		GET	9		; take it
		DONE

TAKE	BULB	PREP	APART		; so that "take bulb apart" works
		CARRIED	8		; the perfume bottle
		ISAT	9	252	; bulb attached
		MESSAGE	79		; You take the bulb apart
		CREATE	9		; create bulb
		NEWLINE
		GET	9		; take it
		DONE

ATTAC	BULB	NOUN2	BUGLE
		CARRIED	7		; bugle
		CARRIED	9		; bulb
		PLACE	9	1	; no more bulb
		MESSAGE	88		; you do it
		DONE

PLAY	BUGLE	CARRIED	7		; the bugle
		ISNOTAT	9	1	; not with the rubber bulb attached
		MESSAGE	87		; sharp high-pitched sound
		DONE	

CUT	ELEPH	CARRIED	13		; box cutter
		CARRIED	6		; elephant
		ZERO	71		; not cut
		CREATE	10		; rubber duck
		SET	71		; now it's open
		MESSAGE	67
		NEWLINE
		MESSAGE	68		; inform player
		DONE

CUT	ELEPH	CARRIED	13		; box cutter
		CARRIED	6		; elephant
		NOTZERO	72		; elephant sewn with bugle inside
		MESSAGE	96		; why destroy it?
		DONE

GIVE	DOLL	NOUN2	BIRD		; end of mission one
		AT	8		; santa's office	
		CARRIED	11		; the doll
		NOTZERO	64		; eye fixed
		DESTROY	11		; the bird has it now
		SET	65		; bird is away
		LET	67	1	; We move on to Prancer's quest
		CLEAR	Turns		; 10 turns break
		CLEAR	Turns+1		; 10 turns break
		PLUS	100	3	; +poäng
                PROCESS 11              ; update status window
		MESSAGE	58		; bird flies off thought the window
		DONE

GIVE	DOLL	NOUN2	BIRD
		AT	8		; santa's office	
		CARRIED	11
		ZERO	64		; eye not fixed
		MESSAGE	57		; bird does not want it
		DONE

GIVE	FLASK	NOUN2	BIRD		; secret mission
		AT	8		; santa's office	
		EQ	65	2	; bird waiting inside
		CARRIED	12		; cognac
		SET	65		; send bird away
		CLEAR	Turns		; 10 turns break
		DESTROY	12		; no more cognac
		PLUS	100	2	; +poäng
                PROCESS 11              ; update status window
		MESSAGE	58		; bird flies off thought the window
		DONE

GIVE	ELEPH	NOUN2	BIRD		; elephant
		AT	8		; santa's office
		EQ	65	2	; bird waiting inside
		CARRIED	6		; elephant
		NOTZERO	72		; sewn with bugle
		CLEAR	Turns		; 10 turns break
		PLACE	6	1	; put elephant in limbo room
		SET	65		; send bird away
		LET	67	2	; move to Santa phase
		PLUS	100	3	; +poäng
		PROCESS	11		; update status window
		MESSAGE	58		; bird flies off thought the window
		DONE

GIVE	_	NOUN2	BIRD
		AT	8		; santa's office	
		EQ	65	2	; bird waiting inside
		MESSAGE	57		; bird does not want it
		DONE

GIVE	_	MESSAGE	70		; Nobody wants that
		DONE

GET	NOTE	ADJECT2	DANCER
		PRESENT	4
		GET	4
		DONE
GET	NOTE	ADJECT2	PRANCER
		PRESENT	5
		GET	5
		DONE

GET	NOTE	ADJECT2	SANTA
		PRESENT	14
		GET	14
		DONE

GET	DUCK	AT	6		; bathroom
		ISAT	10	1	; in bath tube
		MES	74		; duck swimming happily
		MESSAGE	76		; why do it?
		DONE

GET	LAMP	AT	9		; workshop
		MESSAGE	108		; mandatory reference
		DONE

GET     ALL     DOALL   HERE
GET     _       AUTOG
                DONE

PUT	DUCK	NOUN2	TUB
		PLACE	10	1	; move duck to limbo room
		PLUS	100	2	; +poäng
                PROCESS 11              ; update status window
		MESSAGE	73
		DONE

PUT	BUGLE	NOUN2	ELEPH
		MESSAGE	93		; You put the bugle inside the body of the toy elephant.
		PLACE	7	1	; move bugle to limbo room
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

ABOUT	_	MESSAGE	0
		DONE

DRINK	COGNAC	PRESENT	12
		ZERO	70		; not yet tasted
		SET	70		; just this once
		MESSAGE	64
		DONE

DRINK	COGNAC	PRESENT	12
		MESSAGE	65		; enough
		DONE

HELP	_	MESSAGE	105		; some help
		DONE

WAIT	_	MESSAGE	103		; Time passes..
		DONE

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
;		PAPER	2
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
		SET	65		; Bird begins away
;		LET	67	1	; start directly on second quest
                GOTO    7               ; Main game starts in the living room

;------------------------------------------------------------------------------
/PRO 7 ; Examine stuff

_	LAMP	AT	9		; workshop
		MESSAGE	107		; pleasant and warm light
		DONE

_	RUG	AT	7		; living room
		MESSAGE	106		; anchored
		DONE

_	BUGLE	PRESENT	7		; the bugle
		ISAT	9	1	; rubber bulb in limbo room
		MES	86		; small
		SPACE
		MESSAGE	89		; bulb attached
		DONE

_	BUGLE	PRESENT	7		; the bugle
		MESSAGE	86		; small
		DONE

_	CRATE	AT	12		; storage room
		ISAT	7	252	; bugle does not exist
		MESSAGE	84		; crate description
		NEWLINE
		MESSAGE	85		; notice a toy in good condition
		CREATE	7		; toy bugle
		DONE

_	CRATE	AT	12		; storage room
		MESSAGE	84		; crate description
		DONE

_	BULB	PRESENT	9		; the bulb
		MESSAGE	80		; dried and cracked
		DONE

_	BULB	CARRIED	8		; if it's in the perfume bottle
		ISAT	9	252	; 
		MESSAGE	80		; dried and cracked
		DONE

_	PERFU	PRESENT	8		; bottle of perfume
		ISAT	9	252	; with rubber bulb on place
		MES 77			; bottle of perfume almost empty	
		SPACE
		MESSAGE	78
		DONE

_	PERFU	PRESENT	8		; bottle of perfume
		MESSAGE	77		; bottle of perfume almost empty
		DONE

_	DUCK	PRESENT	10		; duck
		MESSAGE	75		; yellow and cute
		DONE

_	DUCK	ISAT	10	1	; rubber duck in tub?
		AT	6		; bathroom
		MESSAGE	75
		DONE

_	TUB	AT	6		; bathroom
		ISAT	10	1	; rubber duck in tub?
		MESSAGE	72		; water clean
		NEWLINE
		MESSAGE	74		; rubber duck swims
		DONE

_	TUB	AT	6		; bathroom
		MESSAGE	72		; water clean
		DONE

_	FLASK	PRESENT	12		; flask of cognac
		MESSAGE	63		; Santa's favourite cognac.
		DONE

_	BUTTO	PRESENT	0
		MESSAGE	13
		DONE

_	NEEDL	PRESENT	1		; needle
		MESSAGE	14		; a sewing needle
		ISAT	2	252
		NEWLINE
		MESSAGE	19		; needle is threaded
		DONE

_	STRAN	PRESENT	2
		MESSAGE	15
		DONE

_	SPECT	PRESENT	3
		MESSAGE	16
		DONE

_	WORKB	AT	9
		ISAT	1	252	; the needle won't disappear
		MESSAGE	21		; but the thread will
		NEWLINE
		MESSAGE	22
		CREATE	1		; needle
		CREATE	2		; thread
		DONE

_	WORKB	AT	9
		MESSAGE	21
		DONE

_	MIRRO	AT	6		; at the bathroom
		MESSAGE	29		; reflection looks at you
		DONE

_	SHELF	AT	6		; at the bathroom
		ISAT	3	252	; spectacles not created
		MES	26
		SPACE
		MESSAGE	27
		CREATE	3
		DONE

_	SHELF	AT	6		; at the bathroom
		MESSAGE	26
		DONE

_	CUPBO	PREP	IN		; inside the cupboard
		AT	11		; spare parts room
		NOTZERO	68		; opened?
		ZERO	69		; Note from Dancer not read yet?
		MESSAGE	48		; not right now
		DONE

_	CUPBO	PREP	IN		; inside the cupboard
		AT	11		; spare parts room
		NOTZERO	68		; opened?
		NOTZERO	69		; Note from Dancer read?
		ISAT	0	252	; button not created yet
		CREATE	0		; create the button/eye
		MESSAGE	49		; you see something round and black
		DONE

_	CUPBO	PREP	IN		; inside the cupboard
		AT	11		; spare parts room
		ISNOTAT	0	252	; the button has been created
		MESSAGE	48		; back to the messy cupboard
		DONE

_	CUPBO	AT	11		; spare parts room
		MESSAGE	45		; emergency spare kit cupboard
		DONE

_	WALL	AT	11		; spare parts room
		DESC	11
		NEWLINE
		DONE

_	DOLL	PRESENT	11		; the doll
		ZERO	64		; missing button
		MES	30		; doll made from scraps of fabrics
		SPACE
		MESSAGE	31		; missing eye
		DONE

_	DOLL	PRESENT	11		; the doll
		MES	30		; doll made from scraps of fabrics
		SPACE
		MESSAGE	54		; doll has two eyes
		DONE

_	NOTE	ADJECT2	DANCE		; note from dancer the reindeer
		PRESENT	4
		SET	69		; mark the note as read, so the button appears
		MESSAGE	17	
		DONE

_	NOTE	ADJECT2	PRANC		; note from prancer the reindeer
		PRESENT	5
		MESSAGE	18	
		DONE

_	NOTE	ADJECT2	SANTA		; note from Santa himself
		PRESENT	14
		PLUS	100	2	; +poäng
                PROCESS 11              ; update status window
		MESSAGE	1		; thank-you letter
		END

_	NOTE	MESSAGE	44		; we need to know which note
		DONE

_	BIRD	AT	8		; santa's office
		EQ	65	1	; bird waiting outside
		MESSAGE	40		; you see something birdy
		DONE

_	BIRD	AT	8		; santa's office
		EQ	65	2	; bird waiting inside
		ZERO	67		; Dancer's quest
		ISAT	4	252	; note does not exist
		CREATE	4		; create it
		CREATE	11		; create the rag doll as well
		MESSAGE	41		; bird on errand
		NEWLINE
		MESSAGE	43		; bird carrying note and doll
		DONE

_	BIRD	AT	8		; santa's office
		EQ	65	2	; bird waiting inside
		EQ	67	1	; Prancer's quest
		ISAT	5	252	; note does not exist
		CREATE	5		; create it
		CREATE	6		; create the toy elephant
		MESSAGE	41		; bird on errand
		NEWLINE
		MESSAGE	59		; bird carrying note and stuffed elephant
		DONE

_	BIRD	AT	8		; santa's office
		EQ	65	2	; bird waiting inside
		EQ	67	2	; Santa's quest
		ISAT	14	252	; note does not exist
		CREATE	14		; create it
		MESSAGE	41		; bird on errand
		NEWLINE
		MESSAGE	97		; bird carrying note
		DONE

_	BIRD	AT	8		; santa's office
		EQ	65	2	; bird waiting inside
		MESSAGE	41		; "bird came on a special errand!"
		DONE

;_	BIRD	DONE			; no "nothing of interest" message

_	ELEPH	PRESENT	6		; the elephant
		ISAT	7	1	; bugle in limbo room
		ZERO	72		; not sewn
		MESSAGE	90		; ripped open
		SPACE
		MESSAGE	92		; tiny bugle with a bulb inside
		DONE

_	ELEPH	PRESENT	6		; the elephant
		ISNOTAT	10	252	; duck not created, therefore ripped open
		ZERO	72		; not sewn
		MES	90		; ripped open
		SPACE
		MESSAGE	91		; hollow space inside
		DONE

_	ELEPH	PRESENT	6		; the elephant
		MESSAGE	61		; soft and squeezeable
		DONE

_	CUTTE	PRESENT	13		; is the box cutter there?
		MESSAGE	66		; very convenient
		DONE

_	_	MESSAGE	28		; nothing of interest
		DONE
;------------------------------------------------------------------------------
/PRO 8 ; Thread the needle

_	_	CARRIED	1		; needle
		CARRIED	2		; sewing strand
		WORN	3		; spectacles
		AT	9		; at the workbench room
		MESSAGE	20		; you do it
		DESTROY	2
		DONE

_	_	CARRIED	1		; needle
		CARRIED	2		; sewing strand
		AT	9		; at the workbench room
		MESSAGE	24		; bad sight
		DONE

_	_	CARRIED	1		; needle
		CARRIED	2		; sewing strand
		NOTAT	9		; not at the workbench room
		MESSAGE	23		; bad sight
		DONE

_	_	CARRIED	1		; needle
		NOTCARR	2		; sewing strand
		MESSAGE	25		; you're missing something

_	_	NOTDONE			; can't do that

;------------------------------------------------------------------------------
/PRO 9 ; The bird

; Flag 65 used as follows: 0 (bird is coming/not with Santa) 1 (bird waiting outside)
;			   2 (bird waiting inside) 255 (bird is away)
; Flag 66 used as follows: 0 (window is closed) 255 (window is open)

_	_	EQ	65	255	; Bird away?
		GT	Turns	10	; allow some quiet initial exploring
		CHANCE	20		; Give our helper a bit of a rest
		CLEAR	65		; bird is coming!

_	_	ZERO	65		; is the bird coming / already with us?
		ZERO	66		; is the window closed?
		LET	65	1	; Bird waiting outside

_	_	EQ	65	1	; bird waiting outside?
		GT	Turns	10	; allow some quiet initial exploring
		NOTAT	8		; we can see in the description, no need to repeat
		CHANCE	60		; message appears oftenish
		NEWLINE
		MESSAGE	34		; you hear something/one tapping window

_	_	LT	65	2	; bird coming or waiting outside?
		NOTZERO	66		; is the window open?
		EQ	38	8	; is the player at Santa's office
		LET	65	2	; move the bird inside
		NEWLINE
		MESSAGE	36		; a bird lands on the desk

_	_	LT	65	2	; bird coming or waiting outside?
		NOTZERO	66		; is the window open?
		NOTEQ	38	8	; is the player not at Santa's office
		LET	65	2	; move the bird inside
		NEWLINE
		MESSAGE	100		; you hear a bird chirping
;------------------------------------------------------------------------------
/PRO 10 ; sewing time

_	_	NOTAT	9		; at the workshop?
		MESSAGE	23		; eyes need better lightning
		DONE

_	_	NOTWORN	3		; not wearing the spectacles?
		MESSAGE	24		; poor sight
		DONE

_	BUTTON	AT	9		; at the workshop
		CARRIED	0		; button
		CARRIED	1		; needle
		CARRIED	11		; rag doll
		ISAT	2	252	; thread does not exist therefore the needle is threaded
		MESSAGE	53		; You sew the button
		DESTROY	0		; no more button
		SET	64		; eye fixed
		DONE

_	BUTTON	AT	9
                CARRIED 0               ; button
                CARRIED 1               ; needle
                CARRIED 11              ; rag doll
		MESSAGE	99		; skip class?
		DONE

_	ELEPH	AT	9		; at the workshop
		CARRIED	6		; elephant
		CARRIED	1		; needle
		NOTZERO	71		; elephant is open
		ZERO	72		; not sewn up back 
		ISNOTAT	7	1	; trompet not in limbo room (not inside elephant)
		MESSAGE	98		; elephant not ready
		DONE

_	ELEPH	AT	9		; at the workshop
		ISAT	7	1	; trumpet to limbo room
		SET	72		; now sewn up
		MESSAGE	95		; you sew the elephant back up
		DONE	
		
;_	_	MESSAGE	99		; not in sewing class
;		DONE
;------------------------------------------------------------------------------
/PRO 11 ; print status

_       _       WINDOW  2
                CLS 
                MES     [38]
#if SPE
                PRINTAT 0 31
#endif
#if CBM64
                PRINTAT 0 30
#endif
#if PC
                PRINTAT 0 43
#endif
                MES     102
                PRINT   100             ; score
                MES     101
		WINDOW	1
