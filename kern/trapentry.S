/* See COPYRIGHT for copyright information. */

#include <inc/mmu.h>
#include <inc/memlayout.h>
#include <inc/trap.h>

#include <kern/picirq.h>


###################################################################
# exceptions/interrupts
###################################################################

/* TRAPHANDLER defines a globally-visible function for handling a trap.
 * It pushes a trap number onto the stack, then jumps to _alltraps.
 * Use TRAPHANDLER for traps where the CPU automatically pushes an error code.
 *
 * You shouldn't call a TRAPHANDLER function from C, but you may
 * need to _declare_ one in C (for instance, to get a function pointer
 * during IDT setup).  You can declare the function with
 *   void NAME();
 * where NAME is the argument passed to TRAPHANDLER.
 */
#define TRAPHANDLER(name, num)						\
	.globl name;		/* define global symbol for 'name' */	\
	.type name, @function;	/* symbol type is function */		\
	.align 2;		/* align function definition */		\
	name:			/* function starts here */		\
	pushl $(num);							\
	jmp _alltraps

/* Use TRAPHANDLER_NOEC for traps where the CPU doesn't push an error code.
 * It pushes a 0 in place of the error code, so the trap frame has the same
 * format in either case.
 */
#define TRAPHANDLER_NOEC(name, num)					\
	.globl name;							\
	.type name, @function;						\
	.align 2;							\
	name:								\
	pushl $0;							\
	pushl $(num);							\
	jmp _alltraps

.text

/*
 * Lab 3: Your code here for generating entry points for the different traps.
 */

