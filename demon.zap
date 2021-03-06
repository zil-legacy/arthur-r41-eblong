

	.FUNCT	RT-RM-DEMON-HALL:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	FSET	CH-DEMON,FL-SEEN
	FSET	TH-DEMON-THRONE,FL-SEEN
	FSET	TH-LEFT-MANACLE,FL-SEEN
	FSET	TH-RIGHT-MANACLE,FL-SEEN
	FSET	TH-MANACLES,FL-SEEN
	FSET	TH-FLEECE,FL-SEEN
	FSET	TH-GOLD-KEY,FL-SEEN
	PRINTI	"You "
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in"
	JUMP	?CND4
?CCL6:	PRINTI	"have entered"
?CND4:	PRINTI	" a long, narrow banqueting hall that is panelled in dark oak. High above you, the walls are lined with the shields of vanquished knights. At the far end "
	EQUAL?	CONTEXT,M-F-LOOK \?CCL9
	PRINTI	"is a golden throne, upon which sits a beautiful girl. As you walk the length of the hall, you see that the girl's wrists are manacled to the throne, and that she is sitting on a Golden Fleece."
	JUMP	?CND7
?CCL9:	PRINTI	"of the hall, a "
	FSET?	CH-DEMON,FL-LOCKED \?CCL12
	PRINTI	"beautiful girl"
	JUMP	?CND10
?CCL12:	PRINTI	"hideous demon"
?CND10:	PRINTI	" is sitting on"
	IN?	TH-FLEECE,TH-DEMON-THRONE \?CND13
	ICALL	RT-PRINT-OBJ,TH-FLEECE,K-ART-A
	PRINTI	", which covers"
?CND13:	PRINTC	32
	FSET?	CH-DEMON,FL-LOCKED \?CCL17
	PRINTI	"her"
	JUMP	?CND15
?CCL17:	PRINTI	"his"
?CND15:	PRINTI	" throne. "
	FSET?	CH-DEMON,FL-LOCKED \?CCL20
	PRINTI	"Her"
	JUMP	?CND18
?CCL20:	PRINTI	"His"
?CND18:	PRINTC	32
	FSET?	TH-LEFT-MANACLE,FL-OPEN /?CTR22
	FSET?	TH-RIGHT-MANACLE,FL-OPEN \?CCL23
?CTR22:	FSET?	TH-LEFT-MANACLE,FL-OPEN \?CCL28
	PRINTI	"right "
	JUMP	?CND26
?CCL28:	PRINTI	"left "
?CND26:	PRINTI	"hand is"
	JUMP	?CND21
?CCL23:	PRINTI	"hands are"
?CND21:	PRINTI	" manacled to"
	ICALL	RT-PRINT-OBJ,TH-DEMON-THRONE,K-ART-THE
	PRINTC	46
	IN?	TH-GOLD-KEY,CH-GIRL /?CCL30
	IN?	TH-GOLD-KEY,CH-DEMON \?CND7
?CCL30:	PRINTI	" A golden key hangs around "
	FSET?	CH-DEMON,FL-LOCKED \?CCL35
	PRINTI	"her"
	JUMP	?CND33
?CCL35:	PRINTI	"his"
?CND33:	PRINTI	" neck."
?CND7:	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL37
	FSET?	CH-DEMON,FL-LOCKED \?CCL40
	SET	'GL-PICTURE-NUM,K-PIC-GIRL
	JUMP	?CND38
?CCL40:	SET	'GL-PICTURE-NUM,K-PIC-DEMON
?CND38:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL37:	EQUAL?	CONTEXT,M-ENTERED \?CCL44
	FSET?	CH-DEMON,FL-LOCKED \?CCL47
	FSET?	CH-GIRL,FL-LOCKED \?CCL50
	FCLEAR	CH-GIRL,FL-LOCKED
	PRINTR	"
