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
;                       Nouns   <20 means can be used as verbs
;                               <50 means a proper noun ie not an 'IT'
I       14      noun
INVEN   14      noun
ALL     20      noun
LOT     20      noun
EVERY   20      noun
BIRD	21	noun
SOMEO	21	noun
SOMET	21	noun
;
BUTTO	50	noun		; A button
NEEDL	51	noun		; A needle
SPECT	52	noun		; A pair of spectacles
GLASS	52	noun		; A pair of spectacles
NOTE	53	noun		; different notes
ELEPH	54	noun		; toy elephant
TRUMP	55	noun		; toy trumpet
ATOMI	56	noun		; perfume atomizer
SQUEE	57	noun		; rubber squeezer
DUCK	58	noun		; a rubber duck
WORKB	59	noun		; workbench
COTTO	60	noun		; So we can thread the needle with a thread
STRAN	61	noun		; So we can thread the needle with a thread
MIRRO	62	noun		; the mirror
SHELF	63	noun		; the shelf
DOLL	64	noun		; the rag doll
WINDO	65	noun		; santa's window
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
Would you like another go? 
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
This note comes directly from Dancer the reindeer, and it says:


"One of the rag dolls came with a missing eye and Santa would
like to have it mended.


Please give it back to our feathered friend once you are done.


D."
/18
This note comes directly from Prancer the reindeer, and it says:

Santa is probably beginning to get drunk as none of us can see what is
wrong with this elephant.

Whatever it is, please have it fixed and give it back to our
feathered friend once you are done.

P.
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
You hear someone or something tapping at one of the windows.
/35
One of Santa's little bird messengers is waiting outside.
/36
A little bird enters through the opening and lands on the desk.
/37
You open the window just a little, and you get a nice breeze from the outside.
/38
It's already open.
/39
You close the window.
/40
You can barely make out something little and feathery outside the window.
/41
The little bird has come on a special errand from Santa!
/42
A little bird is sitting on the table.
/43
The bird is carrying a note and what looks like a doll.
/44
Which note do you mean?
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
A stuffed toy elephant
/7
A toy trumpet
/8
A perfume atomizer
/9
A rubber squeezer
/10
A rubber duck 
/11
A rag doll
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
/3
You are in a dimly lit corridor, leading north to the kitchen and south
to the living room. The corridor continues to the east.
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
/0      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    BUTTO  _
/1      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NEEDL  _
/2      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    STRAN  _
/3      252	1       _ Y  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    SPECT  _
/4      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   DANCE
/5      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    NOTE   PRANC
/6      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    ELEPH  _
/7      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    TRUMP  _
/8      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    ATOMI  _
/9      252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    SQUEE  _
/10     252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    DUCK   _
/11     252	1       _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _    DOLL   _
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

OPEN	WINDO	AT	8		; at santa's office
		ZERO	66		; window is closed
		SET	66		; open it
		MESSAGE	37		; tell it to player
		DONE

OPEN	WINDOW	AT	8		; at santa's office
		NOTZERO	66		; is it open?
		MESSAGE	38		; already open
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
		SET	65		; Bird begins away
                GOTO    2               ; Main game

;------------------------------------------------------------------------------
/PRO 7 ; Examine stuff

_	BUTTO	PRESENT	0
		MESSAGE	13
		DONE

_	NEEDL	PRESENT	1
		MESSAGE	14
		ISAT	2	252
		MESSAGE	19
		DONE

_	STRAN	PRESENT	2
		MESSAGE	15
		DONE

_	SPECT	PRESENT	3
		MESSAGE	16
		DONE

_	WORKB	AT	9
		ISAT	1	252		; the needle won't disappear
		MESSAGE	21			; but the thread will
		NEWLINE
		MESSAGE	22
		CREATE	1			; needle
		CREATE	2			; thread
		DONE

_	WORKB	AT	9
		MESSAGE	21
		DONE

_	MIRRO	AT	6			; at the bathroom
		MESSAGE	29			; reflection looks at you
		DONE

_	SHELF	AT	6			; at the bathroom
		ISAT	3	252		; spectacles not created
		MES	26
		SPACE
		MESSAGE	27
		CREATE	3
		DONE

_	SHELF	AT	6			; at the bathroom
		MESSAGE	26
		DONE

_	DOLL	PRESENT	11			; the doll
		MESSAGE	30
		ZERO	64			; missing button
		NEWLINE
		MESSAGE	31
		DONE

_	DOLL	PRESENT	11
		MESSAGE	30
		DONE

_	NOTE	ADJECT2	DANCE			; note from dancer the reindeer
		PRESENT	4
		MESSAGE	17	
		DONE

_	NOTE	ADJECT2	PRANC			; note from prancer the reindeer
		PRESENT	5
		MESSAGE	18	
		DONE

_	NOTE	MESSAGE	44			; we need to know which note
		DONE

_	BIRD	AT	8			; santa's office
		EQ	65	1		; bird waiting outside
		MESSAGE	40			; something birdy
		DONE

_	BIRD	AT	8			; santa's office
		EQ	65	2		; bird waiting inside
		MESSAGE	41			; "bird came on a special errand!"

_	BIRD	AT	8
		EQ	65	2		; bird waiting inside
		ZERO	67			; Dancer's quest
		ISAT	4	252		; note does not exist
		CREATE	4			; create it
		CREATE	11			; create the rag doll as well
		NEWLINE
		MESSAGE	43			; "The bird is carrying a note and what looks like a doll."
		DONE

_	BIRD	DONE				; no "nothing of interest" message

_	_	MESSAGE	28			; nothing of interest
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
		CHANCE	20		; Give our helper a bit of a rest
		CLEAR	65		; bird is coming!

_	_	ZERO	65		; is the bird coming / already with us?
		ZERO	66		; is the window closed?
		LET	65	1	; Bird waiting outside
		NEWLINE
		MESSAGE	34		; Let it be known

_	_	LT	65	2	; bird coming or waiting outside?
		NOTZERO	66		; is the window open?
		LET	65	2	; move the bird inside
		EQ	38	8	; is the player at Santa's office
		NEWLINE
		MESSAGE	36		; tell them