TRAPHANDLER_NOEC( hendler0, 0)
TRAPHANDLER_NOEC( hendler1, 1)
TRAPHANDLER_NOEC( hendler2, 2)
TRAPHANDLER_NOEC( hendler3, 3)
TRAPHANDLER_NOEC( hendler4, 4)
TRAPHANDLER_NOEC( hendler5, 5)
TRAPHANDLER_NOEC( hendler6, 6)
TRAPHANDLER_NOEC( hendler7, 7)
TRAPHANDLER( hendler8, 8)
TRAPHANDLER( hendler9, 9)
TRAPHANDLER( hendler10, 10)
TRAPHANDLER( hendler11, 11)
TRAPHANDLER( hendler12, 12)
TRAPHANDLER( hendler13, 13)
TRAPHANDLER( hendler14, 14)
TRAPHANDLER_NOEC( hendler15, 15)
TRAPHANDLER_NOEC( hendler16, 16)
TRAPHANDLER_NOEC( hendler17, 17)
TRAPHANDLER_NOEC( hendler18, 18)
TRAPHANDLER_NOEC( hendler19, 19)
TRAPHANDLER_NOEC( hendler20, 20)
TRAPHANDLER_NOEC( hendler21, 21)
TRAPHANDLER_NOEC( hendler22, 22)
TRAPHANDLER_NOEC( hendler23, 23)
TRAPHANDLER_NOEC( hendler24, 24)
TRAPHANDLER_NOEC( hendler25, 25)
TRAPHANDLER_NOEC( hendler26, 26)
TRAPHANDLER_NOEC( hendler27, 27)
TRAPHANDLER_NOEC( hendler28, 28)
TRAPHANDLER_NOEC( hendler29, 29)
TRAPHANDLER_NOEC( hendler30, 30)
TRAPHANDLER_NOEC( hendler31, 31)
TRAPHANDLER_NOEC( hendler32, 32)
TRAPHANDLER_NOEC( hendler33, 33)
TRAPHANDLER_NOEC( hendler34, 34)
TRAPHANDLER_NOEC( hendler35, 35)
TRAPHANDLER_NOEC( hendler36, 36)
TRAPHANDLER_NOEC( hendler37, 37)
TRAPHANDLER_NOEC( hendler38, 38)
TRAPHANDLER_NOEC( hendler39, 39)
TRAPHANDLER_NOEC( hendler40, 40)
TRAPHANDLER_NOEC( hendler41, 41)
TRAPHANDLER_NOEC( hendler42, 42)
TRAPHANDLER_NOEC( hendler43, 43)
TRAPHANDLER_NOEC( hendler44, 44)
TRAPHANDLER_NOEC( hendler45, 45)
TRAPHANDLER_NOEC( hendler46, 46)
TRAPHANDLER_NOEC( hendler47, 47)
TRAPHANDLER_NOEC( hendler48, 48)
TRAPHANDLER_NOEC( hendler49, 49)
TRAPHANDLER_NOEC( hendler50, 50)
TRAPHANDLER_NOEC( hendler51, 51)
TRAPHANDLER_NOEC( hendler52, 52)
TRAPHANDLER_NOEC( hendler53, 53)
TRAPHANDLER_NOEC( hendler54, 54)
TRAPHANDLER_NOEC( hendler55, 55)
TRAPHANDLER_NOEC( hendler56, 56)
TRAPHANDLER_NOEC( hendler57, 57)
TRAPHANDLER_NOEC( hendler58, 58)
TRAPHANDLER_NOEC( hendler59, 59)
TRAPHANDLER_NOEC( hendler60, 60)
TRAPHANDLER_NOEC( hendler61, 61)
TRAPHANDLER_NOEC( hendler62, 62)
TRAPHANDLER_NOEC( hendler63, 63)
TRAPHANDLER_NOEC( hendler64, 64)
TRAPHANDLER_NOEC( hendler65, 65)
TRAPHANDLER_NOEC( hendler66, 66)
TRAPHANDLER_NOEC( hendler67, 67)
TRAPHANDLER_NOEC( hendler68, 68)
TRAPHANDLER_NOEC( hendler69, 69)
TRAPHANDLER_NOEC( hendler70, 70)
TRAPHANDLER_NOEC( hendler71, 71)
TRAPHANDLER_NOEC( hendler72, 72)
TRAPHANDLER_NOEC( hendler73, 73)
TRAPHANDLER_NOEC( hendler74, 74)
TRAPHANDLER_NOEC( hendler75, 75)
TRAPHANDLER_NOEC( hendler76, 76)
TRAPHANDLER_NOEC( hendler77, 77)
TRAPHANDLER_NOEC( hendler78, 78)
TRAPHANDLER_NOEC( hendler79, 79)
TRAPHANDLER_NOEC( hendler80, 80)
TRAPHANDLER_NOEC( hendler81, 81)
TRAPHANDLER_NOEC( hendler82, 82)
TRAPHANDLER_NOEC( hendler83, 83)
TRAPHANDLER_NOEC( hendler84, 84)
TRAPHANDLER_NOEC( hendler85, 85)
TRAPHANDLER_NOEC( hendler86, 86)
TRAPHANDLER_NOEC( hendler87, 87)
TRAPHANDLER_NOEC( hendler88, 88)
TRAPHANDLER_NOEC( hendler89, 89)
TRAPHANDLER_NOEC( hendler90, 90)
TRAPHANDLER_NOEC( hendler91, 91)
TRAPHANDLER_NOEC( hendler92, 92)
TRAPHANDLER_NOEC( hendler93, 93)
TRAPHANDLER_NOEC( hendler94, 94)
TRAPHANDLER_NOEC( hendler95, 95)
TRAPHANDLER_NOEC( hendler96, 96)
TRAPHANDLER_NOEC( hendler97, 97)
TRAPHANDLER_NOEC( hendler98, 98)
TRAPHANDLER_NOEC( hendler99, 99)
TRAPHANDLER_NOEC( hendler100, 100)
TRAPHANDLER_NOEC( hendler101, 101)
TRAPHANDLER_NOEC( hendler102, 102)
TRAPHANDLER_NOEC( hendler103, 103)
TRAPHANDLER_NOEC( hendler104, 104)
TRAPHANDLER_NOEC( hendler105, 105)
TRAPHANDLER_NOEC( hendler106, 106)
TRAPHANDLER_NOEC( hendler107, 107)
TRAPHANDLER_NOEC( hendler108, 108)
TRAPHANDLER_NOEC( hendler109, 109)
TRAPHANDLER_NOEC( hendler110, 110)
TRAPHANDLER_NOEC( hendler111, 111)
TRAPHANDLER_NOEC( hendler112, 112)
TRAPHANDLER_NOEC( hendler113, 113)
TRAPHANDLER_NOEC( hendler114, 114)
TRAPHANDLER_NOEC( hendler115, 115)
TRAPHANDLER_NOEC( hendler116, 116)
TRAPHANDLER_NOEC( hendler117, 117)
TRAPHANDLER_NOEC( hendler118, 118)
TRAPHANDLER_NOEC( hendler119, 119)
TRAPHANDLER_NOEC( hendler120, 120)
TRAPHANDLER_NOEC( hendler121, 121)
TRAPHANDLER_NOEC( hendler122, 122)
TRAPHANDLER_NOEC( hendler123, 123)
TRAPHANDLER_NOEC( hendler124, 124)
TRAPHANDLER_NOEC( hendler125, 125)
TRAPHANDLER_NOEC( hendler126, 126)
TRAPHANDLER_NOEC( hendler127, 127)
TRAPHANDLER_NOEC( hendler128, 128)
TRAPHANDLER_NOEC( hendler129, 129)
TRAPHANDLER_NOEC( hendler130, 130)
TRAPHANDLER_NOEC( hendler131, 131)
TRAPHANDLER_NOEC( hendler132, 132)
TRAPHANDLER_NOEC( hendler133, 133)
TRAPHANDLER_NOEC( hendler134, 134)
TRAPHANDLER_NOEC( hendler135, 135)
TRAPHANDLER_NOEC( hendler136, 136)
TRAPHANDLER_NOEC( hendler137, 137)
TRAPHANDLER_NOEC( hendler138, 138)
TRAPHANDLER_NOEC( hendler139, 139)
TRAPHANDLER_NOEC( hendler140, 140)
TRAPHANDLER_NOEC( hendler141, 141)
TRAPHANDLER_NOEC( hendler142, 142)
TRAPHANDLER_NOEC( hendler143, 143)
TRAPHANDLER_NOEC( hendler144, 144)
TRAPHANDLER_NOEC( hendler145, 145)
TRAPHANDLER_NOEC( hendler146, 146)
TRAPHANDLER_NOEC( hendler147, 147)
TRAPHANDLER_NOEC( hendler148, 148)
TRAPHANDLER_NOEC( hendler149, 149)
TRAPHANDLER_NOEC( hendler150, 150)
TRAPHANDLER_NOEC( hendler151, 151)
TRAPHANDLER_NOEC( hendler152, 152)
TRAPHANDLER_NOEC( hendler153, 153)
TRAPHANDLER_NOEC( hendler154, 154)
TRAPHANDLER_NOEC( hendler155, 155)
TRAPHANDLER_NOEC( hendler156, 156)
TRAPHANDLER_NOEC( hendler157, 157)
TRAPHANDLER_NOEC( hendler158, 158)
TRAPHANDLER_NOEC( hendler159, 159)
TRAPHANDLER_NOEC( hendler160, 160)
TRAPHANDLER_NOEC( hendler161, 161)
TRAPHANDLER_NOEC( hendler162, 162)
TRAPHANDLER_NOEC( hendler163, 163)
TRAPHANDLER_NOEC( hendler164, 164)
TRAPHANDLER_NOEC( hendler165, 165)
TRAPHANDLER_NOEC( hendler166, 166)
TRAPHANDLER_NOEC( hendler167, 167)
TRAPHANDLER_NOEC( hendler168, 168)
TRAPHANDLER_NOEC( hendler169, 169)
TRAPHANDLER_NOEC( hendler170, 170)
TRAPHANDLER_NOEC( hendler171, 171)
TRAPHANDLER_NOEC( hendler172, 172)
TRAPHANDLER_NOEC( hendler173, 173)
TRAPHANDLER_NOEC( hendler174, 174)
TRAPHANDLER_NOEC( hendler175, 175)
TRAPHANDLER_NOEC( hendler176, 176)
TRAPHANDLER_NOEC( hendler177, 177)
TRAPHANDLER_NOEC( hendler178, 178)
TRAPHANDLER_NOEC( hendler179, 179)
TRAPHANDLER_NOEC( hendler180, 180)
TRAPHANDLER_NOEC( hendler181, 181)
TRAPHANDLER_NOEC( hendler182, 182)
TRAPHANDLER_NOEC( hendler183, 183)
TRAPHANDLER_NOEC( hendler184, 184)
TRAPHANDLER_NOEC( hendler185, 185)
TRAPHANDLER_NOEC( hendler186, 186)
TRAPHANDLER_NOEC( hendler187, 187)
TRAPHANDLER_NOEC( hendler188, 188)
TRAPHANDLER_NOEC( hendler189, 189)
TRAPHANDLER_NOEC( hendler190, 190)
TRAPHANDLER_NOEC( hendler191, 191)
TRAPHANDLER_NOEC( hendler192, 192)
TRAPHANDLER_NOEC( hendler193, 193)
TRAPHANDLER_NOEC( hendler194, 194)
TRAPHANDLER_NOEC( hendler195, 195)
TRAPHANDLER_NOEC( hendler196, 196)
TRAPHANDLER_NOEC( hendler197, 197)
TRAPHANDLER_NOEC( hendler198, 198)
TRAPHANDLER_NOEC( hendler199, 199)
TRAPHANDLER_NOEC( hendler200, 200)
TRAPHANDLER_NOEC( hendler201, 201)
TRAPHANDLER_NOEC( hendler202, 202)
TRAPHANDLER_NOEC( hendler203, 203)
TRAPHANDLER_NOEC( hendler204, 204)
TRAPHANDLER_NOEC( hendler205, 205)
TRAPHANDLER_NOEC( hendler206, 206)
TRAPHANDLER_NOEC( hendler207, 207)
TRAPHANDLER_NOEC( hendler208, 208)
TRAPHANDLER_NOEC( hendler209, 209)
TRAPHANDLER_NOEC( hendler210, 210)
TRAPHANDLER_NOEC( hendler211, 211)
TRAPHANDLER_NOEC( hendler212, 212)
TRAPHANDLER_NOEC( hendler213, 213)
TRAPHANDLER_NOEC( hendler214, 214)
TRAPHANDLER_NOEC( hendler215, 215)
TRAPHANDLER_NOEC( hendler216, 216)
TRAPHANDLER_NOEC( hendler217, 217)
TRAPHANDLER_NOEC( hendler218, 218)
TRAPHANDLER_NOEC( hendler219, 219)
TRAPHANDLER_NOEC( hendler220, 220)
TRAPHANDLER_NOEC( hendler221, 221)
TRAPHANDLER_NOEC( hendler222, 222)
TRAPHANDLER_NOEC( hendler223, 223)
TRAPHANDLER_NOEC( hendler224, 224)
TRAPHANDLER_NOEC( hendler225, 225)
TRAPHANDLER_NOEC( hendler226, 226)
TRAPHANDLER_NOEC( hendler227, 227)
TRAPHANDLER_NOEC( hendler228, 228)
TRAPHANDLER_NOEC( hendler229, 229)
TRAPHANDLER_NOEC( hendler230, 230)
TRAPHANDLER_NOEC( hendler231, 231)
TRAPHANDLER_NOEC( hendler232, 232)
TRAPHANDLER_NOEC( hendler233, 233)
TRAPHANDLER_NOEC( hendler234, 234)
TRAPHANDLER_NOEC( hendler235, 235)
TRAPHANDLER_NOEC( hendler236, 236)
TRAPHANDLER_NOEC( hendler237, 237)
TRAPHANDLER_NOEC( hendler238, 238)
TRAPHANDLER_NOEC( hendler239, 239)
TRAPHANDLER_NOEC( hendler240, 240)
TRAPHANDLER_NOEC( hendler241, 241)
TRAPHANDLER_NOEC( hendler242, 242)
TRAPHANDLER_NOEC( hendler243, 243)
TRAPHANDLER_NOEC( hendler244, 244)
TRAPHANDLER_NOEC( hendler245, 245)
TRAPHANDLER_NOEC( hendler246, 246)
TRAPHANDLER_NOEC( hendler247, 247)
TRAPHANDLER_NOEC( hendler248, 248)
TRAPHANDLER_NOEC( hendler249, 249)
TRAPHANDLER_NOEC( hendler250, 250)
TRAPHANDLER_NOEC( hendler251, 251)
TRAPHANDLER_NOEC( hendler252, 252)
TRAPHANDLER_NOEC( hendler253, 253)
TRAPHANDLER_NOEC( hendler254, 254)
TRAPHANDLER_NOEC( hendler255, 255)