The girl's image seems to shimmer for a second, and then she says, ""Oh kind sir, I have been imprisoned by the evil demon who rules this place. But if you release me, I will keep you by my side evermore."""
?CCL50:	PRINTR	"
The girl smiles at you demurely and says, ""Thank goodness you've returned! Won't you please remove these unmaidenly manacles so that we might be together for always?"""
?CCL47:	CALL1	RT-DEMON-OFFER-MSG
	RSTACK	
?CCL44:	EQUAL?	CONTEXT,M-EXIT \?CCL52
	FSET?	CH-DEMON,FL-LOCKED \?CND53
	PRINTI	"The girl calls out after you, ""Oh prithee, sir! Please do not abandon me to this cruel fate!""

"
?CND53:	FSET?	LG-HOT-DOOR,FL-OPEN \FALSE
	FCLEAR	LG-HOT-DOOR,FL-OPEN
	ICALL	RT-PRINT-OBJ,LG-HOT-DOOR,K-ART-THE,TRUE-VALUE
	PRINTI	" swings shut behind you with an ominous ""clank.""

"
	RFALSE	
?CCL52:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-PS-DEMON-SHIELDS:ANY:0:3,CONTEXT,ART,CAP?
	EQUAL?	CONTEXT,M-OBJDESC \?CCL3
	FSET	PSEUDO-OBJECT,FL-PLURAL
	FCLEAR	PSEUDO-OBJECT,FL-VOWEL
	ZERO?	ART /?CND4
	ICALL	PRINT-ARTICLE,PSEUDO-OBJECT,ART,CAP?
?CND4:	EQUAL?	ART,FALSE-VALUE,K-ART-THE,K-ART-A /?CCL8
	EQUAL?	ART,K-ART-ANY \FALSE
?CCL8:	ZERO?	ART /?CND11
	PRINTC	32
?CND11:	PRINTI	"shields"
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?LOOK-ON,V?LOOK-IN,V?EXAMINE \?CCL14
	ICALL2	THIS-IS-IT,PSEUDO-OBJECT
	PRINTR	"The shields are trophies of the demon's past conquests."
?CCL14:	CALL1	TOUCH-VERB?
	ZERO?	STACK /FALSE
	ICALL2	THIS-IS-IT,PSEUDO-OBJECT
	PRINTR	"The shields are too high to reach."


	.FUNCT	RT-CH-GIRL:ANY:0:3,CONTEXT,ART,CAP?
	EQUAL?	CONTEXT,M-WINNER,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?HELLO \?CCL3
	PRINTR	"The girl flutters her eyelashes demurely. ""Greetings, kind sir."""
?CCL3:	EQUAL?	CONTEXT,M-WINNER \?CCL7
	EQUAL?	PRSA,V?TELL-ABOUT \?CCL10
	EQUAL?	PRSO,CH-PLAYER /FALSE
?CCL10:	PRINTR	"""If you will but release me from these cruel manacles, I shall do whatever you wish."""
?CCL7:	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI /?CCL16
	EQUAL?	PRSA,V?SHOW \?CCL19
	EQUAL?	PRSO,TH-GOLD-KEY \?CCL19
	PRINTR	"The girl inclines her head towards the manacles and says, ""If you would be so kind...."""
?CCL19:	EQUAL?	PRSA,V?GIVE \FALSE
	EQUAL?	PRSO,TH-GOLD-KEY \FALSE
	FSET?	TH-LEFT-MANACLE,FL-OPEN /?CTR27
	FSET?	TH-RIGHT-MANACLE,FL-OPEN \?CCL28
?CTR27:	CALL2	RT-FREE-DEMON-MSG,TRUE-VALUE
	RSTACK	
?CCL28:	PRINTR	"The girl refuses your offer and cries, ""Oh why do you torment me so? To put a key into a hand that is manacled is surely the cruelest of jests."""
?CCL16:	EQUAL?	PRSA,V?TELL \?CCL32
	ZERO?	P-CONT \FALSE
?CCL32:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL36
	CALL	NOUN-USED?,PRSI,W?TEETH
	ZERO?	STACK /?CCL39
	CALL1	RT-DEMON-OFFER-MSG
	RSTACK	
?CCL39:	EQUAL?	PRSI,CH-DEMON \?CCL41
	PRINTR	"""He hath imprisoned me most cruelly."""
?CCL41:	EQUAL?	PRSI,TH-GOLD-KEY \?CCL43
	PRINTR	"""It is the key that will unlock these cruel manacles."""
?CCL43:	EQUAL?	PRSI,CH-MERLIN \?CCL45
	PRINTR	"The girl's eyes flash with anger. ""Are you going to help me or not?"""
?CCL45:	EQUAL?	PRSI,CH-LOT \?CCL47
	PRINTR	"""I have not met him."" She lowers her eyes demurely and continues, ""But surely he cannot be as handsome as you."""
?CCL47:	PRINTR	"She looks at you imploringly and says, ""If you would but release me, I will tell you all I know."""
?CCL36:	EQUAL?	PRSA,V?ASK-FOR \?CCL49
	PRINTR	"She looks at you imploringly and says, ""I will give you whatever you wish, if you would only unlock these cruel manacles."""
?CCL49:	EQUAL?	PRSA,V?ATTACK \?CCL51
	CALL1	RT-DEMON-OFFER-MSG
	RSTACK	
?CCL51:	EQUAL?	PRSA,V?EXAMINE \?CCL53
	FSET	CH-GIRL,FL-SEEN
	PRINTI	"The girl is sitting on"
	IN?	TH-FLEECE,TH-DEMON-THRONE \?CND54
	ICALL	RT-PRINT-OBJ,TH-FLEECE,K-ART-A
	PRINTI	", which covers"
?CND54:	PRINTI	" her throne. Her "
	FSET?	TH-LEFT-MANACLE,FL-OPEN \?CCL58
	PRINTI	"left hand is"
	JUMP	?CND56
?CCL58:	FSET?	TH-RIGHT-MANACLE,FL-OPEN \?CCL60
	PRINTI	"right hand is"
	JUMP	?CND56
?CCL60:	PRINTI	"hands are"
?CND56:	PRINTI	" manacled to the arms of the throne."
	IN?	TH-GOLD-KEY,CH-GIRL \?CND61
	PRINTI	" A golden key hangs around her neck."
?CND61:	PRINTR	"

As you look at her, her image seems to shimmer slightly."
?CCL53:	EQUAL?	PRSA,V?KISS \?CCL64
	PRINTR	"As you approach, her lips part to meet yours and you see that her teeth are pointed. At the last second, you pull away."
?CCL64:	EQUAL?	PRSA,V?RELEASE \FALSE
	IN?	TH-GOLD-KEY,WINNER \?CCL69
	CALL1	RT-FREE-DEMON-MSG
	RSTACK	
?CCL69:	SET	'CLOCK-WAIT,TRUE-VALUE
	CALL2	RT-AUTHOR-MSG,K-HOW-INTEND-MSG
	RSTACK	


	.FUNCT	RT-CH-DEMON:ANY:0:3,CONTEXT,ART,CAP?
	EQUAL?	CONTEXT,M-WINNER,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?HELLO \?CCL3
	FSET?	CH-DEMON,FL-LOCKED \?CCL8
	CALL1	RT-DEMON-OFFER-MSG
	RSTACK	
?CCL8:	PRINTR	"""Hello yourself!"" the demon roars. ""Now open these manacles!"""
?CCL3:	EQUAL?	CONTEXT,M-WINNER \?CCL10
	FSET?	CH-DEMON,FL-LOCKED \?CCL13
	CALL1	RT-DEMON-OFFER-MSG
	RSTACK	
?CCL13:	EQUAL?	PRSA,V?TELL-ABOUT \?CCL15
	EQUAL?	PRSO,CH-PLAYER /FALSE
?CCL15:	PRINTR	"""Open these manacles and I'll do whatever you want."""
?CCL10:	ZERO?	CONTEXT \FALSE
	FSET?	CH-DEMON,FL-LOCKED \?CCL21
	EQUAL?	HERE,RM-DEMON-HALL \?CCL21
	ZERO?	NOW-PRSI /?CCL27
	PUSH	2
	JUMP	?CND25
?CCL27:	PUSH	1
?CND25:	CALL2	EVERYWHERE-VERB?,STACK
	ZERO?	STACK \?CCL21
	ICALL1	RT-DEMON-OFFER-MSG
	EQUAL?	PRSA,V?TELL \TRUE
	ZERO?	P-CONT /TRUE
	RETURN	2
?CCL21:	ZERO?	NOW-PRSI /?CCL36
	EQUAL?	PRSA,V?SHOW \?CCL39
	EQUAL?	PRSO,TH-GOLD-KEY \?CCL39
	PRINTR	"The demon roars in anguish, ""Stop tormenting me and open these damnable manacles!"""
?CCL39:	EQUAL?	PRSA,V?GIVE \FALSE
	EQUAL?	PRSO,TH-GOLD-KEY \FALSE
	FSET?	TH-LEFT-MANACLE,FL-OPEN /?CTR47
	FSET?	TH-RIGHT-MANACLE,FL-OPEN \?CCL48