.data
    .globl hendleri
    hendleri:
      .long hendler0
      .long hendler1
      .long hendler2
      .long hendler3
      .long hendler4
      .long hendler5
      .long hendler6
      .long hendler7
      .long hendler8
      .long hendler9
      .long hendler10
      .long hendler11
      .long hendler12
      .long hendler13
      .long hendler14
      .long hendler15
      .long hendler16
      .long hendler17
      .long hendler18
      .long hendler19
      .long hendler20
      .long hendler21
      .long hendler22
      .long hendler23
      .long hendler24
      .long hendler25
      .long hendler26
      .long hendler27
      .long hendler28
      .long hendler29
      .long hendler30
      .long hendler31
      .long hendler32
      .long hendler33
      .long hendler34
      .long hendler35
      .long hendler36
      .long hendler37
      .long hendler38
      .long hendler39
      .long hendler40
      .long hendler41
      .long hendler42
      .long hendler43
      .long hendler44
      .long hendler45
      .long hendler46
      .long hendler47
      .long hendler48
      .long hendler49
      .long hendler50
      .long hendler51
      .long hendler52
      .long hendler53
      .long hendler54
      .long hendler55
      .long hendler56
      .long hendler57
      .long hendler58
      .long hendler59
      .long hendler60
      .long hendler61
      .long hendler62
      .long hendler63
      .long hendler64
      .long hendler65
      .long hendler66
      .long hendler67
      .long hendler68
      .long hendler69
      .long hendler70
      .long hendler71
      .long hendler72
      .long hendler73
      .long hendler74
      .long hendler75
      .long hendler76
      .long hendler77
      .long hendler78
      .long hendler79
      .long hendler80
      .long hendler81
      .long hendler82
      .long hendler83
      .long hendler84
      .long hendler85
      .long hendler86
      .long hendler87
      .long hendler88
      .long hendler89
      .long hendler90
      .long hendler91
      .long hendler92
      .long hendler93
      .long hendler94
      .long hendler95
      .long hendler96
      .long hendler97
      .long hendler98
      .long hendler99
      .long hendler100
      .long hendler101
      .long hendler102
      .long hendler103
      .long hendler104
      .long hendler105
      .long hendler106
      .long hendler107
      .long hendler108
      .long hendler109
      .long hendler110
      .long hendler111
      .long hendler112
      .long hendler113
      .long hendler114
      .long hendler115
      .long hendler116
      .long hendler117
      .long hendler118
      .long hendler119
      .long hendler120
      .long hendler121
      .long hendler122
      .long hendler123
      .long hendler124
      .long hendler125
      .long hendler126
      .long hendler127
      .long hendler128
      .long hendler129
      .long hendler130
      .long hendler131
      .long hendler132
      .long hendler133
      .long hendler134
      .long hendler135
      .long hendler136
      .long hendler137
      .long hendler138
      .long hendler139
      .long hendler140
      .long hendler141
      .long hendler142
      .long hendler143
      .long hendler144
      .long hendler145
      .long hendler146
      .long hendler147
      .long hendler148
      .long hendler149
      .long hendler150
      .long hendler151
      .long hendler152
      .long hendler153
      .long hendler154
      .long hendler155
      .long hendler156
      .long hendler157
      .long hendler158
      .long hendler159
      .long hendler160
      .long hendler161
      .long hendler162
      .long hendler163
      .long hendler164
      .long hendler165
      .long hendler166
      .long hendler167
      .long hendler168
      .long hendler169
      .long hendler170
      .long hendler171
      .long hendler172
      .long hendler173
      .long hendler174
      .long hendler175
      .long hendler176
      .long hendler177
      .long hendler178
      .long hendler179
      .long hendler180
      .long hendler181
      .long hendler182
      .long hendler183
      .long hendler184
      .long hendler185
      .long hendler186
      .long hendler187
      .long hendler188
      .long hendler189
      .long hendler190
      .long hendler191
      .long hendler192
      .long hendler193
      .long hendler194
      .long hendler195
      .long hendler196
      .long hendler197
      .long hendler198
      .long hendler199
      .long hendler200
      .long hendler201
      .long hendler202
      .long hendler203
      .long hendler204
      .long hendler205
      .long hendler206
      .long hendler207
      .long hendler208
      .long hendler209
      .long hendler210
      .long hendler211
      .long hendler212
      .long hendler213
      .long hendler214
      .long hendler215
      .long hendler216
      .long hendler217
      .long hendler218
      .long hendler219
      .long hendler220
      .long hendler221
      .long hendler222
      .long hendler223
      .long hendler224
      .long hendler225
      .long hendler226
      .long hendler227
      .long hendler228
      .long hendler229
      .long hendler230
      .long hendler231
      .long hendler232
      .long hendler233
      .long hendler234
      .long hendler235
      .long hendler236
      .long hendler237
      .long hendler238
      .long hendler239
      .long hendler240
      .long hendler241
      .long hendler242
      .long hendler243
      .long hendler244
      .long hendler245
      .long hendler246
      .long hendler247
      .long hendler248
      .long hendler249
      .long hendler250
      .long hendler251
      .long hendler252
      .long hendler253
      .long hendler254
      .long hendler255

/*
 * Lab 3: Your code here for _alltraps
 */

_alltraps:
    pushl %ds
    pushl %es
    pushal
    movl $GD_KD, %eax
    movw %ax, %ds
    movw %ax, %es

pushl %esp
call trap