?CTR47:	CALL2	RT-FREE-DEMON-MSG,TRUE-VALUE
	RSTACK	
?CCL48:	PRINTR	"The demon screams at you. ""Idiot! What good does the key do me when my hands are manacled? Unlock the manacles, moron!"""
?CCL36:	EQUAL?	PRSA,V?TELL \?CCL52
	ZERO?	P-CONT \FALSE
?CCL52:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL56
	EQUAL?	PRSI,CH-DEMON \?CCL59
	PRINTR	"""I am the glorious epitome of all that is evil."""
?CCL59:	EQUAL?	PRSI,TH-GOLD-KEY \?CCL61
	PRINTR	"""It is the key that will unlock these accursed manacles."""
?CCL61:	EQUAL?	PRSI,TH-LEFT-MANACLE,TH-RIGHT-MANACLE,TH-MANACLES \?CCL63
	PRINTR	"""They were fastened upon me by Merlin's gods. Then they hung that damned key about my neck to further torment me."""
?CCL63:	EQUAL?	PRSI,TH-FLEECE \?CCL65
	PRINTR	"""I have already given you the fleece. Now release me!"""
?CCL65:	EQUAL?	PRSI,CH-MERLIN \?CCL67
	PRINTR	"""He is nothing but a third rate conjurer. His days are numbered."""
?CCL67:	EQUAL?	PRSI,CH-LOT \?CCL69
	PRINTR	"""Yes, yes. I'll kill him for you. I'll chain him to a rock and have rats gnaw at his liver; or perhaps I'll roast him slowly on a spit over red-hot coals. But first you must release me."""
?CCL69:	PRINTR	"""Enough of this chatter. Release me!"""
?CCL56:	EQUAL?	PRSA,V?ATTACK \?CCL71
	PRINTR	"You feel a jolt of electricity pass through your body and the demon cackles, ""Fool! You can't hurt me!"""
?CCL71:	EQUAL?	PRSA,V?EXAMINE \?CCL73
	FSET	CH-DEMON,FL-SEEN
	PRINTI	"The hideously ugly demon is sitting on"
	IN?	TH-FLEECE,TH-DEMON-THRONE \?CND74
	ICALL	RT-PRINT-OBJ,TH-FLEECE,K-ART-A
	PRINTI	", which covers"
?CND74:	PRINTI	" his throne. His "
	FSET?	TH-LEFT-MANACLE,FL-OPEN \?CCL78
	PRINTI	"left hand is"
	JUMP	?CND76
?CCL78:	FSET?	TH-RIGHT-MANACLE,FL-OPEN \?CCL80
	PRINTI	"right hand is"
	JUMP	?CND76
?CCL80:	PRINTI	"hands are"
?CND76:	PRINTI	" manacled to the arms of the throne."
	IN?	TH-GOLD-KEY,CH-DEMON \?CND81
	PRINTI	" A golden key hangs around his neck."
?CND81:	PRINTR	" He leers at you through his obscene red eyes."
?CCL73:	EQUAL?	PRSA,V?KISS \?CCL84
	PRINTI	"Ugh.
"
	CALL2	RT-AUTHOR-MSG,STR?343
	RSTACK	
?CCL84:	EQUAL?	PRSA,V?RELEASE \FALSE
	IN?	TH-GOLD-KEY,WINNER \?CCL89
	CALL1	RT-FREE-DEMON-MSG
	RSTACK	
?CCL89:	SET	'CLOCK-WAIT,TRUE-VALUE
	CALL2	RT-AUTHOR-MSG,K-HOW-INTEND-MSG
	RSTACK	


	.FUNCT	RT-DEMON-OFFER-MSG:ANY:0:0,OBJ,NXT
	FSET?	CH-DEMON,FL-LOCKED \?CCL3
	FCLEAR	CH-DEMON,FL-LOCKED
	IN?	TH-GOLD-KEY,CH-GIRL \?CND4
	MOVE	TH-GOLD-KEY,CH-DEMON
?CND4:	REMOVE	CH-GIRL
	PRINTI	"The girl's shimmering features dissolve into those of a hideously ugly demon who leers at you through obscene, red eyes. "
	SET	'GL-PICTURE-NUM,K-PIC-DEMON
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \?CCL8
	ICALL1	RT-UPDATE-DESC-WINDOW
	JUMP	?CND6
?CCL8:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \?CND6
	ICALL1	RT-UPDATE-PICT-WINDOW
?CND6:	FSET?	LG-HOT-DOOR,FL-OPEN \?CND10
	FCLEAR	LG-HOT-DOOR,FL-OPEN
	ICALL	RT-PRINT-OBJ,LG-HOT-DOOR,K-ART-THE,TRUE-VALUE
	PRINTI	" slams shut behind you with an ominous ""clank."" "
?CND10:	PRINTI	"""So, Arthur, you have seen through my little disguise. But as I am feeling generous, I shall make you a bargain. We each have something the other wants. I have"
	ICALL	RT-PRINT-OBJ,TH-FLEECE,K-ART-THE
	PRINTI	", without which you cannot claim your kingdom. You have the power to free me. I propose a trade.""

""Heed closely the words of my offer, for I will fulfill them to the letter. If you agree to unlock my "
	FSET?	TH-LEFT-MANACLE,FL-OPEN /?CTR13
	FSET?	TH-RIGHT-MANACLE,FL-OPEN \?CCL14
?CTR13:	PRINTI	"other manacle"
	JUMP	?CND12
?CCL14:	PRINTI	"manacles"
?CND12:	PRINTI	", I will give you"
	ICALL	RT-PRINT-OBJ,TH-FLEECE,K-ART-THE
	PRINTI	" and allow you to finish your quest unmolested.""

""Remember. If you agree, we will each be bound to the terms of the contract. If you accept my offer, and then fail to honour the contract to the letter, you will die a horribly painful death.""

""Do you accept my offer?""
"
	JUMP	?CND1
?CCL3:	PRINTI	"
The demon says, ""I see that you have returned. Do you accept my offer?""
"
?CND1:	CALL2	YES?,TRUE-VALUE
	ZERO?	STACK /?CCL19
	MOVE	TH-FLEECE,HERE
	FCLEAR	TH-FLEECE,FL-NO-DESC
	PRINTI	"The demon smiles with pleasure. He allows the fleece to slide onto"
	ICALL	RT-PRINT-OBJ,TH-GROUND,K-ART-THE
	PRINTI	". ""Proceed, then.""
"
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \TRUE
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	
?CCL19:	PRINTI	"The demon's face contorts in fury and he screams maniacally, ""Then BEGONE!"" "
	PRINT	K-DEMON-SCREAMS-MSG
	CRLF	
	CRLF	
	FIRST?	RM-DEMON-HALL >OBJ /?PRG23
?PRG23:	ZERO?	OBJ /?REP24
	NEXT?	OBJ >NXT /?BOGUS28
?BOGUS28:	EQUAL?	OBJ,TH-DEMON-THRONE,CH-PLAYER /?CND29
	MOVE	OBJ,RM-LEDGE
?CND29:	SET	'OBJ,NXT
	JUMP	?PRG23
?REP24:	ICALL	RT-GOTO,RM-LEDGE,TRUE-VALUE
	RTRUE	


	.FUNCT	RT-FREE-DEMON-MSG:ANY:0:1,DEMON?
	ZERO?	DEMON? /?CND1
	FSET?	CH-DEMON,FL-LOCKED \?CCL5
	ICALL	RT-PRINT-OBJ,CH-GIRL,K-ART-THE,TRUE-VALUE
	JUMP	?CND3
?CCL5:	ICALL	RT-PRINT-OBJ,CH-DEMON,K-ART-THE,TRUE-VALUE
?CND3:	PRINTI	" takes the key and unlocks the other manacle. "
?CND1:	IN?	TH-FLEECE,TH-DEMON-THRONE /?CCL8
	ZERO?	DEMON? /?CCL11
	PRINTI	"He"
	JUMP	?CND9
?CCL11:	PRINTI	"The demon"
?CND9:	PRINTI	" rises up and screams with crazed, triumphant laughter, ""Keep the fleece, you fool! Finish your ridiculous quest if you like. It will do you no good. For now I shall finally defeat those so-called gods of righteousness and their feeble prophet, Merlin.""

The demon suddenly dissolves into a cloud of grey smoke and streams out of the hall, leaving behind only the echo of his maniacal laughter. You are free to go, but when you realize the enormity of the evil you have unleashed on the world, you collapse to the floor, bereft of the will to move.
"
	JUMP	?CND6
?CCL8:	PRINTI	"As soon as the manacles are open, the "
	FSET?	CH-DEMON,FL-LOCKED \?CCL14
	PRINTI	"girl's features dissolve into those of a hideously evil demon who"
	JUMP	?CND12
?CCL14:	PRINTI	"demon"
?CND12:	PRINTI	" rises up and rubs his wrists, saying, ""Free at last!."" He stretches and then glances down, as if surprised to still see you there. ""Ah yes!"" he cackles, ""There is that small matter of the promise I made you. Let me see - I said I would keep you by my side for evermore. Well, I always keep my word."" He laughs and points at you. Electricity crackles from his fingertips and suddenly you find yourself stretched out on the floor next to him, in the form of a dog.
"
?CND6:	CALL1	RT-END-OF-GAME
	RSTACK	


	.FUNCT	RT-TH-GOLD-KEY:ANY:0:1,CONTEXT,L
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?TAKE \FALSE
	LOC	TH-GOLD-KEY >L
	EQUAL?	L,CH-DEMON,CH-GIRL \FALSE
	CALL2	RT-DO-TAKE,TH-GOLD-KEY
	ZERO?	STACK /FALSE
	ICALL2	THIS-IS-IT,TH-GOLD-KEY
	PRINTI	"You remove the key from"
	ICALL	RT-PRINT-OBJ,L,K-ART-THE
	PRINTI	"'s neck."
	CRLF	
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \?CCL13
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	
?CCL13:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \TRUE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RTRUE	


	.FUNCT	RT-TH-MANACLE:ANY:0:1,CONTEXT,OTHER,OBJ,NXT
	EQUAL?	PRSO,TH-LEFT-MANACLE \?CCL3
	SET	'OTHER,TH-RIGHT-MANACLE
	JUMP	?CND1
?CCL3:	SET	'OTHER,TH-LEFT-MANACLE
?CND1:	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?UNLOCK,V?OPEN \?CCL8
	EQUAL?	PRSI,FALSE-VALUE,TH-GOLD-KEY \FALSE
	IN?	TH-GOLD-KEY,WINNER \FALSE
	FSET?	PRSO,FL-OPEN \?CCL16
	CALL	RT-ALREADY-MSG,PRSO,STR?178
	RSTACK	
?CCL16:	FSET?	OTHER,FL-OPEN \?CCL18
	CALL1	RT-FREE-DEMON-MSG
	RSTACK	
?CCL18:	FCLEAR	PRSO,FL-LOCKED
	FSET	PRSO,FL-OPEN
	FSET?	CH-DEMON,FL-LOCKED /?CCL21
	FSET?	OTHER,FL-BROKEN \?CCL21
	FSET	CH-DEMON,FL-BROKEN
	REMOVE	TH-GHOSTS
	PRINTI	"You open"
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE
	PRINTI	". The demon catches on to your plan and screams at you in fury. ""Trapped! Trapped by my own words. You have won this round, Arthur, but the final victory shall yet be mine, for I now lay a triple curse upon your head.""

""You may gain the throne of England, but you shall gain no solace from it. Your wife shall be barren, you shall be betrayed by your best friend, and you shall die at the hand of your own son. Thus have I thrice cursed you.""

""Now BEGONE!"""
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \?CCL26
	CRLF	
	INPUT	1,300,RT-STOP-READ
	SCREEN	7
	CLEAR	7
	ICALL2	RT-CENTER-PIC,K-PIC-ANGRY-DEMON
	CURSET	-1
	INPUT	1,100,RT-STOP-READ
	CURSET	-2
	SCREEN	0
	SET	'GL-PICTURE-NUM,K-PIC-DRAGON-OUT
	ICALL2	V-$REFRESH,FALSE-VALUE
	JUMP	?CND24
?CCL26:	PRINTC	32
?CND24:	PRINT	K-DEMON-SCREAMS-MSG
	PRINTI	" The force of the blast dislodges the stones on the mountainside above the cave entrance, and they fall down and seal off the mouth of the cave.

"
	FIRST?	RM-DEMON-HALL >OBJ /?PRG28
?PRG28:	ZERO?	OBJ /?REP29
	NEXT?	OBJ >NXT /?BOGUS33
?BOGUS33:	EQUAL?	OBJ,TH-DEMON-THRONE,CH-PLAYER /?CND34
	MOVE	OBJ,RM-LEDGE
?CND34:	SET	'OBJ,NXT
	JUMP	?PRG28
?REP29:	ICALL	RT-GOTO,RM-LEDGE,TRUE-VALUE
	CALL	RT-SCORE-MSG,0,7,10,5
	RSTACK	
?CCL21:	PRINTI	"You open"
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE
	PRINTI	". The "
	FSET?	CH-DEMON,FL-LOCKED \?CCL38
	PRINTI	"girl"
	JUMP	?CND36
?CCL38:	PRINTI	"demon"
?CND36:	PRINTI	" smiles.
"
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \TRUE
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	
?CCL8:	EQUAL?	PRSA,V?LOCK,V?CLOSE \?CCL42
	EQUAL?	PRSI,FALSE-VALUE,TH-GOLD-KEY \FALSE
	IN?	TH-GOLD-KEY,WINNER \FALSE
	FSET?	PRSO,FL-OPEN /?CCL50
	CALL	RT-ALREADY-MSG,PRSO,STR?161
	RSTACK	
?CCL50:	FCLEAR	PRSO,FL-OPEN
	FSET	PRSO,FL-LOCKED
	FSET?	CH-DEMON,FL-LOCKED /?CND51
	FSET	PRSO,FL-BROKEN
?CND51:	PRINTI	"You snap"
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE
	PRINTI	" shut. The smile vanishes from the "
	FSET?	CH-DEMON,FL-LOCKED \?CCL55
	PRINTI	"girl"
	JUMP	?CND53
?CCL55:	PRINTI	"demon"
?CND53:	PRINTI	"'s face.
"
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \TRUE
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	
?CCL42:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	PRSO,FL-SEEN
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE,TRUE-VALUE
	PRINTI	" is made of pure gold and is"
	ICALL2	RT-OPEN-MSG,PRSO
	PRINTR	"."


	.FUNCT	RT-TH-MANACLES:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	FSET	TH-MANACLES,FL-SEEN
	FSET	TH-LEFT-MANACLE,FL-SEEN
	FSET	TH-RIGHT-MANACLE,FL-SEEN
	ICALL	RT-PRINT-OBJ,TH-MANACLES,K-ART-THE,TRUE-VALUE,STR?69
	PRINTR	" made of pure gold."
?CCL5:	EQUAL?	PRSA,V?UNLOCK,V?OPEN \?CCL7
	EQUAL?	PRSI,FALSE-VALUE,TH-GOLD-KEY \?CCL10
	IN?	TH-GOLD-KEY,WINNER \?CCL10
	CALL1	RT-FREE-DEMON-MSG
	RSTACK	
?CCL10:	SET	'CLOCK-WAIT,TRUE-VALUE
	CALL2	RT-AUTHOR-MSG,K-HOW-INTEND-MSG
	RSTACK	
?CCL7:	EQUAL?	PRSA,V?LOCK,V?CLOSE \FALSE
	FSET?	TH-LEFT-MANACLE,FL-OPEN \?CCL17
	CALL	RT-ALREADY-MSG,TH-RIGHT-MANACLE,STR?161
	RSTACK	
?CCL17:	FSET?	TH-RIGHT-MANACLE,FL-OPEN \?CCL19
	CALL	RT-ALREADY-MSG,TH-LEFT-MANACLE,STR?161
	RSTACK	
?CCL19:	CALL	RT-ALREADY-MSG,TH-MANACLES,STR?161
	RSTACK	


	.FUNCT	RT-TH-FLEECE:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?TAKE \FALSE
	IN?	TH-FLEECE,TH-DEMON-THRONE \FALSE
	FSET?	CH-DEMON,FL-LOCKED \FALSE
	PRINTR	"The girl looks at you with a tear in her eye. ""If you would only free me,"" she pleads, ""the fleece shall be yours."""


	.FUNCT	RT-TH-DEMON-THRONE:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	TH-DEMON-THRONE,FL-SEEN
	PRINTI	"It's a throne with"
	FSET?	CH-DEMON,FL-LOCKED \?CCL8
	ICALL	RT-PRINT-OBJ,CH-GIRL,K-ART-A
	JUMP	?CND6
?CCL8:	ICALL	RT-PRINT-OBJ,CH-DEMON,K-ART-A
?CND6:	PRINTR	" manacled to it."

	.ENDI
