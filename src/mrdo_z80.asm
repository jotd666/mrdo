;	map(0x0000, 0x7fff).rom();
;	map(0x8000, 0x87ff).ram().w(FUNC(mrdo_state::bgvideoram_w)).share("bgvideoram");
;	map(0x8800, 0x8fff).ram().w(FUNC(mrdo_state::fgvideoram_w)).share("fgvideoram");
;	map(0x9000, 0x90ff).writeonly().share("spriteram");
;	map(0x9800, 0x9800).w(FUNC(mrdo_state::flipscreen_w)); // screen flip + playfield priority
;	map(0x9801, 0x9801).w("sn1", FUNC(sn76489_device::write));
;	map(0x9802, 0x9802).w("sn2", FUNC(sn76489_device::write));
;	map(0x9803, 0x9803).r(FUNC(mrdo_state::protection_r));
;	map(0xa000, 0xa000).portr("P1");
;	map(0xa001, 0xa001).portr("P2");
;	map(0xa002, 0xa002).portr("DSW1");
;	map(0xa003, 0xa003).portr("DSW2");
;	map(0xe000, 0xefff).ram();
;	map(0xf000, 0xf7ff).w(FUNC(mrdo_state::scrollx_w));
;	map(0xf800, 0xffff).w(FUNC(mrdo_state::scrolly_w));

;	PORT_START("P1")
;	PORT_BIT( 0x01, IP_ACTIVE_LOW, IPT_JOYSTICK_LEFT ) PORT_4WAY
;	PORT_BIT( 0x02, IP_ACTIVE_LOW, IPT_JOYSTICK_DOWN ) PORT_4WAY
;	PORT_BIT( 0x04, IP_ACTIVE_LOW, IPT_JOYSTICK_RIGHT ) PORT_4WAY
;	PORT_BIT( 0x08, IP_ACTIVE_LOW, IPT_JOYSTICK_UP ) PORT_4WAY
;	PORT_BIT( 0x10, IP_ACTIVE_LOW, IPT_BUTTON1 )
;	PORT_BIT( 0x20, IP_ACTIVE_LOW, IPT_START1 )
;	PORT_BIT( 0x40, IP_ACTIVE_LOW, IPT_START2 )
;	PORT_BIT( 0x80, IP_ACTIVE_LOW, IPT_TILT )
;
;	PORT_START("P2")
;	PORT_BIT( 0x01, IP_ACTIVE_LOW, IPT_JOYSTICK_LEFT ) PORT_4WAY PORT_COCKTAIL
;	PORT_BIT( 0x02, IP_ACTIVE_LOW, IPT_JOYSTICK_DOWN ) PORT_4WAY PORT_COCKTAIL
;	PORT_BIT( 0x04, IP_ACTIVE_LOW, IPT_JOYSTICK_RIGHT ) PORT_4WAY PORT_COCKTAIL
;	PORT_BIT( 0x08, IP_ACTIVE_LOW, IPT_JOYSTICK_UP ) PORT_4WAY PORT_COCKTAIL
;	PORT_BIT( 0x10, IP_ACTIVE_LOW, IPT_BUTTON1 ) PORT_COCKTAIL
;	PORT_BIT( 0x20, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x40, IP_ACTIVE_LOW, IPT_COIN1 )
;	PORT_BIT( 0x80, IP_ACTIVE_LOW, IPT_COIN2 )
;
;	PORT_START("DSW1")
;	PORT_DIPNAME( 0x03, 0x03, DEF_STR( Difficulty ) ) PORT_DIPLOCATION("SW1:8,7")
;	PORT_DIPSETTING(    0x03, DEF_STR( Easy ) )
;	PORT_DIPSETTING(    0x02, DEF_STR( Medium ) )
;	PORT_DIPSETTING(    0x01, DEF_STR( Hard ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Hardest ) )
;	PORT_DIPNAME( 0x04, 0x04, "Rack Test (Cheat)") PORT_CODE(KEYCODE_F1) PORT_DIPLOCATION("SW1:6")
;	PORT_DIPSETTING(    0x04, DEF_STR( Off ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( On ) )
;	PORT_DIPNAME( 0x08, 0x08, "Special" ) PORT_DIPLOCATION("SW1:5")
;	PORT_DIPSETTING(    0x08, DEF_STR( Easy ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Hard ) )
;	PORT_DIPNAME( 0x10, 0x10, "Extra" ) PORT_DIPLOCATION("SW1:4")
;	PORT_DIPSETTING(    0x10, DEF_STR( Easy ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Hard ) )
;	PORT_DIPNAME( 0x20, 0x00, DEF_STR( Cabinet ) ) PORT_DIPLOCATION("SW1:3")
;	PORT_DIPSETTING(    0x00, DEF_STR( Upright ) )
;	PORT_DIPSETTING(    0x20, DEF_STR( Cocktail ) )
;	PORT_DIPNAME( 0xc0, 0xc0, DEF_STR( Lives ) ) PORT_DIPLOCATION("SW1:2,1")
;	PORT_DIPSETTING(    0x00, "2" )
;	PORT_DIPSETTING(    0xc0, "3" )
;	PORT_DIPSETTING(    0x80, "4" )
;	PORT_DIPSETTING(    0x40, "5" )
;
;	PORT_START("DSW2")
;	PORT_DIPNAME( 0x0f, 0x0f, DEF_STR( Coin_B ) ) PORT_DIPLOCATION("SW2:8,7,6,5")
;	PORT_DIPSETTING(    0x06, DEF_STR( 4C_1C ) )
;	PORT_DIPSETTING(    0x08, DEF_STR( 3C_1C ) )
;	PORT_DIPSETTING(    0x0a, DEF_STR( 2C_1C ) )
;	PORT_DIPSETTING(    0x07, DEF_STR( 3C_2C ) )
;	PORT_DIPSETTING(    0x0f, DEF_STR( 1C_1C ) )
;	PORT_DIPSETTING(    0x09, DEF_STR( 2C_3C ) )
;	PORT_DIPSETTING(    0x0e, DEF_STR( 1C_2C ) )
;	PORT_DIPSETTING(    0x0d, DEF_STR( 1C_3C ) )
;	PORT_DIPSETTING(    0x0c, DEF_STR( 1C_4C ) )
;	PORT_DIPSETTING(    0x0b, DEF_STR( 1C_5C ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Free_Play ) )
;	// settings 0x01 through 0x05 all give 1 Coin/1 Credit
;	PORT_DIPNAME( 0xf0, 0xf0, DEF_STR( Coin_A ) ) PORT_DIPLOCATION("SW2:4,3,2,1")
;	PORT_DIPSETTING(    0x60, DEF_STR( 4C_1C ) )
;	PORT_DIPSETTING(    0x80, DEF_STR( 3C_1C ) )
;	PORT_DIPSETTING(    0xa0, DEF_STR( 2C_1C ) )
;	PORT_DIPSETTING(    0x70, DEF_STR( 3C_2C ) )
;	PORT_DIPSETTING(    0xf0, DEF_STR( 1C_1C ) )
;	PORT_DIPSETTING(    0x90, DEF_STR( 2C_3C ) )
;	PORT_DIPSETTING(    0xe0, DEF_STR( 1C_2C ) )
;	PORT_DIPSETTING(    0xd0, DEF_STR( 1C_3C ) )
;	PORT_DIPSETTING(    0xc0, DEF_STR( 1C_4C ) )
;	PORT_DIPSETTING(    0xb0, DEF_STR( 1C_5C ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Free_Play ) )
;	// settings 0x10 through 0x50 all give 1 Coin/1 Credit

port_1_a000 = $a000
port_2_a001 = $a001
dsw_1_a002 = $a002
dsw_2_a003 = $a003

reset_0000:  ; [global]
0000: 31 80 EB    ld   sp,$EB80
0003: C3 68 00    jp   $0068

0038: C3 B8 00    jp   $00B8

0066: ED 45       retn

0068: 3A 00 A0    ld   a,(port_1_a000)
006B: 47          ld   b,a
006C: 3A 01 A0    ld   a,(port_2_a001)
006F: A0          and  b
0070: E6 10       and  $10
0072: CA AF 56    jp   z,$56AF
; clear ram
0075: 21 00 E0    ld   hl,$E000
0078: 11 01 E0    ld   de,$E001
007B: 01 FF 0F    ld   bc,$0FFF
007E: 36 00       ld   (hl),$00
0080: ED B0       ldir
; copy some ROM in RAM
0082: 21 5B 36    ld   hl,$365B
0085: 22 7B E0    ld   ($E07B),hl
0088: 11 17 E0    ld   de,$E017
008B: 3E 0A       ld   a,$0A
008D: 21 AE 00    ld   hl,$00AE
0090: 01 0A 00    ld   bc,$000A
0093: ED B0       ldir
0095: 3D          dec  a
0096: 20 F5       jr   nz,$008D
0098: 3E 03       ld   a,$03
009A: 32 20 E0    ld   ($E020),a
009D: CD 80 5A    call $5A80
00A0: 3E 80       ld   a,$80
00A2: 32 A1 E1    ld   ($E1A1),a
00A5: AF          xor  a
00A6: 32 00 98    ld   ($9800),a
00A9: ED 56       im   1
00AB: FB          ei
00AC: 18 FE       jr   $00AC

irq_00b8:   ; [global]
00B8: C5          push bc
00B9: D5          push de
00BA: E5          push hl
00BB: F5          push af
00BC: DD E5       push ix
00BE: FD E5       push iy
00C0: FD 21 00 E0 ld   iy,$E000
00C4: FD CB 01 7E bit  7,(iy+$01)
00C8: C4 6D 02    call nz,$026D
00CB: FD CB 01 BE res  7,(iy+$01)
00CF: CD A6 01    call $01A6
00D2: CD 90 5A    call $5A90
00D5: 21 56 01    ld   hl,table_0156
00D8: 06 14       ld   b,$14
00DA: FD 21 97 E0 ld   iy,$E097
00DE: 3A 00 E0    ld   a,($E000)
00E1: CB 67       bit  4,a
00E3: 28 04       jr   z,$00E9
00E5: FD 21 1C E1 ld   iy,$E11C
00E9: 5E          ld   e,(hl)
00EA: 23          inc  hl
00EB: 56          ld   d,(hl)
00EC: 23          inc  hl
00ED: D5          push de
00EE: DD E1       pop  ix			; now IX is the parameter
00F0: 5E          ld   e,(hl)
00F1: 23          inc  hl
00F2: 56          ld   d,(hl)
00F3: 23          inc  hl			; now DE is the function
00F4: DD CB 00 7E bit  7,(ix+$00)
00F8: 28 0E       jr   z,$0108
00FA: C5          push bc
00FB: E5          push hl
00FC: FD E5       push iy
00FE: 01 04 01    ld   bc,return_0104		; push function
0101: C5          push bc
0102: EB          ex   de,hl
0103: E9          jp   (hl)		; [indirect_jump]
; returns there
return_0104:
0104: FD E1       pop  iy
0106: E1          pop  hl
0107: C1          pop  bc
0108: 10 DF       djnz $00E9
010A: 3A 01 E0    ld   a,($E001)
010D: E6 20       and  $20
010F: 28 0B       jr   z,$011C
0111: 21 05 E0    ld   hl,$E005
0114: 35          dec  (hl)
0115: 20 05       jr   nz,$011C
0117: 21 01 E0    ld   hl,$E001
011A: CB AE       res  5,(hl)
011C: 3A 01 E0    ld   a,($E001)
011F: 1F          rra
0120: 38 16       jr   c,$0138
0122: 1F          rra
0123: 38 09       jr   c,$012E
0125: 1F          rra
0126: 38 19       jr   c,$0141
0128: 1F          rra
0129: 38 03       jr   c,$012E
012B: 1F          rra
012C: 38 1F       jr   c,fatal_error_014d
012E: FD E1       pop  iy
0130: DD E1       pop  ix
0132: F1          pop  af
0133: E1          pop  hl
0134: D1          pop  de
0135: C1          pop  bc
0136: FB          ei

0137: C9          ret

0138: 31 80 EB    ld   sp,$EB80
013B: FB          ei
013C: CD EC 54    call $54EC
013F: 18 0C       jr   fatal_error_014d     ; [breakpoint]

0141: 31 76 EB    ld   sp,$EB76
0144: FB          ei
0145: CD 8E 55    call $558E    ; [breakpoint]
0148: F1          pop  af
0149: E1          pop  hl
014A: D1          pop  de
014B: C1          pop  bc
014C: C9          ret

014D: 31 80 EB    ld   sp,$EB80		
0150: FB          ei
0151: CD 47 56    call $5647  ; [breakpoint]
0154: 18 FE       jr   $0154

; ram pointer, then rom call
table_0156:
	.word	$E21A 
	.word	$3231 
	.word	$E22F 
	.word	$3231 
	.word	$E244 
	.word	$3231 
	.word	$E259 
	.word	$3231
	.word	$E26E
	.word	$3231
	.word	$E283
	.word	$3231
	.word	$E298
	.word	$3231
	.word	$E2AD
	.word	$3231
	.word	$E2C2
	.word	$4353
	.word	$E2D3
	.word	$4B18
	.word	$E2E2 
	.word	$4B18 
	.word	$E2F1
	.word	$4B18
	.word	$E309 
	.word	$542B 
	.word	$E1C5 
	.word	$1FB2 
	.word	$E300 
	.word	$4E02 
	.word	$E1D7 
	.word	$28DF
	.word	$E212 
	.word	$2F01 
	.word	$E1B6 
	.word	$193C 
	.word	$E1A9 
	.word	$11CE 
	.word	$E1A1 
	.word	$0D2A

01A6: CD DE 01    call $01DE                                          
01A9: 3A 01 A0    ld   a,(port_2_a001)
01AC: 17          rla
01AD: 38 15       jr   c,$01C4
01AF: F5          push af
01B0: 3A 03 E0    ld   a,($E003)
01B3: A7          and  a
01B4: 20 08       jr   nz,$01BE
01B6: 3A 03 A0    ld   a,(dsw_2_a003)
01B9: E6 0F       and  $0F
01BB: CD FA 01    call $01FA
01BE: 3E 03       ld   a,$03
01C0: 32 03 E0    ld   ($E003),a
01C3: F1          pop  af
01C4: 17          rla
01C5: D8          ret  c
01C6: 3A 04 E0    ld   a,($E004)
01C9: A7          and  a
01CA: 20 0C       jr   nz,$01D8
01CC: 3A 03 A0    ld   a,(dsw_2_a003)
01CF: E6 F0       and  $F0
01D1: 0F          rrca
01D2: 0F          rrca
01D3: 0F          rrca
01D4: 0F          rrca
01D5: CD FA 01    call $01FA
01D8: 3E 03       ld   a,$03
01DA: 32 04 E0    ld   ($E004),a
01DD: C9          ret
01DE: 21 02 E0    ld   hl,$E002
01E1: 7E          ld   a,(hl)
01E2: A7          and  a
01E3: 28 01       jr   z,$01E6
01E5: 35          dec  (hl)
01E6: 3A 00 A0    ld   a,(port_1_a000)
01E9: 17          rla
01EA: 38 02       jr   c,$01EE
01EC: 36 0A       ld   (hl),$0A
01EE: 23          inc  hl
01EF: 7E          ld   a,(hl)
01F0: A7          and  a
01F1: 28 01       jr   z,$01F4
01F3: 35          dec  (hl)
01F4: 23          inc  hl
01F5: 7E          ld   a,(hl)
01F6: A7          and  a
01F7: C8          ret  z
01F8: 35          dec  (hl)
01F9: C9          ret
01FA: 4F          ld   c,a
01FB: 3E 14       ld   a,$14
01FD: 06 00       ld   b,$00
01FF: CD DF 02    call $02DF
0202: 3A 02 E0    ld   a,($E002)
0205: A7          and  a
0206: C0          ret  nz
0207: 3A 03 A0    ld   a,(dsw_2_a003)
020A: 47          ld   b,a
020B: E6 F0       and  $F0
020D: C8          ret  z
020E: 78          ld   a,b
020F: E6 0F       and  $0F
0211: C8          ret  z
0212: 79          ld   a,c
0213: 87          add  a,a
0214: 5F          ld   e,a
0215: 16 00       ld   d,$00
0217: 21 4D 02    ld   hl,$024D
021A: 19          add  hl,de
021B: EB          ex   de,hl
021C: 69          ld   l,c
021D: 01 07 E0    ld   bc,$E007
0220: 09          add  hl,bc
0221: 34          inc  (hl)
0222: 1A          ld   a,(de)
0223: BE          cp   (hl)
0224: C0          ret  nz
0225: 47          ld   b,a
0226: 3A 06 E0    ld   a,($E006)
0229: 4F          ld   c,a
022A: 13          inc  de
022B: 1A          ld   a,(de)
022C: 81          add  a,c
022D: 27          daa
022E: 38 0B       jr   c,$023B
0230: FE 99       cp   $99
0232: 28 07       jr   z,$023B
0234: 32 06 E0    ld   ($E006),a
0237: 36 00       ld   (hl),$00
0239: 18 07       jr   $0242
023B: 3E 99       ld   a,$99
023D: 32 06 E0    ld   ($E006),a
0240: 05          dec  b
0241: 70          ld   (hl),b
0242: 3A 00 E0    ld   a,($E000)
0245: 17          rla
0246: D8          ret  c
0247: 21 A1 E1    ld   hl,$E1A1
024A: CB E6       set  4,(hl)
024C: C9          ret
024D: 01 01 01    ld   bc,$0101
0250: 01 01 01    ld   bc,$0101
0253: 01 01 01    ld   bc,$0101
0256: 01 01 01    ld   bc,$0101
0259: 04          inc  b
025A: 01 03 02    ld   bc,$0203
025D: 03          inc  bc
025E: 01 02 03    ld   bc,$0302
0261: 02          ld   (bc),a
0262: 01 01 05    ld   bc,$0501
0265: 01 04 01    ld   bc,$0104
0268: 03          inc  bc
0269: 01 02 01    ld   bc,$0102
026C: 01 21 11    ld   bc,$1121
026F: E3          ex   (sp),hl
0270: 11 00 90    ld   de,$9000
0273: 06 00       ld   b,$00
0275: 7E          ld   a,(hl)
0276: 87          add  a,a
0277: 28 08       jr   z,$0281
0279: 87          add  a,a
027A: 4F          ld   c,a
027B: 30 01       jr   nc,$027E
027D: 04          inc  b
027E: 23          inc  hl
027F: ED B0       ldir
0281: 21 11 E3    ld   hl,$E311
0284: 3E 40       ld   a,$40
0286: 96          sub  (hl)
0287: 36 00       ld   (hl),$00
0289: C8          ret  z
028A: D8          ret  c
028B: 47          ld   b,a
028C: EB          ex   de,hl
028D: 23          inc  hl
028E: 11 04 00    ld   de,$0004
0291: AF          xor  a
0292: 77          ld   (hl),a
0293: 19          add  hl,de
0294: 10 FC       djnz $0292
0296: C9          ret
0297: DD 56 01    ld   d,(ix+$01)
029A: DD 5E 03    ld   e,(ix+$03)
029D: 21 11 E3    ld   hl,$E311
02A0: 7E          ld   a,(hl)
02A1: 87          add  a,a
02A2: D8          ret  c
02A3: 87          add  a,a
02A4: D8          ret  c
02A5: D5          push de
02A6: 5F          ld   e,a
02A7: 16 00       ld   d,$00
02A9: 23          inc  hl
02AA: 19          add  hl,de
02AB: D1          pop  de
02AC: 3A 00 E0    ld   a,($E000)
02AF: 1F          rra
02B0: 38 0A       jr   c,$02BC
02B2: 3E 08       ld   a,$08
02B4: 92          sub  d
02B5: 57          ld   d,a
02B6: 7B          ld   a,e
02B7: D6 08       sub  $08
02B9: 5F          ld   e,a
02BA: 18 0C       jr   $02C8
02BC: 79          ld   a,c
02BD: EE 30       xor  $30
02BF: 4F          ld   c,a
02C0: 7A          ld   a,d
02C1: C6 08       add  a,$08
02C3: 57          ld   d,a
02C4: 3E F8       ld   a,$F8
02C6: 93          sub  e
02C7: 5F          ld   e,a
02C8: 70          ld   (hl),b
02C9: 23          inc  hl
02CA: 72          ld   (hl),d
02CB: 23          inc  hl
02CC: 71          ld   (hl),c
02CD: 23          inc  hl
02CE: 73          ld   (hl),e
02CF: 21 11 E3    ld   hl,$E311
02D2: 34          inc  (hl)
02D3: 21 01 E0    ld   hl,$E001
02D6: CB FE       set  7,(hl)
02D8: C9          ret
02D9: 21 00 E0    ld   hl,$E000
02DC: CB 7E       bit  7,(hl)
02DE: C8          ret  z
02DF: 5F          ld   e,a
02E0: 16 00       ld   d,$00
02E2: 21 00 EC    ld   hl,$EC00
02E5: 19          add  hl,de
02E6: CB C0       set  0,b
02E8: 70          ld   (hl),b
02E9: C9          ret
02EA: 5F          ld   e,a
02EB: 16 00       ld   d,$00
02ED: 21 00 EC    ld   hl,$EC00
02F0: 19          add  hl,de
02F1: CB D6       set  2,(hl)
02F3: C9          ret
02F4: 2A 7B E0    ld   hl,($E07B)
02F7: 54          ld   d,h
02F8: 5D          ld   e,l
02F9: 29          add  hl,hl
02FA: 19          add  hl,de
02FB: 7B          ld   a,e
02FC: 84          add  a,h
02FD: 67          ld   h,a
02FE: 22 7B E0    ld   ($E07B),hl
0301: C9          ret
0302: 3A 00 E0    ld   a,($E000)
0305: 17          rla
0306: D0          ret  nc
0307: FD E5       push iy
0309: E1          pop  hl
030A: 01 07 00    ld   bc,$0007
030D: 09          add  hl,bc
030E: CD 18 03    call $0318
0311: FD E5       push iy
0313: E1          pop  hl
0314: 01 2F 00    ld   bc,$002F
0317: 09          add  hl,bc
0318: 37          scf
0319: 06 03       ld   b,$03
031B: 7E          ld   a,(hl)
031C: CE 00       adc  a,$00
031E: 27          daa
031F: FE 60       cp   $60
0321: 38 01       jr   c,$0324
0323: AF          xor  a
0324: 77          ld   (hl),a
0325: 3F          ccf
0326: 2B          dec  hl
0327: 10 F2       djnz $031B
0329: C9          ret
032A: 3A 00 E0    ld   a,($E000)
032D: 17          rla
032E: D0          ret  nc
032F: FD E5       push iy
0331: E1          pop  hl
0332: 23          inc  hl
0333: 23          inc  hl
0334: 23          inc  hl
0335: D5          push de
0336: CD 74 03    call $0374
0339: CD 80 03    call $0380
033C: FD 56 18    ld   d,(iy+$18)
033F: FD 5E 19    ld   e,(iy+$19)
0342: FD 66 01    ld   h,(iy+$01)
0345: FD 6E 02    ld   l,(iy+$02)
0348: 7A          ld   a,d
0349: B3          or   e
034A: 20 05       jr   nz,$0351
034C: 7C          ld   a,h
034D: FE 90       cp   $90
034F: 30 1B       jr   nc,$036C
0351: A7          and  a
0352: ED 52       sbc  hl,de
0354: 38 16       jr   c,$036C
0356: 7B          ld   a,e
0357: C6 50       add  a,$50
0359: 27          daa
035A: FD 77 19    ld   (iy+$19),a
035D: 5F          ld   e,a
035E: 7A          ld   a,d
035F: CE 00       adc  a,$00
0361: 27          daa
0362: FD 77 18    ld   (iy+$18),a
0365: 57          ld   d,a
0366: FD CB 1B C6 set  0,(iy+$1b)
036A: 18 D6       jr   $0342
036C: D1          pop  de
036D: FD E5       push iy
036F: E1          pop  hl
0370: 01 2C 00    ld   bc,$002C
0373: 09          add  hl,bc
0374: 06 03       ld   b,$03
0376: AF          xor  a
0377: 1A          ld   a,(de)
0378: 8E          adc  a,(hl)
0379: 27          daa
037A: 77          ld   (hl),a
037B: 1B          dec  de
037C: 2B          dec  hl
037D: 10 F8       djnz $0377
037F: C9          ret
0380: 0E 09       ld   c,$09
0382: 3A 00 E0    ld   a,($E000)
0385: CB 67       bit  4,a
0387: 20 08       jr   nz,$0391
0389: 11 BD 88    ld   de,$88BD
038C: 21 98 E0    ld   hl,$E098
038F: 18 10       jr   $03A1
0391: 11 BD 8A    ld   de,$8ABD
0394: 21 1D E1    ld   hl,$E11D
0397: 18 08       jr   $03A1
0399: 0E 2C       ld   c,$2C
039B: 11 A1 8A    ld   de,$8AA1
039E: 21 17 E0    ld   hl,$E017
03A1: AF          xor  a
03A2: 06 06       ld   b,$06
03A4: EB          ex   de,hl
03A5: 71          ld   (hl),c
03A6: C5          push bc
03A7: 01 00 04    ld   bc,$0400
03AA: 09          add  hl,bc
03AB: C1          pop  bc
03AC: EB          ex   de,hl
03AD: ED 6F       rld  (hl)
03AF: 20 05       jr   nz,$03B6
03B1: F5          push af
03B2: 3E 29       ld   a,$29
03B4: 18 05       jr   $03BB
03B6: F6 80       or   $80
03B8: F5          push af
03B9: E6 0F       and  $0F
03BB: 12          ld   (de),a
03BC: F1          pop  af
03BD: E5          push hl
03BE: 21 20 FC    ld   hl,$FC20
03C1: 19          add  hl,de
03C2: EB          ex   de,hl
03C3: E1          pop  hl
03C4: CB 40       bit  0,b
03C6: 28 03       jr   z,$03CB
03C8: ED 6F       rld  (hl)
03CA: 23          inc  hl
03CB: CB 50       bit  2,b
03CD: 20 02       jr   nz,$03D1
03CF: F6 80       or   $80
03D1: 10 D1       djnz $03A4
03D3: C9          ret
03D4: 5E          ld   e,(hl)
03D5: 23          inc  hl
03D6: 56          ld   d,(hl)
03D7: 23          inc  hl
03D8: 7E          ld   a,(hl)
03D9: 23          inc  hl
03DA: 4E          ld   c,(hl)
03DB: 23          inc  hl
03DC: 46          ld   b,(hl)
03DD: 23          inc  hl
03DE: D5          push de
03DF: D9          exx
03E0: D1          pop  de
03E1: D9          exx
03E2: C5          push bc
03E3: D9          exx
03E4: 21 00 04    ld   hl,$0400
03E7: 19          add  hl,de
03E8: D5          push de
03E9: D9          exx
03EA: 08          ex   af,af'
03EB: 7E          ld   a,(hl)
03EC: D9          exx
03ED: 77          ld   (hl),a
03EE: 08          ex   af,af'
03EF: 12          ld   (de),a
03F0: 13          inc  de
03F1: 23          inc  hl
03F2: D9          exx
03F3: 23          inc  hl
03F4: 10 F4       djnz $03EA
03F6: D9          exx
03F7: D1          pop  de
03F8: 21 20 00    ld   hl,$0020
03FB: 19          add  hl,de
03FC: EB          ex   de,hl
03FD: D9          exx
03FE: C1          pop  bc
03FF: 0D          dec  c
0400: 20 E0       jr   nz,$03E2
0402: C9          ret
0403: 5E          ld   e,(hl)
0404: 23          inc  hl
0405: 56          ld   d,(hl)
0406: 23          inc  hl
0407: 7E          ld   a,(hl)
0408: 23          inc  hl
0409: 46          ld   b,(hl)
040A: 23          inc  hl
040B: D5          push de
040C: D9          exx
040D: D1          pop  de
040E: D9          exx
040F: D9          exx
0410: 12          ld   (de),a
0411: 21 00 04    ld   hl,$0400
0414: 19          add  hl,de
0415: D9          exx
0416: 08          ex   af,af'
0417: 7E          ld   a,(hl)
0418: D9          exx
0419: 77          ld   (hl),a
041A: 21 20 00    ld   hl,$0020
041D: 19          add  hl,de
041E: EB          ex   de,hl
041F: D9          exx
0420: 08          ex   af,af'
0421: 23          inc  hl
0422: 10 EB       djnz $040F
0424: C9          ret
0425: 5E          ld   e,(hl)
0426: 23          inc  hl
0427: 56          ld   d,(hl)
0428: 23          inc  hl
0429: 4E          ld   c,(hl)
042A: 23          inc  hl
042B: 23          inc  hl
042C: EB          ex   de,hl
042D: A7          and  a
042E: 28 0A       jr   z,$043A
0430: C5          push bc
0431: 01 20 00    ld   bc,$0020
0434: 09          add  hl,bc
0435: 13          inc  de
0436: 3D          dec  a
0437: 20 FB       jr   nz,$0434
0439: C1          pop  bc
043A: 1A          ld   a,(de)
043B: 71          ld   (hl),c
043C: 11 00 04    ld   de,$0400
043F: 19          add  hl,de
0440: 77          ld   (hl),a
0441: C9          ret
0442: C5          push bc
0443: D5          push de
0444: 21 00 04    ld   hl,$0400
0447: 19          add  hl,de
0448: 12          ld   (de),a
0449: 08          ex   af,af'
044A: 77          ld   (hl),a
044B: 3C          inc  a
044C: 08          ex   af,af'
044D: 13          inc  de
044E: 23          inc  hl
044F: 10 F7       djnz $0448
0451: D1          pop  de
0452: 21 20 00    ld   hl,$0020
0455: 19          add  hl,de
0456: EB          ex   de,hl
0457: C1          pop  bc
0458: 0D          dec  c
0459: 20 E7       jr   nz,$0442
045B: C9          ret
045C: C5          push bc
045D: E5          push hl
045E: 77          ld   (hl),a
045F: 23          inc  hl
0460: 10 FC       djnz $045E
0462: E1          pop  hl
0463: 01 20 00    ld   bc,$0020
0466: 09          add  hl,bc
0467: C1          pop  bc
0468: 0D          dec  c
0469: 20 F1       jr   nz,$045C
046B: C9          ret
046C: AF          xor  a
046D: C5          push bc
046E: D5          push de
046F: 21 00 04    ld   hl,$0400
0472: 19          add  hl,de
0473: 12          ld   (de),a
0474: 36 29       ld   (hl),$29
0476: 13          inc  de
0477: 23          inc  hl
0478: 10 F9       djnz $0473
047A: D1          pop  de
047B: 21 20 00    ld   hl,$0020
047E: 19          add  hl,de
047F: EB          ex   de,hl
0480: C1          pop  bc
0481: 0D          dec  c
0482: 20 E9       jr   nz,$046D
0484: C9          ret
0485: 11 70 88    ld   de,$8870
0488: 21 47 05    ld   hl,$0547
048B: 3E A5       ld   a,$A5
048D: 12          ld   (de),a
048E: 13          inc  de
048F: 06 04       ld   b,$04
0491: 7E          ld   a,(hl)
0492: 12          ld   (de),a
0493: 23          inc  hl
0494: 3A 03 98    ld   a,(protection_byte_9803)
0497: E6 7E       and  $7E
0499: BE          cp   (hl)		; sequence: 40 16 7A 3E
049A: C0          ret  nz
; protection passed
049B: 13          inc  de
049C: 23          inc  hl
049D: 10 F2       djnz $0491
049F: 11 00 80    ld   de,$8000
04A2: 01 20 20    ld   bc,$2020
04A5: CD 6C 04    call $046C
04A8: CD A6 01    call $01A6
04AB: 11 80 88    ld   de,$8880
04AE: 01 18 20    ld   bc,$2018
04B1: CD 6C 04    call $046C
04B4: AF          xor  a
04B5: 32 00 F0    ld   ($F000),a
04B8: 32 00 F8    ld   ($F800),a
04BB: 32 11 E3    ld   ($E311),a
04BE: 21 01 E0    ld   hl,$E001
04C1: CB FE       set  7,(hl)
04C3: 3A 00 E0    ld   a,($E000)
04C6: E6 10       and  $10
04C8: 20 1F       jr   nz,$04E9
04CA: 21 24 05    ld   hl,$0524
04CD: CD 03 04    call $0403
04D0: 0E 09       ld   c,$09
04D2: CD 89 03    call $0389
04D5: 3A 00 E0    ld   a,($E000)
04D8: E6 20       and  $20
04DA: 28 20       jr   z,$04FC
04DC: 21 2B 05    ld   hl,$052B
04DF: CD 03 04    call $0403
04E2: 0E 08       ld   c,$08
04E4: CD 91 03    call $0391
04E7: 18 13       jr   $04FC
04E9: 21 24 05    ld   hl,$0524
04EC: CD 03 04    call $0403
04EF: CD 03 04    call $0403
04F2: 0E 08       ld   c,$08
04F4: CD 89 03    call $0389
04F7: 0E 09       ld   c,$09
04F9: CD 91 03    call $0391
04FC: CD 4F 05    call $054F
04FF: CD AA 05    call $05AA
0502: 21 32 05    ld   hl,$0532
0505: CD 03 04    call $0403
0508: CD 03 04    call $0403
050B: FD 7E 04    ld   a,(iy+$04)
050E: 47          ld   b,a
050F: E6 F0       and  $F0
0511: 28 07       jr   z,$051A
0513: 0F          rrca
0514: 0F          rrca
0515: 0F          rrca
0516: 0F          rrca
0517: 32 22 8F    ld   ($8F22),a
051A: 78          ld   a,b
051B: E6 0F       and  $0F
051D: 32 42 8F    ld   ($8F42),a
0520: CD 99 03    call $0399
0523: C9          ret
0524: FE 88       cp   $88
0526: 26 03       ld   h,$03
0528: 01 1C 1D    ld   bc,$1D1C
052B: FE 8A       cp   $8A
052D: 26 03       ld   h,$03
052F: 02          ld   (bc),a
0530: 17          rla
0531: 0D          dec  c
0532: 22 8A 26    ld   ($268A),hl
0535: 0A          ld   a,(bc)
0536: 1C          inc  e
0537: 0C          inc  c
0538: 0E 17       ld   c,$17
053A: 0E 28       ld   c,$28
053C: 28 28       jr   z,$0566
053E: 28 29       jr   z,$0569
0540: 21 8A 2C    ld   hl,$2C8A
0543: 03          inc  bc
0544: 1D          dec  e
0545: 18 19       jr   $0560
0547: A5          and  l
0548: 40          ld   b,b
0549: CD 16 36    call $3616
054C: 7A          ld   a,d
054D: 6F          ld   l,a
054E: 3E 3E       ld   a,$3E
0550: 2D          dec  l
0551: 08          ex   af,af'
0552: 3E 4C       ld   a,$4C
0554: 08          ex   af,af'
0555: 01 0A 02    ld   bc,$020A
0558: 11 7D 89    ld   de,$897D
055B: CD 42 04    call $0442
055E: FD 7E 16    ld   a,(iy+$16)
0561: 06 03       ld   b,$03
0563: 21 9D 89    ld   hl,$899D
0566: 87          add  a,a
0567: 30 0E       jr   nc,$0577
0569: F5          push af
056A: C5          push bc
056B: 3E 1A       ld   a,$1A
056D: 01 02 02    ld   bc,$0202
0570: CD 5C 04    call $045C
0573: C1          pop  bc
0574: F1          pop  af
0575: 18 04       jr   $057B
0577: 11 40 00    ld   de,$0040
057A: 19          add  hl,de
057B: 87          add  a,a
057C: 30 0E       jr   nc,$058C
057E: F5          push af
057F: C5          push bc
0580: 3E 1A       ld   a,$1A
0582: 01 01 02    ld   bc,$0201
0585: CD 5C 04    call $045C
0588: C1          pop  bc
0589: F1          pop  af
058A: 18 04       jr   $0590
058C: 11 20 00    ld   de,$0020
058F: 19          add  hl,de
0590: 10 D4       djnz $0566
0592: C9          ret
0593: 3A 02 A0    ld   a,(dsw_1_a002)
0596: E6 C0       and  $C0
0598: 07          rlca
0599: 07          rlca
059A: 06 00       ld   b,$00
059C: 4F          ld   c,a
059D: 21 A6 05    ld   hl,$05A6
05A0: 09          add  hl,bc
05A1: 7E          ld   a,(hl)
05A2: FD 77 00    ld   (iy+$00),a
05A5: C9          ret
05A6: 02          ld   (bc),a
05A7: 05          dec  b
05A8: 04          inc  b
05A9: 03          inc  bc
05AA: 11 81 88    ld   de,$8881
05AD: FD 7E 00    ld   a,(iy+$00)
05B0: FE 07       cp   $07
05B2: 38 02       jr   c,$05B6
05B4: 3E 06       ld   a,$06
05B6: 4F          ld   c,a
05B7: A7          and  a
05B8: 28 11       jr   z,$05CB
05BA: 47          ld   b,a
05BB: C5          push bc
05BC: 08          ex   af,af'
05BD: 3E 2E       ld   a,$2E
05BF: 08          ex   af,af'
05C0: 3E 09       ld   a,$09
05C2: 01 02 02    ld   bc,$0202
05C5: CD 42 04    call $0442
05C8: C1          pop  bc
05C9: 10 F0       djnz $05BB
05CB: 3E 06       ld   a,$06
05CD: 91          sub  c
05CE: C8          ret  z
05CF: 87          add  a,a
05D0: 4F          ld   c,a
05D1: 06 02       ld   b,$02
05D3: CD 6C 04    call $046C
05D6: C9          ret
05D7: DD 7E 01    ld   a,(ix+$01)
05DA: FD 96 01    sub  (iy+$01)
05DD: 30 02       jr   nc,$05E1
05DF: ED 44       neg
05E1: B8          cp   b
05E2: D0          ret  nc
05E3: DD 7E 03    ld   a,(ix+$03)
05E6: FD 96 03    sub  (iy+$03)
05E9: 30 02       jr   nc,$05ED
05EB: ED 44       neg
05ED: B9          cp   c
05EE: C9          ret
05EF: 7A          ld   a,d
05F0: 94          sub  h
05F1: 30 02       jr   nc,$05F5
05F3: ED 44       neg
05F5: B8          cp   b
05F6: D0          ret  nc
05F7: 7B          ld   a,e
05F8: 95          sub  l
05F9: 30 02       jr   nc,$05FD
05FB: ED 44       neg
05FD: B9          cp   c
05FE: C9          ret
05FF: AF          xor  a
0600: 32 C5 E1    ld   ($E1C5),a
0603: 32 C2 E2    ld   ($E2C2),a
0606: 32 00 E3    ld   ($E300),a
0609: 32 D7 E1    ld   ($E1D7),a
060C: 32 09 E3    ld   ($E309),a
060F: 32 12 E2    ld   ($E212),a
0612: 21 1A E2    ld   hl,$E21A
0615: 11 15 00    ld   de,$0015
0618: 06 08       ld   b,$08
061A: CD 25 06    call $0625
061D: 21 D3 E2    ld   hl,$E2D3
0620: 11 0F 00    ld   de,$000F
0623: 06 03       ld   b,$03
0625: 77          ld   (hl),a
0626: 19          add  hl,de
0627: 10 FC       djnz $0625
0629: C9          ret
062A: 21 1A E2    ld   hl,$E21A
062D: 11 15 00    ld   de,$0015
0630: 06 08       ld   b,$08
0632: 7E          ld   a,(hl)
0633: A7          and  a
0634: C0          ret  nz
0635: 19          add  hl,de
0636: 10 FA       djnz $0632
0638: 21 D3 E2    ld   hl,$E2D3
063B: 11 0F 00    ld   de,$000F
063E: 06 03       ld   b,$03
0640: 7E          ld   a,(hl)
0641: A7          and  a
0642: C0          ret  nz
0643: 19          add  hl,de
0644: 10 FA       djnz $0640
0646: 3A C2 E2    ld   a,($E2C2)
0649: A7          and  a
064A: C0          ret  nz
064B: 3A 09 E3    ld   a,($E309)
064E: A7          and  a
064F: C0          ret  nz
0650: 3A 00 E3    ld   a,($E300)
0653: A7          and  a
0654: C0          ret  nz
0655: 3A 12 E2    ld   a,($E212)
0658: A7          and  a
0659: C0          ret  nz
065A: 3A D7 E1    ld   a,($E1D7)
065D: A7          and  a
065E: C0          ret  nz
065F: 3A C5 E1    ld   a,($E1C5)
0662: A7          and  a
0663: C9          ret
0664: FD E5       push iy
0666: E1          pop  hl
0667: 36 00       ld   (hl),$00
0669: 54          ld   d,h
066A: 5D          ld   e,l
066B: 13          inc  de
066C: 01 84 00    ld   bc,$0084
066F: ED B0       ldir
0671: CD 93 05    call $0593
0674: FD 36 04 01 ld   (iy+$04),$01
0678: CD 76 1A    call $1A76
067B: 5F          ld   e,a
067C: 16 00       ld   d,$00
067E: 21 71 1A    ld   hl,$1A71
0681: 19          add  hl,de
0682: 7E          ld   a,(hl)
0683: FD 77 0A    ld   (iy+$0a),a
0686: FD 36 0B 9F ld   (iy+$0b),$9F
068A: FD 36 19 50 ld   (iy+$19),$50
068E: CD A1 06    call $06A1
0691: CD A6 01    call $01A6
0694: CD 24 07    call $0724
0697: CD A6 01    call $01A6
069A: CD 20 0B    call $0B20
069D: CD E0 0B    call $0BE0
06A0: C9          ret
06A1: FD 7E 04    ld   a,(iy+$04)
06A4: D6 01       sub  $01
06A6: 27          daa
06A7: FE 30       cp   $30
06A9: 38 05       jr   c,$06B0
06AB: D6 30       sub  $30
06AD: 27          daa
06AE: 18 F7       jr   $06A7
06B0: 4F          ld   c,a
06B1: E6 F0       and  $F0
06B3: 0F          rrca
06B4: 47          ld   b,a
06B5: 0F          rrca
06B6: 0F          rrca
06B7: 80          add  a,b
06B8: 47          ld   b,a
06B9: 79          ld   a,c
06BA: E6 0F       and  $0F
06BC: 80          add  a,b
06BD: 87          add  a,a
06BE: 5F          ld   e,a
06BF: 16 00       ld   d,$00
06C1: 21 E6 06    ld   hl,$06E6
06C4: 19          add  hl,de
06C5: E5          push hl
06C6: 7E          ld   a,(hl)
06C7: 21 83 80    ld   hl,$8083
06CA: 01 18 1A    ld   bc,$1A18
06CD: CD 5C 04    call $045C
06D0: E1          pop  hl
06D1: 23          inc  hl
06D2: 7E          ld   a,(hl)
06D3: 21 83 84    ld   hl,$8483
06D6: 01 18 1A    ld   bc,$1A18
06D9: CD 5C 04    call $045C
06DC: 01 02 02    ld   bc,$0202
06DF: 11 CF 81    ld   de,$81CF
06E2: CD 6C 04    call $046C
06E5: C9          ret

0724: FD 7E 04    ld   a,(iy+$04)
0727: E6 0F       and  $0F
0729: 87          add  a,a
072A: 5F          ld   e,a
072B: 16 00       ld   d,$00
072D: 21 B7 07    ld   hl,$07B7
0730: 19          add  hl,de
0731: 5E          ld   e,(hl)
0732: 23          inc  hl
0733: 56          ld   d,(hl)
0734: D5          push de
0735: EB          ex   de,hl
0736: 11 83 88    ld   de,$8883
0739: 01 0D 06    ld   bc,$060D
073C: C5          push bc
073D: D5          push de
073E: C5          push bc
073F: 7E          ld   a,(hl)
0740: E6 F0       and  $F0
0742: 0F          rrca
0743: 0F          rrca
0744: CD A1 07    call $07A1
0747: 7E          ld   a,(hl)
0748: E6 0F       and  $0F
074A: 87          add  a,a
074B: 87          add  a,a
074C: CD A1 07    call $07A1
074F: 23          inc  hl
0750: C1          pop  bc
0751: 10 EB       djnz $073E
0753: D1          pop  de
0754: 13          inc  de
0755: 13          inc  de
0756: C1          pop  bc
0757: 0D          dec  c
0758: 20 E2       jr   nz,$073C
075A: 21 17 0B    ld   hl,$0B17
075D: CD D4 03    call $03D4
0760: D1          pop  de
0761: 0E 0D       ld   c,$0D
0763: D9          exx
0764: 11 12 E4    ld   de,$E412
0767: 01 1F 00    ld   bc,$001F
076A: D9          exx
076B: 06 06       ld   b,$06
076D: D9          exx
076E: 62          ld   h,d
076F: 6B          ld   l,e
0770: D9          exx
0771: 1A          ld   a,(de)
0772: E6 F0       and  $F0
0774: 0F          rrca
0775: 0F          rrca
0776: 0F          rrca
0777: 0F          rrca
0778: D9          exx
0779: 77          ld   (hl),a
077A: 23          inc  hl
077B: 36 FF       ld   (hl),$FF
077D: 09          add  hl,bc
077E: D9          exx
077F: 1A          ld   a,(de)
0780: E6 0F       and  $0F
0782: D9          exx
0783: 77          ld   (hl),a
0784: 23          inc  hl
0785: 36 FF       ld   (hl),$FF
0787: 09          add  hl,bc
0788: D9          exx
0789: 13          inc  de
078A: 10 E5       djnz $0771
078C: D9          exx
078D: 13          inc  de
078E: 13          inc  de
078F: D9          exx
0790: 0D          dec  c
0791: 20 D8       jr   nz,$076B
0793: 21 2A E4    ld   hl,$E42A
0796: 11 20 00    ld   de,$0020
0799: 06 0C       ld   b,$0C
079B: CB 9E       res  3,(hl)
079D: 19          add  hl,de
079E: 10 FB       djnz $079B
07A0: C9          ret
07A1: E5          push hl
07A2: 4F          ld   c,a
07A3: 06 00       ld   b,$00
07A5: 21 D7 0A    ld   hl,$0AD7
07A8: 09          add  hl,bc
07A9: 3E 00       ld   a,$00
07AB: 01 02 02    ld   bc,$0202
07AE: CD DE 03    call $03DE
07B1: D9          exx
07B2: D5          push de
07B3: D9          exx
07B4: D1          pop  de
07B5: E1          pop  hl
07B6: C9          ret

0B20: FD 7E 04    ld   a,(iy+$04)
0B23: E6 0F       and  $0F
0B25: 87          add  a,a
0B26: 47          ld   b,a
0B27: 87          add  a,a
0B28: 87          add  a,a
0B29: 80          add  a,b
0B2A: 5F          ld   e,a
0B2B: 16 00       ld   d,$00
0B2D: 21 75 0B    ld   hl,$0B75
0B30: 19          add  hl,de
0B31: 06 05       ld   b,$05
0B33: 5E          ld   e,(hl)
0B34: 23          inc  hl
0B35: 56          ld   d,(hl)
0B36: 23          inc  hl
0B37: C5          push bc
0B38: E5          push hl
0B39: 7A          ld   a,d
0B3A: CB BA       res  7,d
0B3C: 21 00 88    ld   hl,$8800
0B3F: 19          add  hl,de
0B40: EB          ex   de,hl
0B41: 17          rla
0B42: 38 0D       jr   c,$0B51
0B44: CD 5C 0B    call $0B5C
0B47: 21 7C 00    ld   hl,$007C
0B4A: 19          add  hl,de
0B4B: EB          ex   de,hl
0B4C: CD 5C 0B    call $0B5C
0B4F: 18 06       jr   $0B57
0B51: CD 5C 0B    call $0B5C
0B54: CD 5C 0B    call $0B5C
0B57: E1          pop  hl
0B58: C1          pop  bc
0B59: 10 D8       djnz $0B33
0B5B: C9          ret
0B5C: 06 02       ld   b,$02
0B5E: C5          push bc
0B5F: 21 D9 0B    ld   hl,$0BD9
0B62: E5          push hl
0B63: CD D8 03    call $03D8
0B66: D9          exx
0B67: E1          pop  hl
0B68: CD D8 03    call $03D8
0B6B: D9          exx
0B6C: 21 82 FF    ld   hl,$FF82
0B6F: 19          add  hl,de
0B70: EB          ex   de,hl
0B71: C1          pop  bc
0B72: 10 EA       djnz $0B5E
0B74: C9          ret
0B75: C9          ret

0BE0: 3A 00 E0    ld   a,($E000)
0BE3: E6 80       and  $80
0BE5: 28 05       jr   z,$0BEC
0BE7: CD F4 02    call $02F4
0BEA: E6 06       and  $06
0BEC: 4F          ld   c,a
0BED: 87          add  a,a
0BEE: 81          add  a,c
0BEF: 4F          ld   c,a
0BF0: FD 7E 04    ld   a,(iy+$04)
0BF3: E6 0F       and  $0F
0BF5: 87          add  a,a
0BF6: 87          add  a,a
0BF7: 87          add  a,a
0BF8: 47          ld   b,a
0BF9: 87          add  a,a
0BFA: 80          add  a,b
0BFB: 81          add  a,c
0BFC: 5F          ld   e,a
0BFD: 16 00       ld   d,$00
0BFF: 21 3A 0C    ld   hl,$0C3A
0C02: 19          add  hl,de
0C03: EB          ex   de,hl
0C04: FD E5       push iy
0C06: E1          pop  hl
0C07: 01 31 00    ld   bc,$0031
0C0A: 09          add  hl,bc
0C0B: 06 06       ld   b,$06
0C0D: 36 80       ld   (hl),$80
0C0F: 23          inc  hl
0C10: 1A          ld   a,(de)
0C11: E6 F0       and  $F0
0C13: C6 08       add  a,$08
0C15: 77          ld   (hl),a
0C16: 23          inc  hl
0C17: 36 00       ld   (hl),$00
0C19: 23          inc  hl
0C1A: 1A          ld   a,(de)
0C1B: E6 0F       and  $0F
0C1D: 87          add  a,a
0C1E: 87          add  a,a
0C1F: 87          add  a,a
0C20: 87          add  a,a
0C21: 77          ld   (hl),a
0C22: 23          inc  hl
0C23: 36 00       ld   (hl),$00
0C25: 23          inc  hl
0C26: 36 00       ld   (hl),$00
0C28: 23          inc  hl
0C29: 36 00       ld   (hl),$00
0C2B: 13          inc  de
0C2C: 23          inc  hl
0C2D: 10 DE       djnz $0C0D
0C2F: 06 06       ld   b,$06
0C31: 11 07 00    ld   de,$0007
0C34: 36 00       ld   (hl),$00
0C36: 19          add  hl,de
0C37: 10 FB       djnz $0C34
0C39: C9          ret

0D2A: 3A 03 A0    ld   a,(dsw_2_a003)
0D2D: 47          ld   b,a
0D2E: E6 F0       and  $F0
0D30: 28 05       jr   z,$0D37
0D32: 78          ld   a,b
0D33: E6 0F       and  $0F
0D35: 20 13       jr   nz,$0D4A
0D37: DD CB 00 AE res  5,(ix+$00)
0D3B: 3A 00 A0    ld   a,(port_1_a000)
0D3E: CB 77       bit  6,a
0D40: CA 72 0F    jp   z,$0F72
0D43: CB 6F       bit  5,a
0D45: CA 9C 0F    jp   z,$0F9C
0D48: 18 07       jr   $0D51
0D4A: 3A 06 E0    ld   a,($E006)
0D4D: A7          and  a
0D4E: C2 DC 0E    jp   nz,$0EDC
0D51: 3A A9 E1    ld   a,($E1A9)
0D54: 17          rla
0D55: D8          ret  c
0D56: DD 7E 01    ld   a,(ix+$01)
0D59: A7          and  a
0D5A: 28 04       jr   z,$0D60
0D5C: DD 35 01    dec  (ix+$01)
0D5F: C9          ret
0D60: DD 7E 02    ld   a,(ix+$02)
0D63: FE 03       cp   $03
0D65: D2 4C 0E    jp   nc,$0E4C
0D68: FE 02       cp   $02
0D6A: D2 D2 0D    jp   nc,$0DD2
0D6D: FE 01       cp   $01
0D6F: 30 5D       jr   nc,$0DCE
0D71: DD 7E 03    ld   a,(ix+$03)
0D74: A7          and  a
0D75: 20 53       jr   nz,$0DCA
0D77: DD 34 03    inc  (ix+$03)
0D7A: DD 36 04 00 ld   (ix+$04),$00
0D7E: CD 85 04    call $0485
0D81: CD 6E 70    call $706E
0D84: CD B0 11    call $11B0
0D87: 3A 03 A0    ld   a,(dsw_2_a003)
0D8A: 47          ld   b,a
0D8B: E6 F0       and  $F0
0D8D: 28 34       jr   z,$0DC3
0D8F: 78          ld   a,b
0D90: E6 0F       and  $0F
0D92: 28 2F       jr   z,$0DC3
0D94: 21 2C 11    ld   hl,$112C
0D97: CD 03 04    call $0403
0D9A: 3A 03 A0    ld   a,(dsw_2_a003)
0D9D: E6 0F       and  $0F
0D9F: F5          push af
0DA0: 11 2C 89    ld   de,$892C
0DA3: CD FB 0F    call $0FFB
0DA6: F1          pop  af
0DA7: 47          ld   b,a
0DA8: 3A 03 A0    ld   a,(dsw_2_a003)
0DAB: E6 F0       and  $F0
0DAD: 0F          rrca
0DAE: 0F          rrca
0DAF: 0F          rrca
0DB0: 0F          rrca
0DB1: B8          cp   b
0DB2: C8          ret  z
0DB3: 11 29 89    ld   de,$8929
0DB6: CD FB 0F    call $0FFB
0DB9: 21 3B 11    ld   hl,$113B
0DBC: CD 03 04    call $0403
0DBF: CD 03 04    call $0403
0DC2: C9          ret
0DC3: 21 4C 11    ld   hl,$114C
0DC6: CD 03 04    call $0403
0DC9: C9          ret
0DCA: CD 01 70    call $7001
0DCD: C9          ret
0DCE: CD A9 70    call $70A9
0DD1: C9          ret
0DD2: DD 7E 03    ld   a,(ix+$03)
0DD5: A7          and  a
0DD6: 20 47       jr   nz,$0E1F
0DD8: DD 34 03    inc  (ix+$03)
0DDB: DD CB 00 86 res  0,(ix+$00)
0DDF: DD 36 04 FF ld   (ix+$04),$FF
0DE3: DD 36 05 01 ld   (ix+$05),$01
0DE7: CD 85 04    call $0485
0DEA: AF          xor  a
0DEB: FD 77 08    ld   (iy+$08),a
0DEE: FD 77 09    ld   (iy+$09),a
0DF1: FD 36 04 01 ld   (iy+$04),$01
0DF5: FD 77 0D    ld   (iy+$0d),a
0DF8: FD 77 16    ld   (iy+$16),a
0DFB: FD 77 17    ld   (iy+$17),a
0DFE: FD 77 1A    ld   (iy+$1a),a
0E01: CD 71 06    call $0671
0E04: CD C3 04    call $04C3
0E07: 3E 80       ld   a,$80
0E09: 32 C5 E1    ld   ($E1C5),a
0E0C: 32 12 E2    ld   ($E212),a
0E0F: 32 C2 E2    ld   ($E2C2),a
0E12: 32 00 E3    ld   ($E300),a
0E15: 21 00 E0    ld   hl,$E000
0E18: CB F6       set  6,(hl)
0E1A: DD 36 01 60 ld   (ix+$01),$60
0E1E: C9          ret
0E1F: DD CB 00 46 bit  0,(ix+$00)
0E23: 20 1B       jr   nz,$0E40
0E25: DD 35 05    dec  (ix+$05)
0E28: C0          ret  nz
0E29: DD 6E 03    ld   l,(ix+$03)
0E2C: 26 00       ld   h,$00
0E2E: 29          add  hl,hl
0E2F: 11 D2 10    ld   de,$10D2
0E32: 19          add  hl,de
0E33: 7E          ld   a,(hl)
0E34: DD 77 04    ld   (ix+$04),a
0E37: 23          inc  hl
0E38: 7E          ld   a,(hl)
0E39: DD 77 05    ld   (ix+$05),a
0E3C: DD 34 03    inc  (ix+$03)
0E3F: C9          ret
0E40: DD 34 02    inc  (ix+$02)
0E43: DD 36 03 00 ld   (ix+$03),$00
0E47: FD 36 00 00 ld   (iy+$00),$00
0E4B: C9          ret
0E4C: DD 7E 03    ld   a,(ix+$03)
0E4F: A7          and  a
0E50: 20 06       jr   nz,$0E58
0E52: CD 85 04    call $0485
0E55: CD 86 10    call $1086
0E58: DD 7E 03    ld   a,(ix+$03)
0E5B: FE 0E       cp   $0E
0E5D: 30 57       jr   nc,$0EB6
0E5F: FE 0D       cp   $0D
0E61: 30 3F       jr   nc,$0EA2
0E63: FE 08       cp   $08
0E65: 30 18       jr   nc,$0E7F
0E67: 21 8F 15    ld   hl,$158F
0E6A: CD 25 04    call $0425
0E6D: DD 34 03    inc  (ix+$03)
0E70: DD 36 01 02 ld   (ix+$01),$02
0E74: DD 7E 03    ld   a,(ix+$03)
0E77: FE 08       cp   $08
0E79: D8          ret  c
0E7A: DD 36 01 10 ld   (ix+$01),$10
0E7E: C9          ret
0E7F: D6 08       sub  $08
0E81: 87          add  a,a
0E82: 5F          ld   e,a
0E83: 16 00       ld   d,$00
0E85: 21 9B 15    ld   hl,$159B
0E88: 19          add  hl,de
0E89: 5E          ld   e,(hl)
0E8A: 23          inc  hl
0E8B: 56          ld   d,(hl)
0E8C: EB          ex   de,hl
0E8D: CD 03 04    call $0403
0E90: DD 34 03    inc  (ix+$03)
0E93: DD 36 01 04 ld   (ix+$01),$04
0E97: DD 7E 03    ld   a,(ix+$03)
0E9A: FE 0D       cp   $0D
0E9C: D8          ret  c
0E9D: DD 36 01 08 ld   (ix+$01),$08
0EA1: C9          ret
0EA2: 21 CA 15    ld   hl,$15CA
0EA5: 06 0A       ld   b,$0A
0EA7: C5          push bc
0EA8: CD 03 04    call $0403
0EAB: C1          pop  bc
0EAC: 10 F9       djnz $0EA7
0EAE: DD 34 03    inc  (ix+$03)
0EB1: DD 36 01 10 ld   (ix+$01),$10
0EB5: C9          ret

0EB6: 06 0A       ld   b,$0A
0EB8: 11 36 89    ld   de,$8936
0EBB: 21 17 E0    ld   hl,$E017
0EBE: C5          push bc
0EBF: D5          push de
0EC0: E5          push hl
0EC1: CD 11 16    call $1611
0EC4: E1          pop  hl
0EC5: 01 0A 00    ld   bc,$000A
0EC8: 09          add  hl,bc
0EC9: D1          pop  de
0ECA: 1B          dec  de
0ECB: 1B          dec  de
0ECC: C1          pop  bc
0ECD: 10 EF       djnz $0EBE
0ECF: DD 36 01 FF ld   (ix+$01),$FF
0ED3: DD 36 02 00 ld   (ix+$02),$00
0ED7: DD 36 03 00 ld   (ix+$03),$00
0EDB: C9          ret
0EDC: FE 01       cp   $01
0EDE: 20 0A       jr   nz,$0EEA
0EE0: 3A 00 A0    ld   a,(port_1_a000)
0EE3: CB 6F       bit  5,a
0EE5: CA 9C 0F    jp   z,$0F9C
0EE8: 18 0D       jr   $0EF7
0EEA: 3A 00 A0    ld   a,(port_1_a000)
0EED: CB 77       bit  6,a
0EEF: CA 72 0F    jp   z,$0F72
0EF2: CB 6F       bit  5,a
0EF4: CA 9C 0F    jp   z,$0F9C
0EF7: 3A A9 E1    ld   a,($E1A9)
0EFA: 17          rla
0EFB: D8          ret  c
0EFC: DD CB 00 6E bit  5,(ix+$00)
0F00: 20 1E       jr   nz,$0F20
0F02: DD CB 00 EE set  5,(ix+$00)
0F06: CD FF 05    call $05FF
0F09: CD 85 04    call $0485
0F0C: CD 6E 70    call $706E
0F0F: 21 59 11    ld   hl,$1159
0F12: CD 03 04    call $0403
0F15: CD 03 04    call $0403
0F18: CD 03 04    call $0403
0F1B: CD B0 11    call $11B0
0F1E: 18 05       jr   $0F25
0F20: DD CB 00 66 bit  4,(ix+$00)
0F24: C8          ret  z
0F25: DD CB 00 A6 res  4,(ix+$00)
0F29: 21 75 11    ld   hl,$1175
0F2C: 3A 06 E0    ld   a,($E006)
0F2F: 3D          dec  a
0F30: 28 03       jr   z,$0F35
0F32: 21 8D 11    ld   hl,$118D
0F35: CD 03 04    call $0403
0F38: 21 A6 11    ld   hl,$11A6
0F3B: CD 03 04    call $0403
0F3E: 3A 06 E0    ld   a,($E006)
0F41: FE 0A       cp   $0A
0F43: 38 02       jr   c,$0F47
0F45: 3E 09       ld   a,$09
0F47: 32 24 8F    ld   ($8F24),a
0F4A: 47          ld   b,a
0F4B: 3E 0B       ld   a,$0B
0F4D: 32 24 8B    ld   ($8B24),a
0F50: 11 ED 88    ld   de,$88ED
0F53: 3E 09       ld   a,$09
0F55: 90          sub  b
0F56: 28 09       jr   z,$0F61
0F58: EB          ex   de,hl
0F59: 11 20 00    ld   de,$0020
0F5C: 19          add  hl,de
0F5D: 3D          dec  a
0F5E: 20 FC       jr   nz,$0F5C
0F60: EB          ex   de,hl
0F61: C5          push bc
0F62: 08          ex   af,af'
0F63: 3E 32       ld   a,$32
0F65: 08          ex   af,af'
0F66: 3E 4D       ld   a,$4D
0F68: 01 02 02    ld   bc,$0202
0F6B: CD 42 04    call $0442
0F6E: C1          pop  bc
0F6F: 10 F0       djnz $0F61
0F71: C9          ret
0F72: 3E E0       ld   a,$E0
0F74: 32 00 E0    ld   ($E000),a
0F77: 3A 03 A0    ld   a,(dsw_2_a003)
0F7A: 47          ld   b,a
0F7B: E6 F0       and  $F0
0F7D: 28 0E       jr   z,$0F8D
0F7F: 78          ld   a,b
0F80: E6 0F       and  $0F
0F82: 28 09       jr   z,$0F8D
0F84: 3A 06 E0    ld   a,($E006)
0F87: D6 02       sub  $02
0F89: 27          daa
0F8A: 32 06 E0    ld   ($E006),a
0F8D: CD 85 04    call $0485
0F90: FD 21 1C E1 ld   iy,$E11C
0F94: CD 64 06    call $0664
0F97: CD A7 10    call $10A7
0F9A: 18 1B       jr   $0FB7
0F9C: 3E C0       ld   a,$C0
0F9E: 32 00 E0    ld   ($E000),a
0FA1: 3A 03 A0    ld   a,(dsw_2_a003)
0FA4: 47          ld   b,a
0FA5: E6 F0       and  $F0
0FA7: 28 0E       jr   z,$0FB7
0FA9: 78          ld   a,b
0FAA: E6 0F       and  $0F
0FAC: 28 09       jr   z,$0FB7
0FAE: 3A 06 E0    ld   a,($E006)
0FB1: D6 01       sub  $01
0FB3: 27          daa
0FB4: 32 06 E0    ld   ($E006),a
0FB7: CD 85 04    call $0485
0FBA: FD 21 97 E0 ld   iy,$E097
0FBE: CD 64 06    call $0664
0FC1: CD C3 04    call $04C3
0FC4: CD FF 05    call $05FF
0FC7: 32 A9 E1    ld   ($E1A9),a
0FCA: 32 B6 E1    ld   ($E1B6),a
0FCD: DD 77 00    ld   (ix+$00),a
0FD0: DD 77 01    ld   (ix+$01),a
0FD3: DD 77 02    ld   (ix+$02),a
0FD6: DD 77 03    ld   (ix+$03),a
0FD9: 3E 80       ld   a,$80
0FDB: 32 C5 E1    ld   ($E1C5),a
0FDE: 32 12 E2    ld   ($E212),a
0FE1: 32 C2 E2    ld   ($E2C2),a
0FE4: 32 00 E3    ld   ($E300),a
0FE7: 32 01 E0    ld   ($E001),a
0FEA: 3A 00 E0    ld   a,($E000)
0FED: 32 00 98    ld   ($9800),a
0FF0: 3E 25       ld   a,$25
0FF2: CD EA 02    call $02EA
0FF5: 3E 21       ld   a,$21
0FF7: CD EA 02    call $02EA
0FFA: C9          ret
0FFB: 87          add  a,a
0FFC: F5          push af
0FFD: D9          exx
0FFE: 5F          ld   e,a
0FFF: 16 00       ld   d,$00
1001: 21 2A 10    ld   hl,$102A
1004: 19          add  hl,de
1005: 5E          ld   e,(hl)
1006: 23          inc  hl
1007: 56          ld   d,(hl)
1008: EB          ex   de,hl
1009: 06 0F       ld   b,$0F
100B: 3E 09       ld   a,$09
100D: CD 0F 04    call $040F
1010: D9          exx
1011: 21 20 02    ld   hl,$0220
1014: 19          add  hl,de
1015: EB          ex   de,hl
1016: F1          pop  af
1017: 4F          ld   c,a
1018: 06 00       ld   b,$00
101A: 21 4D 02    ld   hl,$024D
101D: 09          add  hl,bc
101E: EB          ex   de,hl
101F: 1A          ld   a,(de)
1020: 77          ld   (hl),a
1021: 01 00 01    ld   bc,$0100
1024: 09          add  hl,bc
1025: 13          inc  de
1026: 1A          ld   a,(de)
1027: 77          ld   (hl),a
1028: D9          exx
1029: C9          ret

1087: 03          inc  bc
1088: A0          and  b
1089: 47          ld   b,a
108A: E6 0F       and  $0F
108C: 28 04       jr   z,$1092
108E: 78          ld   a,b
108F: E6 F0       and  $F0
1091: C0          ret  nz
1092: 21 99 10    ld   hl,$1099
1095: CD 03 04    call $0403
1098: C9          ret
1099: 22 8A 09    ld   ($098A),hl
109C: 0A          ld   a,(bc)
109D: 0F          rrca
109E: 1B          dec  de
109F: 0E 0E       ld   c,$0E
10A1: 29          add  hl,hl
10A2: 19          add  hl,de
10A3: 15          dec  d
10A4: 0A          ld   a,(bc)
10A5: 22 29 21    ld   ($2129),hl
10A8: 83          add  a,e
10A9: 8C          adc  a,h
10AA: 11 12 E6    ld   de,$E612
10AD: 3E 18       ld   a,$18
10AF: 01 1A 00    ld   bc,$001A
10B2: ED B0       ldir
10B4: 01 06 00    ld   bc,$0006
10B7: 09          add  hl,bc
10B8: 3D          dec  a
10B9: 20 F4       jr   nz,$10AF
10BB: 21 12 E4    ld   hl,$E412
10BE: 11 AF E8    ld   de,$E8AF
10C1: 3E 0C       ld   a,$0C
10C3: 01 0D 00    ld   bc,$000D
10C6: ED A0       ldi
10C8: 23          inc  hl
10C9: EA C6 10    jp   pe,$10C6
10CC: 01 06 00    ld   bc,$0006
10CF: 09          add  hl,bc
10D0: 3D          dec  a
10D1: 20 F0       jr   nz,$10C3
10D3: C9          ret

11B0: 3E 36       ld   a,$36
11B2: 08          ex   af,af'
11B3: 3E 3E       ld   a,$3E
11B5: 01 0B 02    ld   bc,$020B
11B8: 11 06 89    ld   de,$8906
11BB: CD 42 04    call $0442
11BE: 21 C5 11    ld   hl,$11C5
11C1: CD 03 04    call $0403
11C4: C9          ret

11CE: DD CB 00 76 bit  6,(ix+$00)
11D2: 20 3B       jr   nz,$120F
11D4: 21 00 E0    ld   hl,$E000
11D7: CB B6       res  6,(hl)
11D9: CD 2A 06    call $062A
11DC: C0          ret  nz
11DD: 3A 00 E0    ld   a,($E000)
11E0: 87          add  a,a
11E1: D2 C0 14    jp   nc,$14C0
11E4: CD 80 5A    call $5A80
11E7: DD CB 00 F6 set  6,(ix+$00)
11EB: DD 36 01 40 ld   (ix+$01),$40
11EF: DD 36 03 00 ld   (ix+$03),$00
11F3: FD 7E 00    ld   a,(iy+$00)
11F6: A7          and  a
11F7: 20 05       jr   nz,$11FE
11F9: DD 36 02 00 ld   (ix+$02),$00
11FD: C9          ret
11FE: CD DE 14    call $14DE
1201: 7E          ld   a,(hl)
1202: A7          and  a
1203: 28 05       jr   z,$120A
1205: DD 36 02 03 ld   (ix+$02),$03
1209: C9          ret
120A: DD 36 02 05 ld   (ix+$02),$05
120E: C9          ret
120F: DD 7E 01    ld   a,(ix+$01)
1212: A7          and  a
1213: 28 04       jr   z,$1219
1215: DD 35 01    dec  (ix+$01)
1218: C9          ret
1219: 21 01 E0    ld   hl,$E001
121C: CB FE       set  7,(hl)
121E: DD 7E 02    ld   a,(ix+$02)
1221: FE 06       cp   $06
1223: D2 C0 14    jp   nc,$14C0
1226: FE 05       cp   $05
1228: D2 A0 14    jp   nc,$14A0
122B: FE 04       cp   $04
122D: D2 78 14    jp   nc,$1478
1230: FE 03       cp   $03
1232: D2 2C 14    jp   nc,$142C
1235: FE 02       cp   $02
1237: D2 F6 13    jp   nc,$13F6
123A: FE 01       cp   $01
123C: 30 71       jr   nc,$12AF
123E: DD 7E 03    ld   a,(ix+$03)
1241: A7          and  a
1242: 20 21       jr   nz,$1265
1244: 11 51 89    ld   de,$8951
1247: 01 0B 03    ld   bc,$030B
124A: CD 6C 04    call $046C
124D: 11 51 81    ld   de,$8151
1250: 01 0B 03    ld   bc,$030B
1253: CD 6C 04    call $046C
1256: DD 36 01 10 ld   (ix+$01),$10
125A: DD 34 03    inc  (ix+$03)
125D: 3E 21       ld   a,$21
125F: 06 00       ld   b,$00
1261: CD D9 02    call $02D9
1264: C9          ret
1265: DD 7E 03    ld   a,(ix+$03)
1268: 3D          dec  a
1269: 21 71 15    ld   hl,$1571
126C: CD 25 04    call $0425
126F: DD 36 01 08 ld   (ix+$01),$08
1273: DD 34 03    inc  (ix+$03)
1276: DD 7E 03    ld   a,(ix+$03)
1279: FE 0A       cp   $0A
127B: D8          ret  c
127C: DD 36 01 DC ld   (ix+$01),$DC
1280: DD 36 03 00 ld   (ix+$03),$00
1284: CD 8B 16    call $168B
1287: 30 10       jr   nc,$1299
1289: DD 36 02 01 ld   (ix+$02),$01
128D: CD DE 14    call $14DE
1290: 7E          ld   a,(hl)
1291: A7          and  a
1292: C0          ret  nz
1293: 21 A1 E1    ld   hl,$E1A1
1296: CB FE       set  7,(hl)
1298: C9          ret
1299: CD DE 14    call $14DE
129C: 7E          ld   a,(hl)
129D: A7          and  a
129E: 28 05       jr   z,$12A5
12A0: DD 36 02 03 ld   (ix+$02),$03
12A4: C9          ret
12A5: DD 36 02 06 ld   (ix+$02),$06
12A9: 21 A1 E1    ld   hl,$E1A1
12AC: CB FE       set  7,(hl)
12AE: C9          ret
12AF: DD 7E 03    ld   a,(ix+$03)
12B2: A7          and  a
12B3: 20 03       jr   nz,$12B8
12B5: CD 85 04    call $0485
12B8: DD 7E 03    ld   a,(ix+$03)
12BB: FE 13       cp   $13
12BD: D2 CA 13    jp   nc,$13CA
12C0: FE 12       cp   $12
12C2: D2 98 13    jp   nc,$1398
12C5: FE 11       cp   $11
12C7: D2 82 13    jp   nc,$1382
12CA: FE 10       cp   $10
12CC: D2 6C 13    jp   nc,$136C
12CF: FE 0F       cp   $0F
12D1: D2 56 13    jp   nc,$1356
12D4: FE 0E       cp   $0E
12D6: 30 57       jr   nc,$132F
12D8: FE 0D       cp   $0D
12DA: 30 3F       jr   nc,$131B
12DC: FE 08       cp   $08
12DE: 30 18       jr   nc,$12F8
12E0: 21 8F 15    ld   hl,$158F
12E3: CD 25 04    call $0425
12E6: DD 34 03    inc  (ix+$03)
12E9: DD 36 01 02 ld   (ix+$01),$02
12ED: DD 7E 03    ld   a,(ix+$03)
12F0: FE 08       cp   $08
12F2: D8          ret  c
12F3: DD 36 01 10 ld   (ix+$01),$10
12F7: C9          ret
12F8: D6 08       sub  $08
12FA: 87          add  a,a
12FB: 5F          ld   e,a
12FC: 16 00       ld   d,$00
12FE: 21 9B 15    ld   hl,$159B
1301: 19          add  hl,de
1302: 5E          ld   e,(hl)
1303: 23          inc  hl
1304: 56          ld   d,(hl)
1305: EB          ex   de,hl
1306: CD 03 04    call $0403
1309: DD 34 03    inc  (ix+$03)
130C: DD 36 01 04 ld   (ix+$01),$04
1310: DD 7E 03    ld   a,(ix+$03)
1313: FE 0D       cp   $0D
1315: D8          ret  c
1316: DD 36 01 08 ld   (ix+$01),$08
131A: C9          ret
131B: 21 CA 15    ld   hl,$15CA
131E: 06 0A       ld   b,$0A
1320: C5          push bc
1321: CD 03 04    call $0403
1324: C1          pop  bc
1325: 10 F9       djnz $1320
1327: DD 34 03    inc  (ix+$03)
132A: DD 36 01 08 ld   (ix+$01),$08
132E: C9          ret
132F: 06 0A       ld   b,$0A
1331: 11 36 89    ld   de,$8936
1334: 21 17 E0    ld   hl,$E017
1337: C5          push bc
1338: D5          push de
1339: E5          push hl
133A: 3E 0A       ld   a,$0A
133C: 90          sub  b
133D: DD BE 04    cp   (ix+$04)
1340: C4 11 16    call nz,$1611
1343: E1          pop  hl
1344: 01 0A 00    ld   bc,$000A
1347: 09          add  hl,bc
1348: D1          pop  de
1349: 1B          dec  de
134A: 1B          dec  de
134B: C1          pop  bc
134C: 10 E9       djnz $1337
134E: DD 34 03    inc  (ix+$03)
1351: DD 36 01 08 ld   (ix+$01),$08
1355: C9          ret
1356: 11 36 89    ld   de,$8936
1359: 21 17 E0    ld   hl,$E017
135C: CD 2D 19    call $192D
135F: 0E 3E       ld   c,$3E
1361: CD 3B 16    call $163B
1364: DD 34 03    inc  (ix+$03)
1367: DD 36 01 04 ld   (ix+$01),$04
136B: C9          ret
136C: 11 96 8A    ld   de,$8A96
136F: 21 1D E0    ld   hl,$E01D
1372: CD 2D 19    call $192D
1375: 0E 3E       ld   c,$3E
1377: CD 4F 16    call $164F
137A: DD 34 03    inc  (ix+$03)
137D: DD 36 01 04 ld   (ix+$01),$04
1381: C9          ret
1382: 11 F6 8A    ld   de,$8AF6
1385: 21 1E E0    ld   hl,$E01E
1388: CD 2D 19    call $192D
138B: 0E 3E       ld   c,$3E
138D: CD 64 16    call $1664
1390: DD 34 03    inc  (ix+$03)
1393: DD 36 01 04 ld   (ix+$01),$04
1397: C9          ret
1398: DD 36 05 1C ld   (ix+$05),$1C
139C: DD 36 06 20 ld   (ix+$06),$20
13A0: DD 36 07 00 ld   (ix+$07),$00
13A4: DD 36 08 0A ld   (ix+$08),$0A
13A8: DD 36 09 00 ld   (ix+$09),$00
13AC: DD 36 0A 00 ld   (ix+$0a),$00
13B0: DD 36 0B 00 ld   (ix+$0b),$00
13B4: DD 36 0C 00 ld   (ix+$0c),$00
13B8: CD 60 18    call $1860
13BB: DD 34 03    inc  (ix+$03)
13BE: DD 36 01 04 ld   (ix+$01),$04
13C2: 3E 25       ld   a,$25
13C4: 06 00       ld   b,$00
13C6: CD D9 02    call $02D9
13C9: C9          ret
13CA: DD 46 05    ld   b,(ix+$05)
13CD: DD 4E 06    ld   c,(ix+$06)
13D0: 0B          dec  bc
13D1: DD 70 05    ld   (ix+$05),b
13D4: DD 71 06    ld   (ix+$06),c
13D7: 78          ld   a,b
13D8: B1          or   c
13D9: 28 09       jr   z,$13E4
13DB: CD 2B 17    call $172B
13DE: DD 7E 07    ld   a,(ix+$07)
13E1: FE 03       cp   $03
13E3: D8          ret  c
13E4: DD 36 02 02 ld   (ix+$02),$02
13E8: DD 36 01 08 ld   (ix+$01),$08
13EC: DD 36 03 00 ld   (ix+$03),$00
13F0: 3E 25       ld   a,$25
13F2: CD EA 02    call $02EA
13F5: C9          ret
13F6: DD 7E 03    ld   a,(ix+$03)
13F9: A7          and  a
13FA: 20 24       jr   nz,$1420
13FC: 11 E3 81    ld   de,$81E3
13FF: 01 05 15    ld   bc,$1505
1402: CD 6C 04    call $046C
1405: CD 0C 18    call $180C
1408: 21 A1 E1    ld   hl,$E1A1
140B: CB 7E       bit  7,(hl)
140D: 20 08       jr   nz,$1417
140F: DD 34 03    inc  (ix+$03)
1412: DD 36 01 78 ld   (ix+$01),$78
1416: C9          ret
1417: DD 36 02 06 ld   (ix+$02),$06
141B: DD 36 01 FF ld   (ix+$01),$FF
141F: C9          ret
1420: CD 85 04    call $0485
1423: DD 36 02 03 ld   (ix+$02),$03
1427: DD 36 03 00 ld   (ix+$03),$00
142B: C9          ret
142C: DD 7E 03    ld   a,(ix+$03)
142F: A7          and  a
1430: 20 1D       jr   nz,$144F
1432: CD EB 14    call $14EB
1435: 11 11 89    ld   de,$8911
1438: 01 0F 03    ld   bc,$030F
143B: CD 6C 04    call $046C
143E: 11 11 81    ld   de,$8111
1441: 01 0F 03    ld   bc,$030F
1444: CD 6C 04    call $046C
1447: DD 36 01 10 ld   (ix+$01),$10
144B: DD 34 03    inc  (ix+$03)
144E: C9          ret
144F: FE 0E       cp   $0E
1451: 30 19       jr   nc,$146C
1453: 3D          dec  a
1454: 21 7E 15    ld   hl,$157E
1457: CD 25 04    call $0425
145A: DD 36 01 08 ld   (ix+$01),$08
145E: DD 34 03    inc  (ix+$03)
1461: DD 7E 03    ld   a,(ix+$03)
1464: FE 0E       cp   $0E
1466: D8          ret  c
1467: DD 36 01 44 ld   (ix+$01),$44
146B: C9          ret
146C: DD 36 02 04 ld   (ix+$02),$04
1470: DD 36 03 00 ld   (ix+$03),$00
1474: CD 05 15    call $1505
1477: C9          ret
1478: 3A 00 E0    ld   a,($E000)
147B: E6 BF       and  $BF
147D: EE 10       xor  $10
147F: 21 02 A0    ld   hl,dsw_1_a002
1482: CB 6E       bit  5,(hl)
1484: 28 05       jr   z,$148B
1486: EE 01       xor  $01
1488: 32 00 98    ld   ($9800),a
148B: 32 00 E0    ld   ($E000),a
148E: FD 21 97 E0 ld   iy,$E097
1492: E6 10       and  $10
1494: 28 04       jr   z,$149A
1496: FD 21 1C E1 ld   iy,$E11C
149A: CD 1F 15    call $151F
149D: CD C3 04    call $04C3
14A0: CD A1 06    call $06A1
14A3: 21 00 E0    ld   hl,$E000
14A6: CB 9E       res  3,(hl)
14A8: CB F6       set  6,(hl)
14AA: 23          inc  hl
14AB: CB B6       res  6,(hl)
14AD: 3E 80       ld   a,$80
14AF: 32 C5 E1    ld   ($E1C5),a
14B2: 32 12 E2    ld   ($E212),a
14B5: 32 C2 E2    ld   ($E2C2),a
14B8: 32 00 E3    ld   ($E300),a
14BB: DD 36 00 00 ld   (ix+$00),$00
14BF: C9          ret
14C0: CD FF 05    call $05FF
14C3: 21 A1 E1    ld   hl,$E1A1
14C6: CB FE       set  7,(hl)
14C8: CB C6       set  0,(hl)
14CA: 3A 00 E0    ld   a,($E000)
14CD: E6 26       and  $26
14CF: 32 00 E0    ld   ($E000),a
14D2: 32 00 98    ld   ($9800),a
14D5: AF          xor  a
14D6: 32 01 E0    ld   ($E001),a
14D9: DD 36 00 00 ld   (ix+$00),$00
14DD: C9          ret
14DE: 21 1C E1    ld   hl,$E11C
14E1: 3A 00 E0    ld   a,($E000)
14E4: CB 67       bit  4,a
14E6: C8          ret  z
14E7: 21 97 E0    ld   hl,$E097
14EA: C9          ret
14EB: 21 11 8D    ld   hl,$8D11
14EE: 11 82 E8    ld   de,$E882
14F1: 0E 0F       ld   c,$0F
14F3: 06 03       ld   b,$03
14F5: 7E          ld   a,(hl)
14F6: 12          ld   (de),a
14F7: 13          inc  de
14F8: 23          inc  hl
14F9: 10 FA       djnz $14F5
14FB: 79          ld   a,c
14FC: 01 1D 00    ld   bc,$001D
14FF: 09          add  hl,bc
1500: 4F          ld   c,a
1501: 0D          dec  c
1502: 20 EF       jr   nz,$14F3
1504: C9          ret
1505: 21 11 8D    ld   hl,$8D11
1508: 11 82 E8    ld   de,$E882
150B: 0E 0F       ld   c,$0F
150D: 06 03       ld   b,$03
150F: 1A          ld   a,(de)
1510: 77          ld   (hl),a
1511: 13          inc  de
1512: 23          inc  hl
1513: 10 FA       djnz $150F
1515: 79          ld   a,c
1516: 01 1D 00    ld   bc,$001D
1519: 09          add  hl,bc
151A: 4F          ld   c,a
151B: 0D          dec  c
151C: 20 EF       jr   nz,$150D
151E: C9          ret
151F: CD A1 06    call $06A1
1522: 21 83 8C    ld   hl,$8C83
1525: 11 12 E6    ld   de,$E612
1528: 0E 18       ld   c,$18
152A: 06 1A       ld   b,$1A
152C: 7E          ld   a,(hl)
152D: 08          ex   af,af'
152E: 1A          ld   a,(de)
152F: 77          ld   (hl),a
1530: 08          ex   af,af'
1531: 12          ld   (de),a
1532: 13          inc  de
1533: 23          inc  hl
1534: 10 F6       djnz $152C
1536: 23          inc  hl
1537: 23          inc  hl
1538: 23          inc  hl
1539: 23          inc  hl
153A: 23          inc  hl
153B: 23          inc  hl
153C: 0D          dec  c
153D: 20 EB       jr   nz,$152A
153F: 21 83 88    ld   hl,$8883
1542: 01 18 1A    ld   bc,$1A18
1545: 3E 00       ld   a,$00
1547: CD 5C 04    call $045C
154A: 21 17 0B    ld   hl,$0B17
154D: CD D4 03    call $03D4
1550: 21 12 E4    ld   hl,$E412
1553: 11 AF E8    ld   de,$E8AF
1556: 0E 0C       ld   c,$0C
1558: 06 0D       ld   b,$0D
155A: 7E          ld   a,(hl)
155B: 08          ex   af,af'
155C: 1A          ld   a,(de)
155D: 77          ld   (hl),a
155E: 08          ex   af,af'
155F: 12          ld   (de),a
1560: 23          inc  hl
1561: 36 FF       ld   (hl),$FF
1563: 13          inc  de
1564: 23          inc  hl
1565: 10 F3       djnz $155A
1567: 23          inc  hl
1568: 23          inc  hl
1569: 23          inc  hl
156A: 23          inc  hl
156B: 23          inc  hl
156C: 23          inc  hl
156D: 0D          dec  c
156E: 20 E8       jr   nz,$1558
1570: C9          ret
1571: 72          ld   (hl),d
1572: 89          adc  a,c
1573: 2E 09       ld   l,$09
1575: 10 0A       djnz $1581
1577: 16 0E       ld   d,$0E
1579: 29          add  hl,hl
157A: 18 1F       jr   $159B
157C: 0E 1B       ld   c,$1B
157E: 32 89 3E    ld   ($3E89),a
1581: 0D          dec  c
1582: 19          add  hl,de
1583: 15          dec  d
1584: 0A          ld   a,(bc)
1585: 22 0E 1B    ld   ($1B0E),hl
1588: 29          add  hl,hl
1589: 0C          inc  c
158A: 11 0A 17    ld   de,$170A
158D: 10 0E       djnz $159D
158F: 9B          sbc  a,e
1590: 89          adc  a,c
1591: 2C          inc  l
1592: 08          ex   af,af'
1593: 11 12 2B    ld   de,$2B12
1596: 1C          inc  e
1597: 0C          inc  c
1598: 18 1B       jr   $15B5
159A: 0E A5       ld   c,$A5
159C: 15          dec  d
159D: AC          xor  h
159E: 15          dec  d
159F: B4          or   h
15A0: 15          dec  d
15A1: BB          cp   e
15A2: 15          dec  d
15A3: C3 15 B8    jp   $B815

1613: 16 D5       ld   d,$D5
1615: D9          exx
1616: D1          pop  de
1617: 21 20 00    ld   hl,$0020
161A: 19          add  hl,de
161B: EB          ex   de,hl
161C: D9          exx
161D: 3E 09       ld   a,$09
161F: 06 03       ld   b,$03
1621: CD 0F 04    call $040F
1624: D9          exx
1625: 21 20 00    ld   hl,$0020
1628: 19          add  hl,de
1629: E5          push hl
162A: D9          exx
162B: D1          pop  de
162C: CD 4D 16    call $164D
162F: EB          ex   de,hl
1630: 01 20 00    ld   bc,$0020
1633: 09          add  hl,bc
1634: EB          ex   de,hl
1635: CD 62 16    call $1662
1638: C9          ret
1639: 0E 09       ld   c,$09
163B: D5          push de
163C: E5          push hl
163D: 11 17 E0    ld   de,$E017
1640: A7          and  a
1641: ED 52       sbc  hl,de
1643: 20 02       jr   nz,$1647
1645: 0E 2C       ld   c,$2C
1647: E1          pop  hl
1648: D1          pop  de
1649: CD A1 03    call $03A1
164C: C9          ret
164D: 0E 09       ld   c,$09
164F: 23          inc  hl
1650: 23          inc  hl
1651: 23          inc  hl
1652: CB 4E       bit  1,(hl)
1654: 2B          dec  hl
1655: 2B          dec  hl
1656: 2B          dec  hl
1657: 28 02       jr   z,$165B
1659: 0E 2C       ld   c,$2C
165B: AF          xor  a
165C: 06 02       ld   b,$02
165E: CD A4 03    call $03A4
1661: C9          ret
1662: 0E 09       ld   c,$09
1664: 23          inc  hl
1665: 23          inc  hl
1666: CB 46       bit  0,(hl)
1668: 2B          dec  hl
1669: 2B          dec  hl
166A: 28 02       jr   z,$166E
166C: 0E 2C       ld   c,$2C
166E: AF          xor  a
166F: 06 02       ld   b,$02
1671: CD A4 03    call $03A4
1674: 79          ld   a,c
1675: 12          ld   (de),a
1676: E5          push hl
1677: 21 00 04    ld   hl,$0400
167A: 19          add  hl,de
167B: 36 2D       ld   (hl),$2D
167D: 21 20 00    ld   hl,$0020
1680: 19          add  hl,de
1681: EB          ex   de,hl
1682: E1          pop  hl
1683: 3E 80       ld   a,$80
1685: 06 02       ld   b,$02
1687: CD A4 03    call $03A4
168A: C9          ret
168B: FD E5       push iy
168D: D1          pop  de
168E: 13          inc  de
168F: 21 17 E0    ld   hl,$E017
1692: 01 00 0A    ld   bc,$0A00
1695: D5          push de
1696: E5          push hl
1697: C5          push bc
1698: CD 21 17    call $1721
169B: 30 0C       jr   nc,$16A9
169D: C1          pop  bc
169E: E1          pop  hl
169F: 11 0A 00    ld   de,$000A
16A2: 19          add  hl,de
16A3: D1          pop  de
16A4: 0C          inc  c
16A5: 10 EE       djnz $1695
16A7: A7          and  a
16A8: C9          ret
16A9: C1          pop  bc
16AA: DD 71 04    ld   (ix+$04),c
16AD: 3E 09       ld   a,$09
16AF: 91          sub  c
16B0: 28 0E       jr   z,$16C0
16B2: 21 70 E0    ld   hl,$E070
16B5: 11 7A E0    ld   de,$E07A
16B8: 01 0A 00    ld   bc,$000A
16BB: ED B8       lddr
16BD: 3D          dec  a
16BE: 20 F8       jr   nz,$16B8
16C0: D1          pop  de
16C1: E1          pop  hl
16C2: 01 03 00    ld   bc,$0003
16C5: ED B0       ldir
16C7: 06 03       ld   b,$03
16C9: 3E 29       ld   a,$29
16CB: 12          ld   (de),a
16CC: 13          inc  de
16CD: 10 FC       djnz $16CB
16CF: 01 03 00    ld   bc,$0003
16D2: ED B0       ldir
16D4: 21 20 E0    ld   hl,$E020
16D7: 11 0A 00    ld   de,$000A
16DA: 06 0A       ld   b,$0A
16DC: 36 00       ld   (hl),$00
16DE: 19          add  hl,de
16DF: 10 FB       djnz $16DC
16E1: 11 1D E0    ld   de,$E01D
16E4: 21 27 E0    ld   hl,$E027
16E7: 06 09       ld   b,$09
16E9: 1A          ld   a,(de)
16EA: BE          cp   (hl)
16EB: 30 02       jr   nc,$16EF
16ED: 54          ld   d,h
16EE: 5D          ld   e,l
16EF: C5          push bc
16F0: 01 0A 00    ld   bc,$000A
16F3: 09          add  hl,bc
16F4: C1          pop  bc
16F5: 10 F2       djnz $16E9
16F7: EB          ex   de,hl
16F8: 23          inc  hl
16F9: 23          inc  hl
16FA: 23          inc  hl
16FB: CB CE       set  1,(hl)
16FD: 11 1E E0    ld   de,$E01E
1700: 21 28 E0    ld   hl,$E028
1703: 06 09       ld   b,$09
1705: C5          push bc
1706: D5          push de
1707: E5          push hl
1708: 06 02       ld   b,$02
170A: CD 23 17    call $1723
170D: E1          pop  hl
170E: D1          pop  de
170F: 30 02       jr   nc,$1713
1711: 54          ld   d,h
1712: 5D          ld   e,l
1713: 01 0A 00    ld   bc,$000A
1716: 09          add  hl,bc
1717: C1          pop  bc
1718: 10 EB       djnz $1705
171A: EB          ex   de,hl
171B: 23          inc  hl
171C: 23          inc  hl
171D: CB C6       set  0,(hl)
171F: 37          scf
1720: C9          ret
1721: 06 03       ld   b,$03
1723: 1A          ld   a,(de)
1724: BE          cp   (hl)
1725: C0          ret  nz
1726: 13          inc  de
1727: 23          inc  hl
1728: 10 F9       djnz $1723
172A: C9          ret
172B: DD 7E 0B    ld   a,(ix+$0b)
172E: A7          and  a
172F: 28 05       jr   z,$1736
1731: DD 35 0B    dec  (ix+$0b)
1734: 18 3A       jr   $1770
1736: CD 00 18    call $1800
1739: CB 66       bit  4,(hl)
173B: 20 33       jr   nz,$1770
173D: DD 36 0B 20 ld   (ix+$0b),$20
1741: DD 7E 07    ld   a,(ix+$07)
1744: 57          ld   d,a
1745: 0F          rrca
1746: 0F          rrca
1747: 0F          rrca
1748: 4F          ld   c,a
1749: 06 00       ld   b,$00
174B: 21 16 8E    ld   hl,$8E16
174E: 09          add  hl,bc
174F: EB          ex   de,hl
1750: 4C          ld   c,h
1751: 21 1A E0    ld   hl,$E01A
1754: 09          add  hl,bc
1755: CD 2D 19    call $192D
1758: DD 7E 08    ld   a,(ix+$08)
175B: 12          ld   (de),a
175C: 77          ld   (hl),a
175D: 11 00 FC    ld   de,$FC00
1760: 19          add  hl,de
1761: 36 3E       ld   (hl),$3E
1763: DD 34 07    inc  (ix+$07)
1766: DD 7E 07    ld   a,(ix+$07)
1769: FE 03       cp   $03
176B: D0          ret  nc
176C: DD 36 08 0A ld   (ix+$08),$0A
1770: DD 7E 0C    ld   a,(ix+$0c)
1773: A7          and  a
1774: 28 05       jr   z,$177B
1776: DD 35 0C    dec  (ix+$0c)
1779: 18 32       jr   $17AD
177B: CD 00 18    call $1800
177E: 7E          ld   a,(hl)
177F: 2F          cpl
1780: E6 0F       and  $0F
1782: 28 29       jr   z,$17AD
1784: DD 36 0C 0F ld   (ix+$0c),$0F
1788: E6 06       and  $06
178A: 28 10       jr   z,$179C
178C: DD 34 08    inc  (ix+$08)
178F: DD 7E 08    ld   a,(ix+$08)
1792: FE 2A       cp   $2A
1794: 38 14       jr   c,$17AA
1796: DD 36 08 0A ld   (ix+$08),$0A
179A: 18 0E       jr   $17AA
179C: DD 35 08    dec  (ix+$08)
179F: DD 7E 08    ld   a,(ix+$08)
17A2: FE 0A       cp   $0A
17A4: 30 04       jr   nc,$17AA
17A6: DD 36 08 29 ld   (ix+$08),$29
17AA: CD 43 18    call $1843
17AD: DD 34 09    inc  (ix+$09)
17B0: DD 7E 09    ld   a,(ix+$09)
17B3: E6 1F       and  $1F
17B5: 28 31       jr   z,$17E8
17B7: FE 14       cp   $14
17B9: 20 33       jr   nz,$17EE
17BB: 11 36 89    ld   de,$8936
17BE: CD 2D 19    call $192D
17C1: 01 06 01    ld   bc,$0106
17C4: CD 6C 04    call $046C
17C7: 21 A0 00    ld   hl,$00A0
17CA: 19          add  hl,de
17CB: EB          ex   de,hl
17CC: 01 08 01    ld   bc,$0108
17CF: CD 6C 04    call $046C
17D2: DD 7E 07    ld   a,(ix+$07)
17D5: 0F          rrca
17D6: 0F          rrca
17D7: 0F          rrca
17D8: 5F          ld   e,a
17D9: 16 00       ld   d,$00
17DB: 21 16 8E    ld   hl,$8E16
17DE: 19          add  hl,de
17DF: EB          ex   de,hl
17E0: CD 2D 19    call $192D
17E3: EB          ex   de,hl
17E4: 36 29       ld   (hl),$29
17E6: 18 06       jr   $17EE
17E8: CD 0C 18    call $180C
17EB: CD 43 18    call $1843
17EE: DD 34 0A    inc  (ix+$0a)
17F1: DD 7E 0A    ld   a,(ix+$0a)
17F4: FE 18       cp   $18
17F6: 38 04       jr   c,$17FC
17F8: DD 36 0A 00 ld   (ix+$0a),$00
17FC: CD 60 18    call $1860
17FF: C9          ret
1800: 21 00 A0    ld   hl,port_1_a000
1803: 3A 00 E0    ld   a,($E000)
1806: 1F          rra
1807: D0          ret  nc
1808: 21 01 A0    ld   hl,port_2_a001
180B: C9          ret
180C: 11 36 89    ld   de,$8936
180F: 21 17 E0    ld   hl,$E017
1812: CD 2D 19    call $192D
1815: 0E 3E       ld   c,$3E
1817: CD 3B 16    call $163B
181A: D5          push de
181B: D9          exx
181C: D1          pop  de
181D: 21 20 00    ld   hl,$0020
1820: 19          add  hl,de
1821: EB          ex   de,hl
1822: D9          exx
1823: 3E 3E       ld   a,$3E
1825: 06 03       ld   b,$03
1827: CD 0F 04    call $040F
182A: D9          exx
182B: 21 20 00    ld   hl,$0020
182E: 19          add  hl,de
182F: E5          push hl
1830: D9          exx
1831: D1          pop  de
1832: 0E 3E       ld   c,$3E
1834: CD 4F 16    call $164F
1837: EB          ex   de,hl
1838: 01 20 00    ld   bc,$0020
183B: 09          add  hl,bc
183C: EB          ex   de,hl
183D: 0E 3E       ld   c,$3E
183F: CD 64 16    call $1664
1842: C9          ret
1843: DD 7E 07    ld   a,(ix+$07)
1846: 0F          rrca
1847: 0F          rrca
1848: 0F          rrca
1849: 5F          ld   e,a
184A: 16 00       ld   d,$00
184C: 21 16 8A    ld   hl,$8A16
184F: 19          add  hl,de
1850: EB          ex   de,hl
1851: CD 2D 19    call $192D
1854: EB          ex   de,hl
1855: 36 22       ld   (hl),$22
1857: 11 00 04    ld   de,$0400
185A: 19          add  hl,de
185B: DD 7E 08    ld   a,(ix+$08)
185E: 77          ld   (hl),a
185F: C9          ret
1860: DD 7E 0A    ld   a,(ix+$0a)
1863: 47          ld   b,a
1864: E6 07       and  $07
1866: C0          ret  nz
1867: 78          ld   a,b
1868: 0F          rrca
1869: 0F          rrca
186A: 0F          rrca
186B: 4F          ld   c,a
186C: 78          ld   a,b
186D: 87          add  a,a
186E: 91          sub  c
186F: 5F          ld   e,a
1870: DD 7E 07    ld   a,(ix+$07)
1873: 57          ld   d,a
1874: 87          add  a,a
1875: 87          add  a,a
1876: 4F          ld   c,a
1877: 87          add  a,a
1878: 47          ld   b,a
1879: 87          add  a,a
187A: 87          add  a,a
187B: 80          add  a,b
187C: 81          add  a,c
187D: 82          add  a,d
187E: 83          add  a,e
187F: 5F          ld   e,a
1880: 16 00       ld   d,$00
1882: 21 A6 18    ld   hl,$18A6
1885: 19          add  hl,de
1886: E5          push hl
1887: 11 F5 81    ld   de,$81F5
188A: CD 2D 19    call $192D
188D: E1          pop  hl
188E: D5          push de
188F: D9          exx
1890: D1          pop  de
1891: D9          exx
1892: 3E 87       ld   a,$87
1894: 01 05 03    ld   bc,$0305
1897: CD E2 03    call $03E2
189A: 21 21 00    ld   hl,$0021
189D: 19          add  hl,de
189E: EB          ex   de,hl
189F: 01 03 01    ld   bc,$0103
18A2: CD 6C 04    call $046C
18A5: C9          ret

192D: DD 7E 04    ld   a,(ix+$04)
1930: A7          and  a
1931: C8          ret  z
1932: 01 0A 00    ld   bc,$000A
1935: 09          add  hl,bc
1936: 1B          dec  de
1937: 1B          dec  de
1938: 3D          dec  a
1939: 20 FA       jr   nz,$1935
193B: C9          ret

193C: AF          xor  a
193D: 32 A9 E1    ld   ($E1A9),a
1940: DD CB 00 76 bit  6,(ix+$00)
1944: 20 13       jr   nz,$1959
1946: DD CB 00 F6 set  6,(ix+$00)
194A: DD 36 01 B4 ld   (ix+$01),$B4
194E: CD 80 5A    call $5A80
1951: 3E 22       ld   a,$22
1953: 06 00       ld   b,$00
1955: CD D9 02    call $02D9
1958: C9          ret
1959: DD 7E 01    ld   a,(ix+$01)
195C: A7          and  a
195D: 28 04       jr   z,$1963
195F: DD 35 01    dec  (ix+$01)
1962: C9          ret
1963: 3A 01 E0    ld   a,($E001)
1966: E6 20       and  $20
1968: C0          ret  nz
1969: 21 00 E0    ld   hl,$E000
196C: CB B6       res  6,(hl)
196E: CD 2A 06    call $062A
1971: C0          ret  nz
1972: 3A 00 E0    ld   a,($E000)
1975: 87          add  a,a
1976: 38 0A       jr   c,$1982
1978: 21 A1 E1    ld   hl,$E1A1
197B: CB C6       set  0,(hl)
197D: DD 36 00 00 ld   (ix+$00),$00
1981: C9          ret
1982: DD CB 00 6E bit  5,(ix+$00)
1986: 28 12       jr   z,$199A
1988: DD CB 00 66 bit  4,(ix+$00)
198C: 20 08       jr   nz,$1996
198E: DD CB 00 E6 set  4,(ix+$00)
1992: DD 36 02 00 ld   (ix+$02),$00
1996: CD A5 73    call $73A5
1999: C9          ret
199A: DD CB 00 5E bit  3,(ix+$00)
199E: 28 12       jr   z,$19B2
19A0: DD CB 00 56 bit  2,(ix+$00)
19A4: 20 08       jr   nz,$19AE
19A6: DD CB 00 D6 set  2,(ix+$00)
19AA: DD 36 02 00 ld   (ix+$02),$00
19AE: CD 90 75    call $7590
19B1: C9          ret
19B2: DD CB 00 46 bit  0,(ix+$00)
19B6: 20 27       jr   nz,$19DF
19B8: DD CB 00 C6 set  0,(ix+$00)
19BC: DD 36 02 00 ld   (ix+$02),$00
19C0: DD 36 03 00 ld   (ix+$03),$00
19C4: FD 7E 04    ld   a,(iy+$04)
19C7: E6 0F       and  $0F
19C9: 28 0F       jr   z,$19DA
19CB: FE 03       cp   $03
19CD: 28 07       jr   z,$19D6
19CF: FE 06       cp   $06
19D1: 28 03       jr   z,$19D6
19D3: FE 09       cp   $09
19D5: C0          ret  nz
19D6: DD 34 02    inc  (ix+$02)
19D9: C9          ret
19DA: DD 36 02 06 ld   (ix+$02),$06
19DE: C9          ret
19DF: DD 7E 02    ld   a,(ix+$02)
19E2: A7          and  a
19E3: 28 0C       jr   z,$19F1
19E5: FE 06       cp   $06
19E7: 30 04       jr   nc,$19ED
19E9: CD 6A 79    call $796A
19EC: C9          ret
19ED: CD E1 7A    call $7AE1
19F0: C9          ret
19F1: FD 7E 04    ld   a,(iy+$04)
19F4: C6 01       add  a,$01
19F6: 27          daa
19F7: FD 77 04    ld   (iy+$04),a
19FA: 21 85 04    ld   hl,$0485
19FD: 06 1A       ld   b,$1A
19FF: AF          xor  a
1A00: 86          add  a,(hl)
1A01: 23          inc  hl
1A02: 10 FC       djnz $1A00
1A04: 21 47 05    ld   hl,$0547
1A07: 06 08       ld   b,$08
1A09: 86          add  a,(hl)
1A0A: 23          inc  hl
1A0B: 10 FC       djnz $1A09
1A0D: FE 4F       cp   $4F
1A0F: 20 06       jr   nz,$1A17
1A11: FD 34 08    inc  (iy+$08)
1A14: FD 34 09    inc  (iy+$09)
1A17: FD 34 00    inc  (iy+$00)
1A1A: CD 76 1A    call $1A76
1A1D: FE 05       cp   $05
1A1F: 38 02       jr   c,$1A23
1A21: 3E 04       ld   a,$04
1A23: 5F          ld   e,a
1A24: 16 00       ld   d,$00
1A26: 21 71 1A    ld   hl,$1A71
1A29: 19          add  hl,de
1A2A: 7E          ld   a,(hl)
1A2B: FD 77 0A    ld   (iy+$0a),a
1A2E: FD 36 0B 9F ld   (iy+$0b),$9F
1A32: FD E5       push iy
1A34: D1          pop  de
1A35: 21 1C 00    ld   hl,$001C
1A38: 19          add  hl,de
1A39: EB          ex   de,hl
1A3A: 01 23 00    ld   bc,$0023
1A3D: 09          add  hl,bc
1A3E: 01 0E 00    ld   bc,$000E
1A41: ED B0       ldir
1A43: EB          ex   de,hl
1A44: 36 00       ld   (hl),$00
1A46: 54          ld   d,h
1A47: 5D          ld   e,l
1A48: 13          inc  de
1A49: 01 06 00    ld   bc,$0006
1A4C: ED B0       ldir
1A4E: CD 85 04    call $0485
1A51: CD 8E 06    call $068E
1A54: 21 00 E0    ld   hl,$E000
1A57: CB 9E       res  3,(hl)
1A59: CB F6       set  6,(hl)
1A5B: 23          inc  hl
1A5C: CB B6       res  6,(hl)
1A5E: 3E 80       ld   a,$80
1A60: 32 C5 E1    ld   ($E1C5),a
1A63: 32 12 E2    ld   ($E212),a
1A66: 32 C2 E2    ld   ($E2C2),a
1A69: 32 00 E3    ld   ($E300),a
1A6C: DD 36 00 00 ld   (ix+$00),$00
1A70: C9          ret
1A71: 06 06       ld   b,$06
1A73: 08          ex   af,af'
1A74: 08          ex   af,af'
1A75: 08          ex   af,af'
1A76: FD 7E 08    ld   a,(iy+$08)
1A79: 21 00 E0    ld   hl,$E000
1A7C: CB 7E       bit  7,(hl)
1A7E: C8          ret  z
1A7F: FE 40       cp   $40
1A81: D0          ret  nc
1A82: 4F          ld   c,a
1A83: 3A 02 A0    ld   a,(dsw_1_a002)
1A86: E6 03       and  $03
1A88: 28 09       jr   z,$1A93
1A8A: FE 03       cp   $03
1A8C: 28 0B       jr   z,$1A99
1A8E: 79          ld   a,c
1A8F: 87          add  a,a
1A90: C6 01       add  a,$01
1A92: C9          ret
1A93: 79          ld   a,c
1A94: 87          add  a,a
1A95: 87          add  a,a
1A96: C6 03       add  a,$03
1A98: C9          ret
1A99: 79          ld   a,c
1A9A: C9          ret
1A9B: DD 56 01    ld   d,(ix+$01)
1A9E: DD 5E 03    ld   e,(ix+$03)
1AA1: CD 89 1D    call $1D89
1AA4: 06 01       ld   b,$01
1AA6: CD 87 1B    call $1B87
1AA9: DD 71 0B    ld   (ix+$0b),c
1AAC: 23          inc  hl
1AAD: CD 71 1B    call $1B71
1AB0: DD 71 0C    ld   (ix+$0c),c
1AB3: 11 E0 FF    ld   de,$FFE0
1AB6: 19          add  hl,de
1AB7: 05          dec  b
1AB8: CD 71 1B    call $1B71
1ABB: DD 71 0A    ld   (ix+$0a),c
1ABE: 2B          dec  hl
1ABF: CD 87 1B    call $1B87
1AC2: DD 71 09    ld   (ix+$09),c
1AC5: DD 7E 07    ld   a,(ix+$07)
1AC8: F6 04       or   $04
1ACA: EE 08       xor  $08
1ACC: DD 77 07    ld   (ix+$07),a
1ACF: C9          ret
1AD0: DD 56 01    ld   d,(ix+$01)
1AD3: DD 5E 03    ld   e,(ix+$03)
1AD6: CD 89 1D    call $1D89
1AD9: 06 04       ld   b,$04
1ADB: CD 87 1B    call $1B87
1ADE: DD 71 0C    ld   (ix+$0c),c
1AE1: 2B          dec  hl
1AE2: CD 71 1B    call $1B71
1AE5: DD 71 0B    ld   (ix+$0b),c
1AE8: 11 E0 FF    ld   de,$FFE0
1AEB: 19          add  hl,de
1AEC: 04          inc  b
1AED: CD 71 1B    call $1B71
1AF0: DD 71 09    ld   (ix+$09),c
1AF3: 23          inc  hl
1AF4: CD 87 1B    call $1B87
1AF7: DD 71 0A    ld   (ix+$0a),c
1AFA: DD 7E 07    ld   a,(ix+$07)
1AFD: F6 04       or   $04
1AFF: EE 08       xor  $08
1B01: DD 77 07    ld   (ix+$07),a
1B04: C9          ret
1B05: DD 56 01    ld   d,(ix+$01)
1B08: DD 5E 03    ld   e,(ix+$03)
1B0B: CD 89 1D    call $1D89
1B0E: 06 02       ld   b,$02
1B10: CD 87 1B    call $1B87
1B13: DD 71 0A    ld   (ix+$0a),c
1B16: 2B          dec  hl
1B17: 04          inc  b
1B18: CD 87 1B    call $1B87
1B1B: DD 71 09    ld   (ix+$09),c
1B1E: 11 20 00    ld   de,$0020
1B21: 19          add  hl,de
1B22: CD 71 1B    call $1B71
1B25: DD 71 0B    ld   (ix+$0b),c
1B28: 23          inc  hl
1B29: 05          dec  b
1B2A: CD 71 1B    call $1B71
1B2D: DD 71 0C    ld   (ix+$0c),c
1B30: DD 7E 07    ld   a,(ix+$07)
1B33: F6 04       or   $04
1B35: EE 08       xor  $08
1B37: DD 77 07    ld   (ix+$07),a
1B3A: C9          ret
1B3B: DD 56 01    ld   d,(ix+$01)
1B3E: DD 5E 03    ld   e,(ix+$03)
1B41: CD 89 1D    call $1D89
1B44: 06 07       ld   b,$07
1B46: CD 87 1B    call $1B87
1B49: DD 71 0C    ld   (ix+$0c),c
1B4C: 2B          dec  hl
1B4D: 05          dec  b
1B4E: CD 87 1B    call $1B87
1B51: DD 71 0B    ld   (ix+$0b),c
1B54: 11 E0 FF    ld   de,$FFE0
1B57: 19          add  hl,de
1B58: CD 71 1B    call $1B71
1B5B: DD 71 09    ld   (ix+$09),c
1B5E: 23          inc  hl
1B5F: 04          inc  b
1B60: CD 71 1B    call $1B71
1B63: DD 71 0A    ld   (ix+$0a),c
1B66: DD 7E 07    ld   a,(ix+$07)
1B69: F6 04       or   $04
1B6B: EE 08       xor  $08
1B6D: DD 77 07    ld   (ix+$07),a
1B70: C9          ret
1B71: 78          ld   a,b
1B72: 87          add  a,a
1B73: 87          add  a,a
1B74: 5F          ld   e,a
1B75: 16 00       ld   d,$00
1B77: E5          push hl
1B78: 21 C1 1B    ld   hl,$1BC1
1B7B: 19          add  hl,de
1B7C: EB          ex   de,hl
1B7D: E1          pop  hl
1B7E: 0E 04       ld   c,$04
1B80: 1A          ld   a,(de)
1B81: BE          cp   (hl)
1B82: C8          ret  z
1B83: 13          inc  de
1B84: 0D          dec  c
1B85: 20 F9       jr   nz,$1B80
1B87: 7E          ld   a,(hl)
1B88: 4F          ld   c,a
1B89: D6 77       sub  $77
1B8B: D8          ret  c
1B8C: FE 1D       cp   $1D
1B8E: 30 10       jr   nc,$1BA0
1B90: 87          add  a,a
1B91: 87          add  a,a
1B92: 87          add  a,a
1B93: 80          add  a,b
1B94: D9          exx
1B95: 5F          ld   e,a
1B96: 16 00       ld   d,$00
1B98: 21 E1 1B    ld   hl,$1BE1
1B9B: 19          add  hl,de
1B9C: 7E          ld   a,(hl)
1B9D: D9          exx
1B9E: 77          ld   (hl),a
1B9F: C9          ret
1BA0: FE 25       cp   $25
1BA2: 30 0E       jr   nc,$1BB2
1BA4: D6 1D       sub  $1D
1BA6: D9          exx
1BA7: 5F          ld   e,a
1BA8: 16 00       ld   d,$00
1BAA: 21 C9 1C    ld   hl,$1CC9
1BAD: 19          add  hl,de
1BAE: 7E          ld   a,(hl)
1BAF: D9          exx
1BB0: 77          ld   (hl),a
1BB1: C9          ret
1BB2: D6 25       sub  $25
1BB4: 1F          rra
1BB5: D9          exx
1BB6: 5F          ld   e,a
1BB7: 16 00       ld   d,$00
1BB9: 21 D1 1C    ld   hl,$1CD1
1BBC: 19          add  hl,de
1BBD: 7E          ld   a,(hl)
1BBE: D9          exx
1BBF: 77          ld   (hl),a
1BC0: C9          ret

1D03: DD CB 10 9E res  3,(ix+$10)
1D07: DD 7E 10    ld   a,(ix+$10)
1D0A: E6 06       and  $06
1D0C: 28 29       jr   z,$1D37
1D0E: FE 02       cp   $02
1D10: 28 19       jr   z,$1D2B
1D12: FE 04       cp   $04
1D14: 28 0C       jr   z,$1D22
1D16: DD 56 01    ld   d,(ix+$01)
1D19: 15          dec  d
1D1A: DD 7E 03    ld   a,(ix+$03)
1D1D: D6 08       sub  $08
1D1F: 5F          ld   e,a
1D20: 18 1C       jr   $1D3E
1D22: DD 56 01    ld   d,(ix+$01)
1D25: 15          dec  d
1D26: DD 5E 03    ld   e,(ix+$03)
1D29: 18 13       jr   $1D3E
1D2B: DD 7E 01    ld   a,(ix+$01)
1D2E: D6 08       sub  $08
1D30: 57          ld   d,a
1D31: DD 5E 03    ld   e,(ix+$03)
1D34: 1D          dec  e
1D35: 18 07       jr   $1D3E
1D37: DD 56 01    ld   d,(ix+$01)
1D3A: DD 5E 03    ld   e,(ix+$03)
1D3D: 1D          dec  e
1D3E: CD 89 1D    call $1D89
1D41: DD 7E 09    ld   a,(ix+$09)
1D44: CD 5C 1D    call $1D5C
1D47: 23          inc  hl
1D48: DD 7E 0A    ld   a,(ix+$0a)
1D4B: CD 5C 1D    call $1D5C
1D4E: 11 1F 00    ld   de,$001F
1D51: 19          add  hl,de
1D52: DD 7E 0B    ld   a,(ix+$0b)
1D55: CD 5C 1D    call $1D5C
1D58: 23          inc  hl
1D59: DD 7E 0C    ld   a,(ix+$0c)
1D5C: FE 76       cp   $76
1D5E: D8          ret  c
1D5F: FE 94       cp   $94
1D61: D0          ret  nc
1D62: 47          ld   b,a
1D63: 7E          ld   a,(hl)
1D64: FE 94       cp   $94
1D66: D8          ret  c
1D67: 70          ld   (hl),b
1D68: C9          ret
1D69: DD 7E 07    ld   a,(ix+$07)
1D6C: 47          ld   b,a
1D6D: E6 03       and  $03
1D6F: DD 77 07    ld   (ix+$07),a
1D72: 78          ld   a,b
1D73: E6 18       and  $18
1D75: FE 18       cp   $18
1D77: C0          ret  nz
1D78: DD 7E 00    ld   a,(ix+$00)
1D7B: E6 03       and  $03
1D7D: 28 B8       jr   z,$1D37
1D7F: FE 01       cp   $01
1D81: 28 A8       jr   z,$1D2B
1D83: FE 02       cp   $02
1D85: 28 9B       jr   z,$1D22
1D87: 18 8D       jr   $1D16
1D89: 7A          ld   a,d
1D8A: E6 F8       and  $F8
1D8C: 6F          ld   l,a
1D8D: 26 00       ld   h,$00
1D8F: 29          add  hl,hl
1D90: 29          add  hl,hl
1D91: 7B          ld   a,e
1D92: E6 F8       and  $F8
1D94: 0F          rrca
1D95: 0F          rrca
1D96: 0F          rrca
1D97: B5          or   l
1D98: 6F          ld   l,a
1D99: 11 00 88    ld   de,$8800
1D9C: 19          add  hl,de
1D9D: EB          ex   de,hl
1D9E: 21 00 04    ld   hl,$0400
1DA1: 19          add  hl,de
1DA2: C9          ret
1DA3: DD 7E 01    ld   a,(ix+$01)
1DA6: D6 20       sub  $20
1DA8: E6 F0       and  $F0
1DAA: 6F          ld   l,a
1DAB: DD 7E 03    ld   a,(ix+$03)
1DAE: D6 18       sub  $18
1DB0: E6 F0       and  $F0
1DB2: 0F          rrca
1DB3: 0F          rrca
1DB4: 0F          rrca
1DB5: 0F          rrca
1DB6: B5          or   l
1DB7: 6F          ld   l,a
1DB8: 26 00       ld   h,$00
1DBA: 29          add  hl,hl
1DBB: 11 12 E4    ld   de,$E412
1DBE: 19          add  hl,de
1DBF: C9          ret
1DC0: 7A          ld   a,d
1DC1: D6 20       sub  $20
1DC3: E6 F0       and  $F0
1DC5: 6F          ld   l,a
1DC6: 7B          ld   a,e
1DC7: 18 E5       jr   $1DAE
1DC9: 21 01 E0    ld   hl,$E001
1DCC: CB C6       set  0,(hl)
1DCE: CD A3 1D    call $1DA3
1DD1: CD 1E 1F    call $1F1E
1DD4: 7E          ld   a,(hl)
1DD5: E6 0D       and  $0D
1DD7: C0          ret  nz
1DD8: 44          ld   b,h
1DD9: 4D          ld   c,l
1DDA: DD 56 01    ld   d,(ix+$01)
1DDD: DD 7E 03    ld   a,(ix+$03)
1DE0: C6 03       add  a,$03
1DE2: 5F          ld   e,a
1DE3: CD 89 1D    call $1D89
1DE6: EB          ex   de,hl
1DE7: 60          ld   h,b
1DE8: 69          ld   l,c
1DE9: 1A          ld   a,(de)
1DEA: FE 88       cp   $88
1DEC: 28 0D       jr   z,$1DFB
1DEE: FE 76       cp   $76
1DF0: 28 09       jr   z,$1DFB
1DF2: FE 8B       cp   $8B
1DF4: 20 08       jr   nz,$1DFE
1DF6: CD 15 1F    call $1F15
1DF9: 18 03       jr   $1DFE
1DFB: CD 27 1F    call $1F27
1DFE: EB          ex   de,hl
1DFF: 01 E0 FF    ld   bc,$FFE0
1E02: 09          add  hl,bc
1E03: EB          ex   de,hl
1E04: 47          ld   b,a
1E05: 1A          ld   a,(de)
1E06: FE 88       cp   $88
1E08: 28 11       jr   z,$1E1B
1E0A: FE 89       cp   $89
1E0C: 28 09       jr   z,$1E17
1E0E: FE 76       cp   $76
1E10: C0          ret  nz
1E11: B8          cp   b
1E12: 20 07       jr   nz,$1E1B
1E14: CD 33 1F    call $1F33
1E17: CD 15 1F    call $1F15
1E1A: C9          ret
1E1B: CD 33 1F    call $1F33
1E1E: C9          ret
1E1F: 21 01 E0    ld   hl,$E001
1E22: CB C6       set  0,(hl)
1E24: CD A3 1D    call $1DA3
1E27: CD 15 1F    call $1F15
1E2A: 7E          ld   a,(hl)
1E2B: E6 07       and  $07
1E2D: C0          ret  nz
1E2E: 44          ld   b,h
1E2F: 4D          ld   c,l
1E30: DD 56 01    ld   d,(ix+$01)
1E33: DD 7E 03    ld   a,(ix+$03)
1E36: D6 04       sub  $04
1E38: 5F          ld   e,a
1E39: CD 89 1D    call $1D89
1E3C: EB          ex   de,hl
1E3D: 60          ld   h,b
1E3E: 69          ld   l,c
1E3F: 1A          ld   a,(de)
1E40: FE 8A       cp   $8A
1E42: 28 0D       jr   z,$1E51
1E44: FE 76       cp   $76
1E46: 28 09       jr   z,$1E51
1E48: FE 8B       cp   $8B
1E4A: 20 08       jr   nz,$1E54
1E4C: CD 1E 1F    call $1F1E
1E4F: 18 03       jr   $1E54
1E51: CD 27 1F    call $1F27
1E54: EB          ex   de,hl
1E55: 01 E0 FF    ld   bc,$FFE0
1E58: 09          add  hl,bc
1E59: EB          ex   de,hl
1E5A: 47          ld   b,a
1E5B: 1A          ld   a,(de)
1E5C: FE 8A       cp   $8A
1E5E: 28 11       jr   z,$1E71
1E60: FE 89       cp   $89
1E62: 28 09       jr   z,$1E6D
1E64: FE 76       cp   $76
1E66: C0          ret  nz
1E67: B8          cp   b
1E68: 20 07       jr   nz,$1E71
1E6A: CD 33 1F    call $1F33
1E6D: CD 1E 1F    call $1F1E
1E70: C9          ret
1E71: CD 33 1F    call $1F33
1E74: C9          ret
1E75: 21 01 E0    ld   hl,$E001
1E78: CB C6       set  0,(hl)
1E7A: CD A3 1D    call $1DA3
1E7D: CD 33 1F    call $1F33
1E80: 7E          ld   a,(hl)
1E81: E6 0E       and  $0E
1E83: C0          ret  nz
1E84: 44          ld   b,h
1E85: 4D          ld   c,l
1E86: DD 7E 01    ld   a,(ix+$01)
1E89: C6 03       add  a,$03
1E8B: 57          ld   d,a
1E8C: DD 5E 03    ld   e,(ix+$03)
1E8F: CD 89 1D    call $1D89
1E92: EB          ex   de,hl
1E93: 60          ld   h,b
1E94: 69          ld   l,c
1E95: 1A          ld   a,(de)
1E96: FE 8B       cp   $8B
1E98: 28 10       jr   z,$1EAA
1E9A: FE 88       cp   $88
1E9C: 28 07       jr   z,$1EA5
1E9E: FE 76       cp   $76
1EA0: 20 0B       jr   nz,$1EAD
1EA2: CD 15 1F    call $1F15
1EA5: CD 27 1F    call $1F27
1EA8: 18 03       jr   $1EAD
1EAA: CD 15 1F    call $1F15
1EAD: 1B          dec  de
1EAE: 1A          ld   a,(de)
1EAF: FE 8B       cp   $8B
1EB1: 28 0E       jr   z,$1EC1
1EB3: FE 8A       cp   $8A
1EB5: 28 06       jr   z,$1EBD
1EB7: FE 76       cp   $76
1EB9: C0          ret  nz
1EBA: CD 1E 1F    call $1F1E
1EBD: CD 27 1F    call $1F27
1EC0: C9          ret
1EC1: CD 1E 1F    call $1F1E
1EC4: C9          ret
1EC5: 21 01 E0    ld   hl,$E001
1EC8: CB C6       set  0,(hl)
1ECA: CD A3 1D    call $1DA3
1ECD: CD 27 1F    call $1F27
1ED0: 7E          ld   a,(hl)
1ED1: E6 0B       and  $0B
1ED3: C0          ret  nz
1ED4: 44          ld   b,h
1ED5: 4D          ld   c,l
1ED6: DD 7E 01    ld   a,(ix+$01)
1ED9: D6 04       sub  $04
1EDB: 57          ld   d,a
1EDC: DD 5E 03    ld   e,(ix+$03)
1EDF: CD 89 1D    call $1D89
1EE2: EB          ex   de,hl
1EE3: 60          ld   h,b
1EE4: 69          ld   l,c
1EE5: 1A          ld   a,(de)
1EE6: FE 89       cp   $89
1EE8: 28 10       jr   z,$1EFA
1EEA: FE 88       cp   $88
1EEC: 28 07       jr   z,$1EF5
1EEE: FE 76       cp   $76
1EF0: 20 0B       jr   nz,$1EFD
1EF2: CD 15 1F    call $1F15
1EF5: CD 33 1F    call $1F33
1EF8: 18 03       jr   $1EFD
1EFA: CD 15 1F    call $1F15
1EFD: 1B          dec  de
1EFE: 1A          ld   a,(de)
1EFF: FE 89       cp   $89
1F01: 28 0E       jr   z,$1F11
1F03: FE 8A       cp   $8A
1F05: 28 06       jr   z,$1F0D
1F07: FE 76       cp   $76
1F09: C0          ret  nz
1F0A: CD 1E 1F    call $1F1E
1F0D: CD 33 1F    call $1F33
1F10: C9          ret
1F11: CD 1E 1F    call $1F1E
1F14: C9          ret
1F15: 23          inc  hl
1F16: 23          inc  hl
1F17: CB CE       set  1,(hl)
1F19: 2B          dec  hl
1F1A: 2B          dec  hl
1F1B: CB DE       set  3,(hl)
1F1D: C9          ret
1F1E: 2B          dec  hl
1F1F: 2B          dec  hl
1F20: CB DE       set  3,(hl)
1F22: 23          inc  hl
1F23: 23          inc  hl
1F24: CB CE       set  1,(hl)
1F26: C9          ret
1F27: 01 20 00    ld   bc,$0020
1F2A: 09          add  hl,bc
1F2B: CB C6       set  0,(hl)
1F2D: A7          and  a
1F2E: ED 42       sbc  hl,bc
1F30: CB D6       set  2,(hl)
1F32: C9          ret
1F33: 01 E0 FF    ld   bc,$FFE0
1F36: 09          add  hl,bc
1F37: CB D6       set  2,(hl)
1F39: A7          and  a
1F3A: ED 42       sbc  hl,bc
1F3C: CB C6       set  0,(hl)
1F3E: C9          ret
1F3F: D9          exx
1F40: 21 80 E0    ld   hl,$E080
1F43: 7E          ld   a,(hl)
1F44: A7          and  a
1F45: C8          ret  z
1F46: 47          ld   b,a
1F47: 23          inc  hl
1F48: FD E5       push iy
1F4A: 11 31 00    ld   de,$0031
1F4D: FD 19       add  iy,de
1F4F: 3E 0C       ld   a,$0C
1F51: 96          sub  (hl)
1F52: 4F          ld   c,a
1F53: 87          add  a,a
1F54: 87          add  a,a
1F55: 87          add  a,a
1F56: 91          sub  c
1F57: 5F          ld   e,a
1F58: 16 00       ld   d,$00
1F5A: FD E5       push iy
1F5C: FD 19       add  iy,de
1F5E: D9          exx
1F5F: FD 70 00    ld   (iy+$00),b
1F62: FD 66 01    ld   h,(iy+$01)
1F65: FD 6E 02    ld   l,(iy+$02)
1F68: 19          add  hl,de
1F69: FD 74 01    ld   (iy+$01),h
1F6C: FD 75 02    ld   (iy+$02),l
1F6F: D9          exx
1F70: FD E1       pop  iy
1F72: 23          inc  hl
1F73: 10 DA       djnz $1F4F
1F75: FD E1       pop  iy
1F77: C9          ret
1F78: FD E5       push iy
1F7A: 11 31 00    ld   de,$0031
1F7D: FD 19       add  iy,de
1F7F: 11 07 00    ld   de,$0007
1F82: 06 0C       ld   b,$0C
1F84: FD 7E 00    ld   a,(iy+$00)
1F87: FE 80       cp   $80
1F89: 20 20       jr   nz,$1FAB
1F8B: FD 7E 01    ld   a,(iy+$01)
1F8E: DD 96 01    sub  (ix+$01)
1F91: FE 09       cp   $09
1F93: 38 04       jr   c,$1F99
1F95: FE F8       cp   $F8
1F97: 38 12       jr   c,$1FAB
1F99: FD 7E 03    ld   a,(iy+$03)
1F9C: DD 96 03    sub  (ix+$03)
1F9F: FE 14       cp   $14
1FA1: 30 08       jr   nc,$1FAB
1FA3: FE 10       cp   $10
1FA5: 38 04       jr   c,$1FAB
1FA7: FD 36 00 88 ld   (iy+$00),$88
1FAB: FD 19       add  iy,de
1FAD: 10 D5       djnz $1F84
1FAF: FD E1       pop  iy
1FB1: C9          ret

1FB2: DD CB 00 76 bit  6,(ix+$00)
1FB6: 20 51       jr   nz,$2009
1FB8: FD 35 00    dec  (iy+$00)
1FBB: DD 36 00 E0 ld   (ix+$00),$E0
1FBF: DD 36 02 00 ld   (ix+$02),$00
1FC3: DD 36 03 20 ld   (ix+$03),$20
1FC7: DD 36 04 00 ld   (ix+$04),$00
1FCB: DD 36 06 00 ld   (ix+$06),$00
1FCF: DD 36 07 80 ld   (ix+$07),$80
1FD3: DD 36 08 00 ld   (ix+$08),$00
1FD7: DD 36 0D 00 ld   (ix+$0d),$00
1FDB: DD 36 10 00 ld   (ix+$10),$00
1FDF: DD 36 11 00 ld   (ix+$11),$00
1FE3: FD 36 0C 00 ld   (iy+$0c),$00
1FE7: FD 36 10 00 ld   (iy+$10),$00
1FEB: 21 01 E0    ld   hl,$E001
1FEE: CB C6       set  0,(hl)
1FF0: 3E 19       ld   a,$19
1FF2: 06 00       ld   b,$00
1FF4: CD D9 02    call $02D9
1FF7: 3E 0F       ld   a,$0F
1FF9: 06 00       ld   b,$00
1FFB: CD D9 02    call $02D9
1FFE: DD 36 01 78 ld   (ix+$01),$78
2002: DD 36 05 3C ld   (ix+$05),$3C
2006: CD EB 22    call $22EB
2009: DD CB 00 6E bit  5,(ix+$00)
200D: 28 10       jr   z,$201F
200F: DD 34 06    inc  (ix+$06)
2012: DD 7E 06    ld   a,(ix+$06)
2015: E6 0F       and  $0F
2017: 20 06       jr   nz,$201F
2019: CD 09 23    call $2309
201C: CD EB 22    call $22EB
201F: DD 7E 05    ld   a,(ix+$05)
2022: A7          and  a
2023: 28 04       jr   z,$2029
2025: DD 35 05    dec  (ix+$05)
2028: C0          ret  nz
2029: 3A 00 E0    ld   a,($E000)
202C: 87          add  a,a
202D: 30 13       jr   nc,$2042
202F: 3A 02 A0    ld   a,(dsw_1_a002)
2032: E6 04       and  $04
2034: 20 0C       jr   nz,$2042
2036: CD 6D 24    call $246D
2039: 21 B6 E1    ld   hl,$E1B6
203C: CB FE       set  7,(hl)
203E: FD 36 30 00 ld   (iy+$30),$00
2042: CD 45 23    call $2345
2045: 3A 00 E0    ld   a,($E000)
2048: E6 40       and  $40
204A: 20 08       jr   nz,$2054
204C: DD 36 00 00 ld   (ix+$00),$00
2050: CD 6D 24    call $246D
2053: C9          ret
2054: 3A B6 E1    ld   a,($E1B6)
2057: A7          and  a
2058: C2 1A 22    jp   nz,$221A
205B: CD 02 03    call $0302
205E: DD CB 00 5E bit  3,(ix+$00)
2062: C2 A5 22    jp   nz,$22A5
2065: DD CB 00 66 bit  4,(ix+$00)
2069: C2 74 22    jp   nz,$2274
206C: CD 5A 23    call $235A
206F: DD CB 07 76 bit  6,(ix+$07)
2073: C2 8C 21    jp   nz,$218C
2076: CD 32 23    call $2332
2079: 2F          cpl
207A: E6 0F       and  $0F
207C: CA 6F 21    jp   z,$216F
207F: DD 34 08    inc  (ix+$08)
2082: 1F          rra
2083: 38 46       jr   c,$20CB
2085: 1F          rra
2086: 38 2D       jr   c,$20B5
2088: 1F          rra
2089: 38 16       jr   c,$20A1
208B: DD 7E 01    ld   a,(ix+$01)
208E: D6 08       sub  $08
2090: E6 0F       and  $0F
2092: 28 04       jr   z,$2098
2094: FE 0F       cp   $0F
2096: 20 47       jr   nz,$20DF
2098: CD 63 23    call $2363
209B: D2 37 21    jp   nc,$2137
209E: C3 3A 21    jp   $213A
20A1: DD 7E 03    ld   a,(ix+$03)
20A4: E6 0F       and  $0F
20A6: 28 04       jr   z,$20AC
20A8: FE 0F       cp   $0F
20AA: 20 5F       jr   nz,$210B
20AC: CD 9A 23    call $239A
20AF: D2 46 21    jp   nc,$2146
20B2: C3 49 21    jp   $2149
20B5: DD 7E 01    ld   a,(ix+$01)
20B8: D6 08       sub  $08
20BA: E6 0F       and  $0F
20BC: 28 04       jr   z,$20C2
20BE: FE 0F       cp   $0F
20C0: 20 1D       jr   nz,$20DF
20C2: CD 7F 23    call $237F
20C5: D2 53 21    jp   nc,$2153
20C8: C3 56 21    jp   $2156
20CB: DD 7E 03    ld   a,(ix+$03)
20CE: E6 0F       and  $0F
20D0: 28 04       jr   z,$20D6
20D2: FE 0F       cp   $0F
20D4: 20 35       jr   nz,$210B
20D6: CD A5 23    call $23A5
20D9: D2 62 21    jp   nc,$2162
20DC: C3 65 21    jp   $2165
20DF: 47          ld   b,a
20E0: DD 7E 00    ld   a,(ix+$00)
20E3: E6 06       and  $06
20E5: 28 07       jr   z,$20EE
20E7: 78          ld   a,b
20E8: FE 0D       cp   $0D
20EA: 38 13       jr   c,$20FF
20EC: 18 05       jr   $20F3
20EE: 78          ld   a,b
20EF: FE 04       cp   $04
20F1: 38 0C       jr   c,$20FF
20F3: CD 9A 23    call $239A
20F6: 30 4E       jr   nc,$2146
20F8: CD A5 23    call $23A5
20FB: 30 65       jr   nc,$2162
20FD: 18 66       jr   $2165
20FF: CD A5 23    call $23A5
2102: 30 5E       jr   nc,$2162
2104: CD 9A 23    call $239A
2107: 30 3D       jr   nc,$2146
2109: 18 3E       jr   $2149
210B: 47          ld   b,a
210C: DD 7E 00    ld   a,(ix+$00)
210F: E6 06       and  $06
2111: FE 04       cp   $04
2113: 28 07       jr   z,$211C
2115: 78          ld   a,b
2116: FE 0D       cp   $0D
2118: 38 13       jr   c,$212D
211A: 18 05       jr   $2121
211C: 78          ld   a,b
211D: FE 04       cp   $04
211F: 38 0C       jr   c,$212D
2121: CD 63 23    call $2363
2124: 30 11       jr   nc,$2137
2126: CD 7F 23    call $237F
2129: 30 28       jr   nc,$2153
212B: 18 29       jr   $2156
212D: CD 7F 23    call $237F
2130: 30 21       jr   nc,$2153
2132: CD 63 23    call $2363
2135: 38 03       jr   c,$213A
2137: CD 95 24    call $2495
213A: DD 7E 00    ld   a,(ix+$00)
213D: E6 F9       and  $F9
213F: F6 04       or   $04
2141: DD 77 00    ld   (ix+$00),a
2144: 18 29       jr   $216F
2146: CD 46 26    call $2646
2149: DD 7E 00    ld   a,(ix+$00)
214C: E6 F8       and  $F8
214E: DD 77 00    ld   (ix+$00),a
2151: 18 1C       jr   $216F
2153: CD 6F 25    call $256F
2156: DD 7E 00    ld   a,(ix+$00)
2159: E6 F9       and  $F9
215B: F6 06       or   $06
215D: DD 77 00    ld   (ix+$00),a
2160: 18 0D       jr   $216F
2162: CD 2C 27    call $272C
2165: DD 7E 00    ld   a,(ix+$00)
2168: E6 F8       and  $F8
216A: F6 03       or   $03
216C: DD 77 00    ld   (ix+$00),a
216F: DD 7E 07    ld   a,(ix+$07)
2172: E6 C0       and  $C0
2174: FE 80       cp   $80
2176: C2 1A 22    jp   nz,$221A
2179: CD 32 23    call $2332
217C: E6 10       and  $10
217E: C2 1A 22    jp   nz,$221A
2181: DD CB 07 F6 set  6,(ix+$07)
2185: DD 36 08 00 ld   (ix+$08),$00
2189: C3 1A 22    jp   $221A
218C: DD 34 08    inc  (ix+$08)
218F: DD 7E 08    ld   a,(ix+$08)
2192: FE 08       cp   $08
2194: 30 12       jr   nc,$21A8
2196: E6 04       and  $04
2198: 0F          rrca
2199: 0F          rrca
219A: C6 1E       add  a,$1E
219C: DD CB 00 56 bit  2,(ix+$00)
21A0: 28 02       jr   z,$21A4
21A2: C6 02       add  a,$02
21A4: 47          ld   b,a
21A5: C3 52 22    jp   $2252
21A8: DD 7E 07    ld   a,(ix+$07)
21AB: E6 3C       and  $3C
21AD: DD 77 07    ld   (ix+$07),a
21B0: DD 36 08 00 ld   (ix+$08),$00
21B4: FD 34 0C    inc  (iy+$0c)
21B7: 21 D7 E1    ld   hl,$E1D7
21BA: 06 09       ld   b,$09
21BC: DD 56 01    ld   d,(ix+$01)
21BF: DD 5E 03    ld   e,(ix+$03)
21C2: DD 7E 00    ld   a,(ix+$00)
21C5: E6 07       and  $07
21C7: FE 07       cp   $07
21C9: 30 33       jr   nc,$21FE
21CB: FE 06       cp   $06
21CD: 30 28       jr   nc,$21F7
21CF: FE 05       cp   $05
21D1: 30 1D       jr   nc,$21F0
21D3: FE 04       cp   $04
21D5: 30 12       jr   nc,$21E9
21D7: FE 02       cp   $02
21D9: 30 07       jr   nc,$21E2
21DB: 7A          ld   a,d
21DC: 80          add  a,b
21DD: 57          ld   d,a
21DE: 3E 81       ld   a,$81
21E0: 18 21       jr   $2203
21E2: 7A          ld   a,d
21E3: 90          sub  b
21E4: 57          ld   d,a
21E5: 3E 83       ld   a,$83
21E7: 18 1A       jr   $2203
21E9: 7B          ld   a,e
21EA: 80          add  a,b
21EB: 5F          ld   e,a
21EC: 3E 80       ld   a,$80
21EE: 18 13       jr   $2203
21F0: 7B          ld   a,e
21F1: 80          add  a,b
21F2: 5F          ld   e,a
21F3: 3E 82       ld   a,$82
21F5: 18 0C       jr   $2203
21F7: 7B          ld   a,e
21F8: 90          sub  b
21F9: 5F          ld   e,a
21FA: 3E 81       ld   a,$81
21FC: 18 05       jr   $2203
21FE: 7B          ld   a,e
21FF: 90          sub  b
2200: 5F          ld   e,a
2201: 3E 83       ld   a,$83
2203: 77          ld   (hl),a
2204: 23          inc  hl
2205: 72          ld   (hl),d
2206: 23          inc  hl
2207: 36 00       ld   (hl),$00
2209: 23          inc  hl
220A: 73          ld   (hl),e
220B: 23          inc  hl
220C: 36 00       ld   (hl),$00
220E: 23          inc  hl
220F: 36 00       ld   (hl),$00
2211: 23          inc  hl
2212: 36 00       ld   (hl),$00
2214: 23          inc  hl
2215: 36 00       ld   (hl),$00
2217: 23          inc  hl
2218: 36 00       ld   (hl),$00
221A: 3E 00       ld   a,$00
221C: DD 46 07    ld   b,(ix+$07)
221F: CB 68       bit  5,b
2221: 20 16       jr   nz,$2239
2223: CB 60       bit  4,b
2225: 28 02       jr   z,$2229
2227: C6 0C       add  a,$0C
2229: CB 78       bit  7,b
222B: 28 02       jr   z,$222F
222D: C6 06       add  a,$06
222F: DD CB 00 56 bit  2,(ix+$00)
2233: 28 0C       jr   z,$2241
2235: C6 03       add  a,$03
2237: 18 08       jr   $2241
2239: C6 18       add  a,$18
223B: CB 78       bit  7,b
223D: 28 02       jr   z,$2241
223F: C6 03       add  a,$03
2241: 47          ld   b,a
2242: DD 7E 08    ld   a,(ix+$08)
2245: E6 18       and  $18
2247: 0F          rrca
2248: 0F          rrca
2249: 0F          rrca
224A: FE 03       cp   $03
224C: 20 02       jr   nz,$2250
224E: 3E 01       ld   a,$01
2250: 80          add  a,b
2251: 47          ld   b,a
2252: DD 7E 00    ld   a,(ix+$00)
2255: E6 07       and  $07
2257: FE 04       cp   $04
2259: 30 04       jr   nc,$225F
225B: E6 02       and  $02
225D: 18 0A       jr   $2269
225F: E6 03       and  $03
2261: 28 06       jr   z,$2269
2263: FE 03       cp   $03
2265: 28 02       jr   z,$2269
2267: EE 03       xor  $03
2269: 87          add  a,a
226A: 87          add  a,a
226B: 87          add  a,a
226C: 87          add  a,a
226D: F6 02       or   $02
226F: 4F          ld   c,a
2270: CD 97 02    call $0297
2273: C9          ret
2274: DD CB 07 4E bit  1,(ix+$07)
2278: 20 24       jr   nz,$229E
227A: DD CB 07 CE set  1,(ix+$07)
227E: CD 6D 24    call $246D
2281: DD 7E 10    ld   a,(ix+$10)
2284: 2F          cpl
2285: E6 18       and  $18
2287: 28 12       jr   z,$229B
2289: DD 7E 07    ld   a,(ix+$07)
228C: 2F          cpl
228D: E6 18       and  $18
228F: 20 0D       jr   nz,$229E
2291: DD 7E 00    ld   a,(ix+$00)
2294: E6 06       and  $06
2296: F6 18       or   $18
2298: DD 77 10    ld   (ix+$10),a
229B: CD 03 1D    call $1D03
229E: 01 02 22    ld   bc,$2202
22A1: CD 97 02    call $0297
22A4: C9          ret
22A5: DD CB 07 46 bit  0,(ix+$07)
22A9: 20 0F       jr   nz,$22BA
22AB: DD CB 07 C6 set  0,(ix+$07)
22AF: DD 36 08 FF ld   (ix+$08),$FF
22B3: 3E 24       ld   a,$24
22B5: 06 00       ld   b,$00
22B7: CD D9 02    call $02D9
22BA: DD 34 08    inc  (ix+$08)
22BD: DD 7E 08    ld   a,(ix+$08)
22C0: D6 1E       sub  $1E
22C2: 38 B0       jr   c,$2274
22C4: FE 80       cp   $80
22C6: 30 16       jr   nc,$22DE
22C8: 01 02 23    ld   bc,$2302
22CB: FE 10       cp   $10
22CD: 38 0B       jr   c,$22DA
22CF: 04          inc  b
22D0: FE 20       cp   $20
22D2: 38 06       jr   c,$22DA
22D4: 04          inc  b
22D5: FE 40       cp   $40
22D7: 38 01       jr   c,$22DA
22D9: 04          inc  b
22DA: CD 97 02    call $0297
22DD: C9          ret
22DE: 21 A9 E1    ld   hl,$E1A9
22E1: CB FE       set  7,(hl)
22E3: DD 36 00 00 ld   (ix+$00),$00
22E7: CD 80 5A    call $5A80
22EA: C9          ret
22EB: DD 7E 06    ld   a,(ix+$06)
22EE: E6 F0       and  $F0
22F0: FE 60       cp   $60
22F2: 30 10       jr   nc,$2304
22F4: 0F          rrca
22F5: 0F          rrca
22F6: 0F          rrca
22F7: 0F          rrca
22F8: F5          push af
22F9: CD 20 23    call $2320
22FC: CD 6C 04    call $046C
22FF: F1          pop  af
2300: FD BE 00    cp   (iy+$00)
2303: D8          ret  c
2304: DD CB 00 AE res  5,(ix+$00)
2308: C9          ret
2309: DD 7E 06    ld   a,(ix+$06)
230C: E6 F0       and  $F0
230E: 0F          rrca
230F: 0F          rrca
2310: 0F          rrca
2311: 0F          rrca
2312: 3D          dec  a
2313: CD 20 23    call $2320
2316: 3E 09       ld   a,$09
2318: 08          ex   af,af'
2319: 3E 2E       ld   a,$2E
231B: 08          ex   af,af'
231C: CD 42 04    call $0442
231F: C9          ret
2320: 11 81 88    ld   de,$8881
2323: 01 02 02    ld   bc,$0202
2326: A7          and  a
2327: C8          ret  z
2328: EB          ex   de,hl
2329: 11 40 00    ld   de,$0040
232C: 19          add  hl,de
232D: 3D          dec  a
232E: 20 FC       jr   nz,$232C
2330: EB          ex   de,hl
2331: C9          ret
2332: 3A A5 E1    ld   a,($E1A5)
2335: 21 00 E0    ld   hl,$E000
2338: CB 7E       bit  7,(hl)
233A: C8          ret  z
233B: 3A 00 A0    ld   a,(port_1_a000)
233E: CB 46       bit  0,(hl)
2340: C8          ret  z
2341: 3A 01 A0    ld   a,(port_2_a001)
2344: C9          ret
2345: DD 7E 0D    ld   a,(ix+$0d)
2348: A7          and  a
2349: C8          ret  z
234A: DD 35 0D    dec  (ix+$0d)
234D: DD 56 0E    ld   d,(ix+$0e)
2350: DD 5E 0F    ld   e,(ix+$0f)
2353: 01 0A 71    ld   bc,$710A
2356: CD 9D 02    call $029D
2359: C9          ret
235A: FD 7E 10    ld   a,(iy+$10)
235D: A7          and  a
235E: C8          ret  z
235F: FD 35 10    dec  (iy+$10)
2362: C9          ret
2363: DD 7E 03    ld   a,(ix+$03)
2366: FE DF       cp   $DF
2368: 3F          ccf
2369: D8          ret  c
236A: DD 56 01    ld   d,(ix+$01)
236D: DD 7E 03    ld   a,(ix+$03)
2370: C6 07       add  a,$07
2372: 5F          ld   e,a
2373: 01 07 0B    ld   bc,$0B07
2376: CD 76 40    call $4076
2379: D8          ret  c
237A: CD 6D 24    call $246D
237D: A7          and  a
237E: C9          ret
237F: DD 7E 03    ld   a,(ix+$03)
2382: FE 21       cp   $21
2384: D8          ret  c
2385: DD 56 01    ld   d,(ix+$01)
2388: DD 7E 03    ld   a,(ix+$03)
238B: D6 07       sub  $07
238D: 5F          ld   e,a
238E: 01 07 0B    ld   bc,$0B07
2391: CD 76 40    call $4076
2394: D8          ret  c
2395: CD 6D 24    call $246D
2398: A7          and  a
2399: C9          ret
239A: DD 7E 01    ld   a,(ix+$01)
239D: FE D7       cp   $D7
239F: 3F          ccf
23A0: D8          ret  c
23A1: 0E 00       ld   c,$00
23A3: 18 08       jr   $23AD
23A5: DD 7E 01    ld   a,(ix+$01)
23A8: FE 29       cp   $29
23AA: D8          ret  c
23AB: 0E 03       ld   c,$03
23AD: DD 56 01    ld   d,(ix+$01)
23B0: DD 5E 03    ld   e,(ix+$03)
23B3: 21 80 E0    ld   hl,$E080
23B6: 36 00       ld   (hl),$00
23B8: 23          inc  hl
23B9: D9          exx
23BA: FD E5       push iy
23BC: 11 31 00    ld   de,$0031
23BF: FD 19       add  iy,de
23C1: 11 07 00    ld   de,$0007
23C4: 06 0C       ld   b,$0C
23C6: FD 7E 00    ld   a,(iy+$00)
23C9: FE 80       cp   $80
23CB: 38 6D       jr   c,$243A
23CD: FE D0       cp   $D0
23CF: 28 04       jr   z,$23D5
23D1: FE B8       cp   $B8
23D3: 30 65       jr   nc,$243A
23D5: D9          exx
23D6: FD 7E 03    ld   a,(iy+$03)
23D9: 93          sub  e
23DA: 28 04       jr   z,$23E0
23DC: FE 01       cp   $01
23DE: 20 3F       jr   nz,$241F
23E0: CB 49       bit  1,c
23E2: 20 06       jr   nz,$23EA
23E4: FD 7E 01    ld   a,(iy+$01)
23E7: 92          sub  d
23E8: 18 04       jr   $23EE
23EA: 7A          ld   a,d
23EB: FD 96 01    sub  (iy+$01)
23EE: 28 49       jr   z,$2439
23F0: FE 11       cp   $11
23F2: 30 45       jr   nc,$2439
23F4: FE 0F       cp   $0F
23F6: 30 64       jr   nc,$245C
23F8: FD 7E 00    ld   a,(iy+$00)
23FB: FE A0       cp   $A0
23FD: 30 6A       jr   nc,$2469
23FF: 3A 80 E0    ld   a,($E080)
2402: 3C          inc  a
2403: 32 80 E0    ld   ($E080),a
2406: D9          exx
2407: 78          ld   a,b
2408: D9          exx
2409: 77          ld   (hl),a
240A: 23          inc  hl
240B: FD 56 01    ld   d,(iy+$01)
240E: FD 5E 03    ld   e,(iy+$03)
2411: 7A          ld   a,d
2412: FE D8       cp   $D8
2414: 30 53       jr   nc,$2469
2416: FE 29       cp   $29
2418: 38 4F       jr   c,$2469
241A: D9          exx
241B: FD E1       pop  iy
241D: 18 9B       jr   $23BA
241F: FE 09       cp   $09
2421: 38 04       jr   c,$2427
2423: FE F8       cp   $F8
2425: 38 12       jr   c,$2439
2427: CB 41       bit  0,c
2429: 20 06       jr   nz,$2431
242B: FD 7E 01    ld   a,(iy+$01)
242E: 92          sub  d
242F: 18 04       jr   $2435
2431: 7A          ld   a,d
2432: FD 96 01    sub  (iy+$01)
2435: FE 0F       cp   $0F
2437: 38 30       jr   c,$2469
2439: D9          exx
243A: FD 19       add  iy,de
243C: 10 88       djnz $23C6
243E: 3A 80 E0    ld   a,($E080)
2441: A7          and  a
2442: 28 1E       jr   z,$2462
2444: D9          exx
2445: 3E 07       ld   a,$07
2447: CB 41       bit  0,c
2449: 28 02       jr   z,$244D
244B: 3E F9       ld   a,$F9
244D: 82          add  a,d
244E: 57          ld   d,a
244F: CD AD 41    call $41AD
2452: 38 15       jr   c,$2469
2454: FD E1       pop  iy
2456: DD CB 07 EE set  5,(ix+$07)
245A: A7          and  a
245B: C9          ret
245C: 3A 80 E0    ld   a,($E080)
245F: A7          and  a
2460: 20 F2       jr   nz,$2454
2462: FD E1       pop  iy
2464: CD 6D 24    call $246D
2467: A7          and  a
2468: C9          ret
2469: FD E1       pop  iy
246B: 37          scf
246C: C9          ret
246D: DD 7E 07    ld   a,(ix+$07)
2470: E6 20       and  $20
2472: C8          ret  z
2473: DD CB 07 AE res  5,(ix+$07)
2477: FD E5       push iy
2479: 11 31 00    ld   de,$0031
247C: FD 19       add  iy,de
247E: 11 07 00    ld   de,$0007
2481: 06 0C       ld   b,$0C
2483: FD 7E 00    ld   a,(iy+$00)
2486: FE 98       cp   $98
2488: 20 04       jr   nz,$248E
248A: FD 36 00 80 ld   (iy+$00),$80
248E: FD 19       add  iy,de
2490: 10 F1       djnz $2483
2492: FD E1       pop  iy
2494: C9          ret
2495: DD 7E 00    ld   a,(ix+$00)
2498: E6 06       and  $06
249A: FE 04       cp   $04
249C: 28 35       jr   z,$24D3
249E: DD CB 11 BE res  7,(ix+$11)
24A2: 21 01 E0    ld   hl,$E001
24A5: CB D6       set  2,(hl)
24A7: DD 7E 10    ld   a,(ix+$10)
24AA: 47          ld   b,a
24AB: E6 06       and  $06
24AD: FE 04       cp   $04
24AF: 20 11       jr   nz,$24C2
24B1: DD 7E 07    ld   a,(ix+$07)
24B4: E6 A0       and  $A0
24B6: B0          or   b
24B7: E6 B8       and  $B8
24B9: DD 77 07    ld   (ix+$07),a
24BC: DD 36 10 04 ld   (ix+$10),$04
24C0: 18 23       jr   $24E5
24C2: 47          ld   b,a
24C3: DD 7E 07    ld   a,(ix+$07)
24C6: 4F          ld   c,a
24C7: E6 18       and  $18
24C9: B0          or   b
24CA: DD 77 10    ld   (ix+$10),a
24CD: 79          ld   a,c
24CE: E6 A0       and  $A0
24D0: DD 77 07    ld   (ix+$07),a
24D3: DD 7E 10    ld   a,(ix+$10)
24D6: 2F          cpl
24D7: E6 18       and  $18
24D9: 20 0A       jr   nz,$24E5
24DB: DD 7E 03    ld   a,(ix+$03)
24DE: E6 07       and  $07
24E0: FE 05       cp   $05
24E2: D4 03 1D    call nc,$1D03
24E5: DD 7E 03    ld   a,(ix+$03)
24E8: E6 0F       and  $0F
24EA: 28 04       jr   z,$24F0
24EC: FE 0F       cp   $0F
24EE: 20 23       jr   nz,$2513
24F0: DD CB 11 7E bit  7,(ix+$11)
24F4: 20 21       jr   nz,$2517
24F6: DD CB 11 FE set  7,(ix+$11)
24FA: CD A3 1D    call $1DA3
24FD: CB 5E       bit  3,(hl)
24FF: 28 09       jr   z,$250A
2501: CD 16 28    call $2816
2504: DD 36 10 04 ld   (ix+$10),$04
2508: 18 48       jr   $2552
250A: CD 24 28    call $2824
250D: DD 36 10 14 ld   (ix+$10),$14
2511: 18 3F       jr   $2552
2513: DD CB 11 BE res  7,(ix+$11)
2517: DD 7E 07    ld   a,(ix+$07)
251A: 47          ld   b,a
251B: E6 14       and  $14
251D: FE 10       cp   $10
251F: 20 2D       jr   nz,$254E
2521: DD 7E 03    ld   a,(ix+$03)
2524: E6 07       and  $07
2526: CB 58       bit  3,b
2528: 20 0A       jr   nz,$2534
252A: FE 01       cp   $01
252C: 28 0E       jr   z,$253C
252E: FE 02       cp   $02
2530: 20 20       jr   nz,$2552
2532: 18 08       jr   $253C
2534: FE 05       cp   $05
2536: 28 04       jr   z,$253C
2538: FE 06       cp   $06
253A: 20 16       jr   nz,$2552
253C: CD 9B 1A    call $1A9B
253F: CD 62 28    call $2862
2542: DD 7E 03    ld   a,(ix+$03)
2545: E6 0F       and  $0F
2547: FE 0D       cp   $0D
2549: D4 C9 1D    call nc,$1DC9
254C: 18 04       jr   $2552
254E: DD CB 07 96 res  2,(ix+$07)
2552: CD 78 1F    call $1F78
2555: CD 34 28    call $2834
2558: DD 66 03    ld   h,(ix+$03)
255B: DD 6E 04    ld   l,(ix+$04)
255E: 19          add  hl,de
255F: DD 74 03    ld   (ix+$03),h
2562: DD 75 04    ld   (ix+$04),l
2565: DD 7E 01    ld   a,(ix+$01)
2568: 3C          inc  a
2569: E6 F8       and  $F8
256B: DD 77 01    ld   (ix+$01),a
256E: C9          ret
256F: DD 7E 00    ld   a,(ix+$00)
2572: E6 06       and  $06
2574: FE 06       cp   $06
2576: 28 35       jr   z,$25AD
2578: DD CB 11 BE res  7,(ix+$11)
257C: 21 01 E0    ld   hl,$E001
257F: CB D6       set  2,(hl)
2581: DD 7E 10    ld   a,(ix+$10)
2584: 47          ld   b,a
2585: E6 06       and  $06
2587: FE 06       cp   $06
2589: 20 11       jr   nz,$259C
258B: DD 7E 07    ld   a,(ix+$07)
258E: E6 A0       and  $A0
2590: B0          or   b
2591: E6 B8       and  $B8
2593: DD 77 07    ld   (ix+$07),a
2596: DD 36 10 06 ld   (ix+$10),$06
259A: 18 23       jr   $25BF
259C: 47          ld   b,a
259D: DD 7E 07    ld   a,(ix+$07)
25A0: 4F          ld   c,a
25A1: E6 18       and  $18
25A3: B0          or   b
25A4: DD 77 10    ld   (ix+$10),a
25A7: 79          ld   a,c
25A8: E6 A0       and  $A0
25AA: DD 77 07    ld   (ix+$07),a
25AD: DD 7E 10    ld   a,(ix+$10)
25B0: 2F          cpl
25B1: E6 18       and  $18
25B3: 20 0A       jr   nz,$25BF
25B5: DD 7E 03    ld   a,(ix+$03)
25B8: E6 07       and  $07
25BA: FE 03       cp   $03
25BC: DC 03 1D    call c,$1D03
25BF: DD 7E 03    ld   a,(ix+$03)
25C2: E6 0F       and  $0F
25C4: 28 04       jr   z,$25CA
25C6: FE 0F       cp   $0F
25C8: 20 23       jr   nz,$25ED
25CA: DD CB 11 7E bit  7,(ix+$11)
25CE: 20 21       jr   nz,$25F1
25D0: DD CB 11 FE set  7,(ix+$11)
25D4: CD A3 1D    call $1DA3
25D7: CB 4E       bit  1,(hl)
25D9: 28 09       jr   z,$25E4
25DB: CD 16 28    call $2816
25DE: DD 36 10 06 ld   (ix+$10),$06
25E2: 18 48       jr   $262C
25E4: CD 24 28    call $2824
25E7: DD 36 10 16 ld   (ix+$10),$16
25EB: 18 3F       jr   $262C
25ED: DD CB 11 BE res  7,(ix+$11)
25F1: DD 7E 07    ld   a,(ix+$07)
25F4: 47          ld   b,a
25F5: E6 14       and  $14
25F7: FE 10       cp   $10
25F9: 20 2D       jr   nz,$2628
25FB: DD 7E 03    ld   a,(ix+$03)
25FE: E6 07       and  $07
2600: CB 58       bit  3,b
2602: 20 0A       jr   nz,$260E
2604: FE 05       cp   $05
2606: 28 0E       jr   z,$2616
2608: FE 06       cp   $06
260A: 20 20       jr   nz,$262C
260C: 18 08       jr   $2616
260E: FE 01       cp   $01
2610: 28 04       jr   z,$2616
2612: FE 02       cp   $02
2614: 20 16       jr   nz,$262C
2616: CD D0 1A    call $1AD0
2619: CD 62 28    call $2862
261C: DD 7E 03    ld   a,(ix+$03)
261F: E6 0F       and  $0F
2621: FE 03       cp   $03
2623: DC 1F 1E    call c,$1E1F
2626: 18 04       jr   $262C
2628: DD CB 07 96 res  2,(ix+$07)
262C: CD 4B 28    call $284B
262F: DD 66 03    ld   h,(ix+$03)
2632: DD 6E 04    ld   l,(ix+$04)
2635: 19          add  hl,de
2636: DD 74 03    ld   (ix+$03),h
2639: DD 75 04    ld   (ix+$04),l
263C: DD 7E 01    ld   a,(ix+$01)
263F: 3C          inc  a
2640: E6 F8       and  $F8
2642: DD 77 01    ld   (ix+$01),a
2645: C9          ret
2646: DD 7E 00    ld   a,(ix+$00)
2649: E6 06       and  $06
264B: 28 33       jr   z,$2680
264D: DD CB 11 BE res  7,(ix+$11)
2651: 21 01 E0    ld   hl,$E001
2654: CB D6       set  2,(hl)
2656: DD 7E 10    ld   a,(ix+$10)
2659: 47          ld   b,a
265A: E6 06       and  $06
265C: 20 11       jr   nz,$266F
265E: DD 7E 07    ld   a,(ix+$07)
2661: E6 A0       and  $A0
2663: B0          or   b
2664: E6 B8       and  $B8
2666: DD 77 07    ld   (ix+$07),a
2669: DD 36 10 00 ld   (ix+$10),$00
266D: 18 23       jr   $2692
266F: 47          ld   b,a
2670: DD 7E 07    ld   a,(ix+$07)
2673: 4F          ld   c,a
2674: E6 18       and  $18
2676: B0          or   b
2677: DD 77 10    ld   (ix+$10),a
267A: 79          ld   a,c
267B: E6 A0       and  $A0
267D: DD 77 07    ld   (ix+$07),a
2680: DD 7E 10    ld   a,(ix+$10)
2683: 2F          cpl
2684: E6 18       and  $18
2686: 20 0A       jr   nz,$2692
2688: DD 7E 01    ld   a,(ix+$01)
268B: E6 07       and  $07
268D: FE 05       cp   $05
268F: D4 03 1D    call nc,$1D03
2692: DD 7E 01    ld   a,(ix+$01)
2695: E6 0F       and  $0F
2697: FE 07       cp   $07
2699: 28 04       jr   z,$269F
269B: FE 08       cp   $08
269D: 20 23       jr   nz,$26C2
269F: DD CB 11 7E bit  7,(ix+$11)
26A3: 20 21       jr   nz,$26C6
26A5: DD CB 11 FE set  7,(ix+$11)
26A9: CD A3 1D    call $1DA3
26AC: CB 56       bit  2,(hl)
26AE: 28 09       jr   z,$26B9
26B0: CD 16 28    call $2816
26B3: DD 36 10 00 ld   (ix+$10),$00
26B7: 18 4C       jr   $2705
26B9: CD 24 28    call $2824
26BC: DD 36 10 10 ld   (ix+$10),$10
26C0: 18 43       jr   $2705
26C2: DD CB 11 BE res  7,(ix+$11)
26C6: DD 7E 07    ld   a,(ix+$07)
26C9: 47          ld   b,a
26CA: E6 14       and  $14
26CC: FE 10       cp   $10
26CE: 20 31       jr   nz,$2701
26D0: DD 7E 01    ld   a,(ix+$01)
26D3: E6 07       and  $07
26D5: CB 58       bit  3,b
26D7: 20 0A       jr   nz,$26E3
26D9: FE 01       cp   $01
26DB: 28 0E       jr   z,$26EB
26DD: FE 02       cp   $02
26DF: 20 24       jr   nz,$2705
26E1: 18 08       jr   $26EB
26E3: FE 05       cp   $05
26E5: 28 04       jr   z,$26EB
26E7: FE 06       cp   $06
26E9: 20 1A       jr   nz,$2705
26EB: CD 05 1B    call $1B05
26EE: CD 62 28    call $2862
26F1: DD 7E 01    ld   a,(ix+$01)
26F4: E6 0F       and  $0F
26F6: FE 07       cp   $07
26F8: 30 0B       jr   nc,$2705
26FA: FE 05       cp   $05
26FC: D4 75 1E    call nc,$1E75
26FF: 18 04       jr   $2705
2701: DD CB 07 96 res  2,(ix+$07)
2705: CD 78 1F    call $1F78
2708: CD 34 28    call $2834
270B: DD 66 01    ld   h,(ix+$01)
270E: DD 6E 02    ld   l,(ix+$02)
2711: 19          add  hl,de
2712: DD 74 01    ld   (ix+$01),h
2715: DD 75 02    ld   (ix+$02),l
2718: DD 7E 03    ld   a,(ix+$03)
271B: 3C          inc  a
271C: E6 F0       and  $F0
271E: DD 77 03    ld   (ix+$03),a
2721: DD CB 07 6E bit  5,(ix+$07)
2725: C8          ret  z
2726: 06 98       ld   b,$98
2728: CD 3F 1F    call $1F3F
272B: C9          ret
272C: DD 7E 00    ld   a,(ix+$00)
272F: E6 06       and  $06
2731: FE 02       cp   $02
2733: 28 35       jr   z,$276A
2735: DD CB 11 BE res  7,(ix+$11)
2739: 21 01 E0    ld   hl,$E001
273C: CB D6       set  2,(hl)
273E: DD 7E 10    ld   a,(ix+$10)
2741: 47          ld   b,a
2742: E6 06       and  $06
2744: FE 02       cp   $02
2746: 20 11       jr   nz,$2759
2748: DD 7E 07    ld   a,(ix+$07)
274B: E6 A0       and  $A0
274D: B0          or   b
274E: E6 B8       and  $B8
2750: DD 77 07    ld   (ix+$07),a
2753: DD 36 10 02 ld   (ix+$10),$02
2757: 18 23       jr   $277C
2759: 47          ld   b,a
275A: DD 7E 07    ld   a,(ix+$07)
275D: 4F          ld   c,a
275E: E6 18       and  $18
2760: B0          or   b
2761: DD 77 10    ld   (ix+$10),a
2764: 79          ld   a,c
2765: E6 A0       and  $A0
2767: DD 77 07    ld   (ix+$07),a
276A: DD 7E 10    ld   a,(ix+$10)
276D: 2F          cpl
276E: E6 18       and  $18
2770: 20 0A       jr   nz,$277C
2772: DD 7E 01    ld   a,(ix+$01)
2775: E6 07       and  $07
2777: FE 03       cp   $03
2779: DC 03 1D    call c,$1D03
277C: DD 7E 01    ld   a,(ix+$01)
277F: E6 0F       and  $0F
2781: FE 07       cp   $07
2783: 28 04       jr   z,$2789
2785: FE 08       cp   $08
2787: 20 23       jr   nz,$27AC
2789: DD CB 11 7E bit  7,(ix+$11)
278D: 20 21       jr   nz,$27B0
278F: DD CB 11 FE set  7,(ix+$11)
2793: CD A3 1D    call $1DA3
2796: CB 46       bit  0,(hl)
2798: 28 09       jr   z,$27A3
279A: CD 16 28    call $2816
279D: DD 36 10 02 ld   (ix+$10),$02
27A1: 18 4C       jr   $27EF
27A3: CD 24 28    call $2824
27A6: DD 36 10 12 ld   (ix+$10),$12
27AA: 18 43       jr   $27EF
27AC: DD CB 11 BE res  7,(ix+$11)
27B0: DD 7E 07    ld   a,(ix+$07)
27B3: 47          ld   b,a
27B4: E6 14       and  $14
27B6: FE 10       cp   $10
27B8: 20 31       jr   nz,$27EB
27BA: DD 7E 01    ld   a,(ix+$01)
27BD: E6 07       and  $07
27BF: CB 58       bit  3,b
27C1: 20 0A       jr   nz,$27CD
27C3: FE 05       cp   $05
27C5: 28 0E       jr   z,$27D5
27C7: FE 06       cp   $06
27C9: 20 24       jr   nz,$27EF
27CB: 18 08       jr   $27D5
27CD: FE 01       cp   $01
27CF: 28 04       jr   z,$27D5
27D1: FE 02       cp   $02
27D3: 20 1A       jr   nz,$27EF
27D5: CD 3B 1B    call $1B3B
27D8: CD 62 28    call $2862
27DB: DD 7E 01    ld   a,(ix+$01)
27DE: E6 0F       and  $0F
27E0: FE 09       cp   $09
27E2: 38 0B       jr   c,$27EF
27E4: FE 0B       cp   $0B
27E6: DC C5 1E    call c,$1EC5
27E9: 18 04       jr   $27EF
27EB: DD CB 07 96 res  2,(ix+$07)
27EF: CD 78 1F    call $1F78
27F2: CD 4B 28    call $284B
27F5: DD 66 01    ld   h,(ix+$01)
27F8: DD 6E 02    ld   l,(ix+$02)
27FB: 19          add  hl,de
27FC: DD 74 01    ld   (ix+$01),h
27FF: DD 75 02    ld   (ix+$02),l
2802: DD 7E 03    ld   a,(ix+$03)
2805: 3C          inc  a
2806: E6 F0       and  $F0
2808: DD 77 03    ld   (ix+$03),a
280B: DD CB 07 6E bit  5,(ix+$07)
280F: C8          ret  z
2810: 06 98       ld   b,$98
2812: CD 3F 1F    call $1F3F
2815: C9          ret
2816: 21 01 E0    ld   hl,$E001
2819: CB C6       set  0,(hl)
281B: DD 7E 07    ld   a,(ix+$07)
281E: E6 E0       and  $E0
2820: DD 77 07    ld   (ix+$07),a
2823: C9          ret
2824: 21 01 E0    ld   hl,$E001
2827: CB C6       set  0,(hl)
2829: DD 7E 07    ld   a,(ix+$07)
282C: E6 E0       and  $E0
282E: F6 10       or   $10
2830: DD 77 07    ld   (ix+$07),a
2833: C9          ret
2834: DD 7E 07    ld   a,(ix+$07)
2837: CB 6F       bit  5,a
2839: 20 0C       jr   nz,$2847
283B: E6 10       and  $10
283D: 20 04       jr   nz,$2843
283F: 11 D5 00    ld   de,$00D5
2842: C9          ret
2843: 11 AB 00    ld   de,$00AB
2846: C9          ret
2847: 11 80 00    ld   de,$0080
284A: C9          ret
284B: DD 7E 07    ld   a,(ix+$07)
284E: CB 6F       bit  5,a
2850: 20 0C       jr   nz,$285E
2852: E6 10       and  $10
2854: 20 04       jr   nz,$285A
2856: 11 2B FF    ld   de,$FF2B
2859: C9          ret
285A: 11 55 FF    ld   de,$FF55
285D: C9          ret
285E: 11 80 FF    ld   de,$FF80
2861: C9          ret
2862: 21 CE E1    ld   hl,$E1CE
2865: 06 04       ld   b,$04
2867: 7E          ld   a,(hl)
2868: FE DC       cp   $DC
286A: 38 17       jr   c,$2883
286C: FD 35 0B    dec  (iy+$0b)
286F: FD 7E 0B    ld   a,(iy+$0b)
2872: E6 03       and  $03
2874: 20 0D       jr   nz,$2883
2876: C5          push bc
2877: E5          push hl
2878: CD 94 28    call $2894
287B: E1          pop  hl
287C: C1          pop  bc
287D: FD 7E 0B    ld   a,(iy+$0b)
2880: A7          and  a
2881: 28 04       jr   z,$2887
2883: 23          inc  hl
2884: 10 E1       djnz $2867
2886: C9          ret
2887: 21 B6 E1    ld   hl,$E1B6
288A: CB FE       set  7,(hl)
288C: FD 36 30 02 ld   (iy+$30),$02
2890: FD 34 09    inc  (iy+$09)
2893: C9          ret
2894: FD 7E 10    ld   a,(iy+$10)
2897: A7          and  a
2898: 20 10       jr   nz,$28AA
289A: FD 36 11 00 ld   (iy+$11),$00
289E: FD 36 10 1E ld   (iy+$10),$1E
28A2: 11 DB 28    ld   de,$28DB
28A5: CD 2A 03    call $032A
28A8: 18 24       jr   $28CE
28AA: FD 34 11    inc  (iy+$11)
28AD: FD 7E 11    ld   a,(iy+$11)
28B0: FE 08       cp   $08
28B2: 30 E6       jr   nc,$289A
28B4: FE 07       cp   $07
28B6: 38 E6       jr   c,$289E
28B8: 11 DE 28    ld   de,$28DE
28BB: CD 2A 03    call $032A
28BE: DD 36 0D 1E ld   (ix+$0d),$1E
28C2: DD 7E 01    ld   a,(ix+$01)
28C5: DD 77 0E    ld   (ix+$0e),a
28C8: DD 7E 03    ld   a,(ix+$03)
28CB: DD 77 0F    ld   (ix+$0f),a
28CE: FD 7E 11    ld   a,(iy+$11)
28D1: C6 01       add  a,$01
28D3: 06 00       ld   b,$00
28D5: CD D9 02    call $02D9
28D8: C9          ret

28DF: DD 46 00    ld   b,(ix+$00)
28E2: CB 58       bit  3,b
28E4: C2 C4 2A    jp   nz,$2AC4
28E7: 3A 00 E0    ld   a,($E000)
28EA: E6 40       and  $40
28EC: 20 05       jr   nz,$28F3
28EE: DD 36 00 00 ld   (ix+$00),$00
28F2: C9          ret
28F3: 3A B6 E1    ld   a,($E1B6)
28F6: A7          and  a
28F7: C2 B2 2A    jp   nz,$2AB2
28FA: 3A C5 E1    ld   a,($E1C5)
28FD: E6 98       and  $98
28FF: FE 80       cp   $80
2901: C2 B2 2A    jp   nz,$2AB2
2904: DD 34 08    inc  (ix+$08)
2907: FD E5       push iy
2909: FD 21 C5 E1 ld   iy,$E1C5
290D: 01 09 09    ld   bc,$0909
2910: CD D7 05    call $05D7
2913: 30 0B       jr   nc,$2920
2915: FD CB 07 FE set  7,(iy+$07)
2919: FD E1       pop  iy
291B: DD 36 00 00 ld   (ix+$00),$00
291F: C9          ret
2920: FD 21 1A E2 ld   iy,$E21A
2924: 11 15 00    ld   de,$0015
2927: 06 08       ld   b,$08
2929: FD 7E 00    ld   a,(iy+$00)
292C: E6 98       and  $98
292E: FE 80       cp   $80
2930: 20 15       jr   nz,$2947
2932: C5          push bc
2933: 01 0A 0A    ld   bc,$0A0A
2936: CD D7 05    call $05D7
2939: C1          pop  bc
293A: 30 0B       jr   nc,$2947
293C: FD CB 00 DE set  3,(iy+$00)
2940: DD CB 00 DE set  3,(ix+$00)
2944: FD E1       pop  iy
2946: C9          ret
2947: FD 19       add  iy,de
2949: 10 DE       djnz $2929
294B: FD 21 D3 E2 ld   iy,$E2D3
294F: 11 0F 00    ld   de,$000F
2952: 06 03       ld   b,$03
2954: FD 7E 00    ld   a,(iy+$00)
2957: E6 BC       and  $BC
2959: FE 80       cp   $80
295B: 20 19       jr   nz,$2976
295D: C5          push bc
295E: 01 0A 0A    ld   bc,$0A0A
2961: CD D7 05    call $05D7
2964: C1          pop  bc
2965: 30 0F       jr   nc,$2976
2967: FD CB 00 DE set  3,(iy+$00)
296B: DD CB 00 DE set  3,(ix+$00)
296F: FD E1       pop  iy
2971: FD 36 0C 01 ld   (iy+$0c),$01
2975: C9          ret
2976: FD 19       add  iy,de
2978: 10 DA       djnz $2954
297A: FD 21 C2 E2 ld   iy,$E2C2
297E: FD 7E 00    ld   a,(iy+$00)
2981: E6 B8       and  $B8
2983: FE A0       cp   $A0
2985: 20 17       jr   nz,$299E
2987: 01 0A 0A    ld   bc,$0A0A
298A: CD D7 05    call $05D7
298D: 30 0F       jr   nc,$299E
298F: FD CB 00 DE set  3,(iy+$00)
2993: DD CB 00 DE set  3,(ix+$00)
2997: FD E1       pop  iy
2999: FD 36 0C 01 ld   (iy+$0c),$01
299D: C9          ret
299E: FD E1       pop  iy
29A0: 11 31 00    ld   de,$0031
29A3: FD 19       add  iy,de
29A5: 11 07 00    ld   de,$0007
29A8: 06 0C       ld   b,$0C
29AA: FD 7E 00    ld   a,(iy+$00)
29AD: FE 80       cp   $80
29AF: 38 12       jr   c,$29C3
29B1: FE D0       cp   $D0
29B3: 28 04       jr   z,$29B9
29B5: FE C8       cp   $C8
29B7: 30 0A       jr   nc,$29C3
29B9: C5          push bc
29BA: 01 08 08    ld   bc,$0808
29BD: CD D7 05    call $05D7
29C0: 38 07       jr   c,$29C9
29C2: C1          pop  bc
29C3: FD 19       add  iy,de
29C5: 10 E3       djnz $29AA
29C7: 18 42       jr   $2A0B
29C9: D1          pop  de
29CA: FD 7E 00    ld   a,(iy+$00)
29CD: FE B8       cp   $B8
29CF: 38 09       jr   c,$29DA
29D1: FE D0       cp   $D0
29D3: 28 05       jr   z,$29DA
29D5: DD CB 00 DE set  3,(ix+$00)
29D9: C9          ret
29DA: DD 7E 00    ld   a,(ix+$00)
29DD: EE 03       xor  $03
29DF: DD 77 00    ld   (ix+$00),a
29E2: CD A1 2B    call $2BA1
29E5: DD 6E 03    ld   l,(ix+$03)
29E8: FD 56 01    ld   d,(iy+$01)
29EB: FD 5E 03    ld   e,(iy+$03)
29EE: CD EF 05    call $05EF
29F1: 30 04       jr   nc,$29F7
29F3: DD CB 00 E6 set  4,(ix+$00)
29F7: D5          push de
29F8: CD B5 2B    call $2BB5
29FB: D1          pop  de
29FC: 6C          ld   l,h
29FD: DD 66 01    ld   h,(ix+$01)
2A00: CD EF 05    call $05EF
2A03: 30 04       jr   nc,$2A09
2A05: DD CB 00 EE set  5,(ix+$00)
2A09: 18 59       jr   $2A64
2A0B: DD 7E 01    ld   a,(ix+$01)
2A0E: FE 24       cp   $24
2A10: 38 04       jr   c,$2A16
2A12: FE DB       cp   $DB
2A14: 38 04       jr   c,$2A1A
2A16: DD CB 00 EE set  5,(ix+$00)
2A1A: DD 7E 03    ld   a,(ix+$03)
2A1D: FE 1C       cp   $1C
2A1F: 38 04       jr   c,$2A25
2A21: FE E3       cp   $E3
2A23: 38 04       jr   c,$2A29
2A25: DD CB 00 E6 set  4,(ix+$00)
2A29: DD 7E 00    ld   a,(ix+$00)
2A2C: E6 30       and  $30
2A2E: 20 4F       jr   nz,$2A7F
2A30: DD 56 01    ld   d,(ix+$01)
2A33: DD 5E 03    ld   e,(ix+$03)
2A36: CD C9 2B    call $2BC9
2A39: DA A0 2A    jp   c,$2AA0
2A3C: DD 7E 00    ld   a,(ix+$00)
2A3F: EE 03       xor  $03
2A41: DD 77 00    ld   (ix+$00),a
2A44: CD A1 2B    call $2BA1
2A47: EB          ex   de,hl
2A48: DD 5E 03    ld   e,(ix+$03)
2A4B: CD C9 2B    call $2BC9
2A4E: 38 04       jr   c,$2A54
2A50: DD CB 00 E6 set  4,(ix+$00)
2A54: CD B5 2B    call $2BB5
2A57: DD 56 01    ld   d,(ix+$01)
2A5A: 5C          ld   e,h
2A5B: CD C9 2B    call $2BC9
2A5E: 38 04       jr   c,$2A64
2A60: DD CB 00 EE set  5,(ix+$00)
2A64: DD 7E 00    ld   a,(ix+$00)
2A67: EE 03       xor  $03
2A69: DD 77 00    ld   (ix+$00),a
2A6C: E6 30       and  $30
2A6E: 20 0F       jr   nz,$2A7F
2A70: CD F4 02    call $02F4
2A73: E6 20       and  $20
2A75: 20 02       jr   nz,$2A79
2A77: 3E 10       ld   a,$10
2A79: DD B6 00    or   (ix+$00)
2A7C: DD 77 00    ld   (ix+$00),a
2A7F: DD 34 07    inc  (ix+$07)
2A82: 20 05       jr   nz,$2A89
2A84: DD CB 00 DE set  3,(ix+$00)
2A88: C9          ret
2A89: 3E 16       ld   a,$16
2A8B: 06 00       ld   b,$00
2A8D: CD D9 02    call $02D9
2A90: DD 7E 00    ld   a,(ix+$00)
2A93: 47          ld   b,a
2A94: 0F          rrca
2A95: 0F          rrca
2A96: 0F          rrca
2A97: 0F          rrca
2A98: E6 03       and  $03
2A9A: A8          xor  b
2A9B: E6 83       and  $83
2A9D: DD 77 00    ld   (ix+$00),a
2AA0: CD A1 2B    call $2BA1
2AA3: DD 74 01    ld   (ix+$01),h
2AA6: DD 75 02    ld   (ix+$02),l
2AA9: CD B5 2B    call $2BB5
2AAC: DD 74 03    ld   (ix+$03),h
2AAF: DD 75 04    ld   (ix+$04),l
2AB2: 01 06 66    ld   bc,$6606
2AB5: DD 7E 00    ld   a,(ix+$00)
2AB8: E6 03       and  $03
2ABA: 87          add  a,a
2ABB: 87          add  a,a
2ABC: 87          add  a,a
2ABD: 87          add  a,a
2ABE: B1          or   c
2ABF: 4F          ld   c,a
2AC0: CD 97 02    call $0297
2AC3: C9          ret
2AC4: DD 7E 06    ld   a,(ix+$06)
2AC7: E6 30       and  $30
2AC9: 20 32       jr   nz,$2AFD
2ACB: CD B2 2C    call $2CB2
2ACE: DD CB 06 E6 set  4,(ix+$06)
2AD2: DD 36 05 01 ld   (ix+$05),$01
2AD6: DD CB 01 3E srl  (ix+$01)
2ADA: DD CB 02 1E rr   (ix+$02)
2ADE: DD CB 01 3E srl  (ix+$01)
2AE2: DD CB 02 1E rr   (ix+$02)
2AE6: DD CB 03 3E srl  (ix+$03)
2AEA: DD CB 04 1E rr   (ix+$04)
2AEE: DD CB 03 3E srl  (ix+$03)
2AF2: DD CB 04 1E rr   (ix+$04)
2AF6: 3E 1B       ld   a,$1B
2AF8: 06 00       ld   b,$00
2AFA: CD D9 02    call $02D9
2AFD: DD 34 07    inc  (ix+$07)
2B00: DD 35 05    dec  (ix+$05)
2B03: C2 72 2B    jp   nz,$2B72
2B06: DD 7E 06    ld   a,(ix+$06)
2B09: E6 30       and  $30
2B0B: FE 20       cp   $20
2B0D: CA 58 2B    jp   z,$2B58
2B10: DD 7E 06    ld   a,(ix+$06)
2B13: E6 0F       and  $0F
2B15: FE 0A       cp   $0A
2B17: D2 1F 2B    jp   nc,$2B1F
2B1A: CD 5B 2C    call $2C5B
2B1D: 18 53       jr   $2B72
2B1F: DD 7E 06    ld   a,(ix+$06)
2B22: C6 10       add  a,$10
2B24: E6 30       and  $30
2B26: DD 77 06    ld   (ix+$06),a
2B29: 28 23       jr   z,$2B4E
2B2B: 3A 01 E0    ld   a,($E001)
2B2E: E6 40       and  $40
2B30: 28 04       jr   z,$2B36
2B32: 3E 01       ld   a,$01
2B34: 18 09       jr   $2B3F
2B36: FD 7E 0C    ld   a,(iy+$0c)
2B39: FE 05       cp   $05
2B3B: 38 02       jr   c,$2B3F
2B3D: 3E 04       ld   a,$04
2B3F: 5F          ld   e,a
2B40: 16 00       ld   d,$00
2B42: 21 91 2E    ld   hl,$2E91
2B45: 19          add  hl,de
2B46: 7E          ld   a,(hl)
2B47: DD 77 05    ld   (ix+$05),a
2B4A: CD C8 2C    call $2CC8
2B4D: C9          ret
2B4E: DD 36 00 00 ld   (ix+$00),$00
2B52: 21 CC E1    ld   hl,$E1CC
2B55: CB FE       set  7,(hl)
2B57: C9          ret
2B58: CD B2 2C    call $2CB2
2B5B: DD 36 06 30 ld   (ix+$06),$30
2B5F: DD 36 05 01 ld   (ix+$05),$01
2B63: CD 38 2C    call $2C38
2B66: CD C8 2C    call $2CC8
2B69: C0          ret  nz
2B6A: 3E 1C       ld   a,$1C
2B6C: 06 00       ld   b,$00
2B6E: CD D9 02    call $02D9
2B71: C9          ret
2B72: DD 7E 06    ld   a,(ix+$06)
2B75: E6 30       and  $30
2B77: FE 30       cp   $30
2B79: CC 38 2C    call z,$2C38
2B7C: 06 05       ld   b,$05
2B7E: 11 0A 00    ld   de,$000A
2B81: FD 21 E0 E1 ld   iy,$E1E0
2B85: DD CB 07 46 bit  0,(ix+$07)
2B89: 28 04       jr   z,$2B8F
2B8B: FD 21 E5 E1 ld   iy,$E1E5
2B8F: FD CB 00 7E bit  7,(iy+$00)
2B93: 28 07       jr   z,$2B9C
2B95: C5          push bc
2B96: D5          push de
2B97: CD EB 2C    call $2CEB
2B9A: D1          pop  de
2B9B: C1          pop  bc
2B9C: FD 19       add  iy,de
2B9E: 10 EF       djnz $2B8F
2BA0: C9          ret
2BA1: DD 56 01    ld   d,(ix+$01)
2BA4: DD 5E 02    ld   e,(ix+$02)
2BA7: 21 1F 02    ld   hl,$021F
2BAA: DD CB 00 4E bit  1,(ix+$00)
2BAE: 28 03       jr   z,$2BB3
2BB0: 21 E1 FD    ld   hl,$FDE1
2BB3: 19          add  hl,de
2BB4: C9          ret
2BB5: DD 56 03    ld   d,(ix+$03)
2BB8: DD 5E 04    ld   e,(ix+$04)
2BBB: 21 1F 02    ld   hl,$021F
2BBE: DD CB 00 46 bit  0,(ix+$00)
2BC2: 28 03       jr   z,$2BC7
2BC4: 21 E1 FD    ld   hl,$FDE1
2BC7: 19          add  hl,de
2BC8: C9          ret
2BC9: D5          push de
2BCA: CD 89 1D    call $1D89
2BCD: D1          pop  de
2BCE: 7E          ld   a,(hl)
2BCF: D6 72       sub  $72
2BD1: D8          ret  c
2BD2: 1F          rra
2BD3: F5          push af
2BD4: 4F          ld   c,a
2BD5: 06 00       ld   b,$00
2BD7: 21 F1 2B    ld   hl,$2BF1
2BDA: 09          add  hl,bc
2BDB: F1          pop  af
2BDC: 3E 10       ld   a,$10
2BDE: 30 02       jr   nc,$2BE2
2BE0: 3E 01       ld   a,$01
2BE2: CB 52       bit  2,d
2BE4: 20 02       jr   nz,$2BE8
2BE6: 87          add  a,a
2BE7: 87          add  a,a
2BE8: CB 53       bit  2,e
2BEA: 20 01       jr   nz,$2BED
2BEC: 87          add  a,a
2BED: A6          and  (hl)
2BEE: C0          ret  nz
2BEF: 37          scf
2BF0: C9          ret


2C38: 2A C6 E1    ld   hl,($E1C6)
2C3B: CB 3D       srl  l
2C3D: CB 1C       rr   h
2C3F: CB 3D       srl  l
2C41: CB 1C       rr   h
2C43: DD 75 01    ld   (ix+$01),l
2C46: DD 74 02    ld   (ix+$02),h
2C49: 2A C8 E1    ld   hl,($E1C8)
2C4C: CB 3D       srl  l
2C4E: CB 1C       rr   h
2C50: CB 3D       srl  l
2C52: CB 1C       rr   h
2C54: DD 75 03    ld   (ix+$03),l
2C57: DD 74 04    ld   (ix+$04),h
2C5A: C9          ret
2C5B: DD 7E 06    ld   a,(ix+$06)
2C5E: E6 0F       and  $0F
2C60: 47          ld   b,a
2C61: 87          add  a,a
2C62: 80          add  a,b
2C63: 5F          ld   e,a
2C64: 16 00       ld   d,$00
2C66: 21 48 2E    ld   hl,$2E48
2C69: 19          add  hl,de
2C6A: 7E          ld   a,(hl)
2C6B: DD 77 05    ld   (ix+$05),a
2C6E: 44          ld   b,h
2C6F: 4D          ld   c,l
2C70: 03          inc  bc
2C71: DD CB 06 6E bit  5,(ix+$06)
2C75: 28 01       jr   z,$2C78
2C77: 03          inc  bc
2C78: 0A          ld   a,(bc)
2C79: E6 F0       and  $F0
2C7B: 0F          rrca
2C7C: 0F          rrca
2C7D: 0F          rrca
2C7E: 21 66 2E    ld   hl,$2E66
2C81: CD C0 2C    call $2CC0
2C84: D5          push de
2C85: 0A          ld   a,(bc)
2C86: E6 0F       and  $0F
2C88: 87          add  a,a
2C89: 21 66 2E    ld   hl,$2E66
2C8C: CD C0 2C    call $2CC0
2C8F: DD 7E 06    ld   a,(ix+$06)
2C92: E6 0F       and  $0F
2C94: 47          ld   b,a
2C95: 87          add  a,a
2C96: 87          add  a,a
2C97: 80          add  a,b
2C98: 4F          ld   c,a
2C99: 06 00       ld   b,$00
2C9B: 21 E0 E1    ld   hl,$E1E0
2C9E: 09          add  hl,bc
2C9F: C1          pop  bc
2CA0: DD 7E 06    ld   a,(ix+$06)
2CA3: F6 80       or   $80
2CA5: 77          ld   (hl),a
2CA6: 23          inc  hl
2CA7: 70          ld   (hl),b
2CA8: 23          inc  hl
2CA9: 71          ld   (hl),c
2CAA: 23          inc  hl
2CAB: 72          ld   (hl),d
2CAC: 23          inc  hl
2CAD: 73          ld   (hl),e
2CAE: DD 34 06    inc  (ix+$06)
2CB1: C9          ret
2CB2: 21 E0 E1    ld   hl,$E1E0
2CB5: 11 05 00    ld   de,$0005
2CB8: 06 0A       ld   b,$0A
2CBA: 36 00       ld   (hl),$00
2CBC: 19          add  hl,de
2CBD: 10 FB       djnz $2CBA
2CBF: C9          ret
2CC0: 5F          ld   e,a
2CC1: 16 00       ld   d,$00
2CC3: 19          add  hl,de
2CC4: 5E          ld   e,(hl)
2CC5: 23          inc  hl
2CC6: 56          ld   d,(hl)
2CC7: C9          ret
2CC8: 3A 00 E0    ld   a,($E000)
2CCB: E6 40       and  $40
2CCD: 28 0C       jr   z,$2CDB
2CCF: 3A B6 E1    ld   a,($E1B6)
2CD2: A7          and  a
2CD3: 20 06       jr   nz,$2CDB
2CD5: 3A C5 E1    ld   a,($E1C5)
2CD8: E6 18       and  $18
2CDA: C8          ret  z
2CDB: DD 36 00 00 ld   (ix+$00),$00
2CDF: 3E FF       ld   a,$FF
2CE1: B7          or   a
2CE2: C9          ret
2CE3: 78          ld   a,b
2CE4: 2F          cpl
2CE5: 47          ld   b,a
2CE6: 79          ld   a,c
2CE7: 2F          cpl
2CE8: 4F          ld   c,a
2CE9: 03          inc  bc
2CEA: C9          ret
2CEB: FD CB 00 6E bit  5,(iy+$00)
2CEF: 20 48       jr   nz,$2D39
2CF1: FD 7E 01    ld   a,(iy+$01)
2CF4: FE 30       cp   $30
2CF6: 30 07       jr   nc,$2CFF
2CF8: FD 7E 03    ld   a,(iy+$03)
2CFB: FE 36       cp   $36
2CFD: 38 05       jr   c,$2D04
2CFF: FD 36 00 00 ld   (iy+$00),$00
2D03: C9          ret
2D04: CD 39 2E    call $2E39
2D07: 0A          ld   a,(bc)
2D08: E6 F0       and  $F0
2D0A: 0F          rrca
2D0B: 0F          rrca
2D0C: 0F          rrca
2D0D: 21 80 2E    ld   hl,$2E80
2D10: CD C0 2C    call $2CC0
2D13: FD 66 01    ld   h,(iy+$01)
2D16: FD 6E 02    ld   l,(iy+$02)
2D19: 19          add  hl,de
2D1A: FD 74 01    ld   (iy+$01),h
2D1D: FD 75 02    ld   (iy+$02),l
2D20: 0A          ld   a,(bc)
2D21: E6 0F       and  $0F
2D23: 87          add  a,a
2D24: 21 80 2E    ld   hl,$2E80
2D27: CD C0 2C    call $2CC0
2D2A: FD 66 03    ld   h,(iy+$03)
2D2D: FD 6E 04    ld   l,(iy+$04)
2D30: 19          add  hl,de
2D31: FD 74 03    ld   (iy+$03),h
2D34: FD 75 04    ld   (iy+$04),l
2D37: 18 43       jr   $2D7C
2D39: FD CB 01 7E bit  7,(iy+$01)
2D3D: 20 C0       jr   nz,$2CFF
2D3F: FD CB 03 7E bit  7,(iy+$03)
2D43: 20 BA       jr   nz,$2CFF
2D45: CD 39 2E    call $2E39
2D48: 0A          ld   a,(bc)
2D49: E6 F0       and  $F0
2D4B: 0F          rrca
2D4C: 0F          rrca
2D4D: 0F          rrca
2D4E: 21 80 2E    ld   hl,$2E80
2D51: CD C0 2C    call $2CC0
2D54: FD 66 01    ld   h,(iy+$01)
2D57: FD 6E 02    ld   l,(iy+$02)
2D5A: A7          and  a
2D5B: ED 52       sbc  hl,de
2D5D: FD 74 01    ld   (iy+$01),h
2D60: FD 75 02    ld   (iy+$02),l
2D63: 0A          ld   a,(bc)
2D64: E6 0F       and  $0F
2D66: 87          add  a,a
2D67: 21 80 2E    ld   hl,$2E80
2D6A: CD C0 2C    call $2CC0
2D6D: FD 66 03    ld   h,(iy+$03)
2D70: FD 6E 04    ld   l,(iy+$04)
2D73: A7          and  a
2D74: ED 52       sbc  hl,de
2D76: FD 74 03    ld   (iy+$03),h
2D79: FD 75 04    ld   (iy+$04),l
2D7C: 01 0A 70    ld   bc,$700A
2D7F: DD CB 00 56 bit  2,(ix+$00)
2D83: 28 03       jr   z,$2D88
2D85: 01 0A 79    ld   bc,$790A
2D88: C5          push bc
2D89: CD A1 2D    call $2DA1
2D8C: C1          pop  bc
2D8D: C5          push bc
2D8E: CB E1       set  4,c
2D90: CD C0 2D    call $2DC0
2D93: C1          pop  bc
2D94: CB E9       set  5,c
2D96: C5          push bc
2D97: CD E0 2D    call $2DE0
2D9A: C1          pop  bc
2D9B: CB E1       set  4,c
2D9D: CD 00 2E    call $2E00
2DA0: C9          ret
2DA1: FD 56 01    ld   d,(iy+$01)
2DA4: FD 5E 02    ld   e,(iy+$02)
2DA7: DD 66 01    ld   h,(ix+$01)
2DAA: DD 6E 02    ld   l,(ix+$02)
2DAD: 19          add  hl,de
2DAE: E5          push hl
2DAF: FD 56 03    ld   d,(iy+$03)
2DB2: FD 5E 04    ld   e,(iy+$04)
2DB5: DD 66 03    ld   h,(ix+$03)
2DB8: DD 6E 04    ld   l,(ix+$04)
2DBB: 19          add  hl,de
2DBC: D1          pop  de
2DBD: C3 20 2E    jp   $2E20
2DC0: FD 56 03    ld   d,(iy+$03)
2DC3: FD 5E 04    ld   e,(iy+$04)
2DC6: DD 66 01    ld   h,(ix+$01)
2DC9: DD 6E 02    ld   l,(ix+$02)
2DCC: 19          add  hl,de
2DCD: E5          push hl
2DCE: FD 56 01    ld   d,(iy+$01)
2DD1: FD 5E 02    ld   e,(iy+$02)
2DD4: DD 66 03    ld   h,(ix+$03)
2DD7: DD 6E 04    ld   l,(ix+$04)
2DDA: A7          and  a
2DDB: ED 52       sbc  hl,de
2DDD: D1          pop  de
2DDE: 18 40       jr   $2E20
2DE0: FD 56 03    ld   d,(iy+$03)
2DE3: FD 5E 04    ld   e,(iy+$04)
2DE6: DD 66 01    ld   h,(ix+$01)
2DE9: DD 6E 02    ld   l,(ix+$02)
2DEC: A7          and  a
2DED: ED 52       sbc  hl,de
2DEF: E5          push hl
2DF0: FD 56 01    ld   d,(iy+$01)
2DF3: FD 5E 02    ld   e,(iy+$02)
2DF6: DD 66 03    ld   h,(ix+$03)
2DF9: DD 6E 04    ld   l,(ix+$04)
2DFC: 19          add  hl,de
2DFD: D1          pop  de
2DFE: 18 20       jr   $2E20
2E00: FD 56 01    ld   d,(iy+$01)
2E03: FD 5E 02    ld   e,(iy+$02)
2E06: DD 66 01    ld   h,(ix+$01)
2E09: DD 6E 02    ld   l,(ix+$02)
2E0C: A7          and  a
2E0D: ED 52       sbc  hl,de
2E0F: E5          push hl
2E10: FD 56 03    ld   d,(iy+$03)
2E13: FD 5E 04    ld   e,(iy+$04)
2E16: DD 66 03    ld   h,(ix+$03)
2E19: DD 6E 04    ld   l,(ix+$04)
2E1C: A7          and  a
2E1D: ED 52       sbc  hl,de
2E1F: D1          pop  de
2E20: 7A          ld   a,d
2E21: FE 06       cp   $06
2E23: D8          ret  c
2E24: FE 3A       cp   $3A
2E26: D0          ret  nc
2E27: 7C          ld   a,h
2E28: FE 01       cp   $01
2E2A: D8          ret  c
2E2B: FE 3E       cp   $3E
2E2D: D0          ret  nc
2E2E: EB          ex   de,hl
2E2F: 29          add  hl,hl
2E30: 29          add  hl,hl
2E31: EB          ex   de,hl
2E32: 29          add  hl,hl
2E33: 29          add  hl,hl
2E34: 5C          ld   e,h
2E35: CD 9D 02    call $029D
2E38: C9          ret
2E39: FD 7E 00    ld   a,(iy+$00)
2E3C: E6 0F       and  $0F
2E3E: 5F          ld   e,a
2E3F: 16 00       ld   d,$00
2E41: 21 76 2E    ld   hl,$2E76
2E44: 19          add  hl,de
2E45: 44          ld   b,h
2E46: 4D          ld   c,l
2E47: C9          ret

2F01: 3A 00 E0    ld   a,($E000)
2F04: E6 40       and  $40
2F06: 20 05       jr   nz,$2F0D
2F08: DD 36 00 00 ld   (ix+$00),$00
2F0C: C9          ret
2F0D: DD CB 00 76 bit  6,(ix+$00)
2F11: 20 4A       jr   nz,$2F5D
2F13: 11 CF 81    ld   de,$81CF
2F16: 01 02 02    ld   bc,$0202
2F19: CD 6C 04    call $046C
2F1C: DD CB 00 F6 set  6,(ix+$00)
2F20: DD 36 02 00 ld   (ix+$02),$00
2F24: FD 7E 0A    ld   a,(iy+$0a)
2F27: DD 77 03    ld   (ix+$03),a
2F2A: DD 36 04 00 ld   (ix+$04),$00
2F2E: DD 36 05 00 ld   (ix+$05),$00
2F32: DD 36 06 00 ld   (ix+$06),$00
2F36: DD 36 07 FF ld   (ix+$07),$FF
2F3A: FD 36 12 00 ld   (iy+$12),$00
2F3E: FD 36 13 3C ld   (iy+$13),$3C
2F42: CD 76 1A    call $1A76
2F45: FE 14       cp   $14
2F47: 38 02       jr   c,$2F4B
2F49: 3E 13       ld   a,$13
2F4B: 5F          ld   e,a
2F4C: 16 00       ld   d,$00
2F4E: 21 F9 31    ld   hl,$31F9
2F51: 19          add  hl,de
2F52: 7E          ld   a,(hl)
2F53: FD 77 0E    ld   (iy+$0e),a
2F56: FD 36 0F 3C ld   (iy+$0f),$3C
2F5A: C3 17 30    jp   $3017
2F5D: FD 7E 0E    ld   a,(iy+$0e)
2F60: A7          and  a
2F61: 28 0C       jr   z,$2F6F
2F63: FD 35 0F    dec  (iy+$0f)
2F66: 20 07       jr   nz,$2F6F
2F68: FD 36 0F 3C ld   (iy+$0f),$3C
2F6C: FD 35 0E    dec  (iy+$0e)
2F6F: FD 35 13    dec  (iy+$13)
2F72: 20 12       jr   nz,$2F86
2F74: FD 36 13 3C ld   (iy+$13),$3C
2F78: FD 34 12    inc  (iy+$12)
2F7B: FD 7E 12    ld   a,(iy+$12)
2F7E: FE 40       cp   $40
2F80: 38 04       jr   c,$2F86
2F82: FD 36 12 30 ld   (iy+$12),$30
2F86: 3A B6 E1    ld   a,($E1B6)
2F89: A7          and  a
2F8A: 20 4E       jr   nz,$2FDA
2F8C: 3A 01 E0    ld   a,($E001)
2F8F: E6 60       and  $60
2F91: 20 47       jr   nz,$2FDA
2F93: 3A 00 E0    ld   a,($E000)
2F96: E6 08       and  $08
2F98: 20 40       jr   nz,$2FDA
2F9A: 3A C5 E1    ld   a,($E1C5)
2F9D: E6 98       and  $98
2F9F: FE 80       cp   $80
2FA1: 20 37       jr   nz,$2FDA
2FA3: DD 7E 07    ld   a,(ix+$07)
2FA6: DD 36 07 FF ld   (ix+$07),$FF
2FAA: DD CB 06 46 bit  0,(ix+$06)
2FAE: 20 16       jr   nz,$2FC6
2FB0: FE 51       cp   $51
2FB2: 30 26       jr   nc,$2FDA
2FB4: DD 36 06 01 ld   (ix+$06),$01
2FB8: 3E 0F       ld   a,$0F
2FBA: CD EA 02    call $02EA
2FBD: 3E 10       ld   a,$10
2FBF: 06 00       ld   b,$00
2FC1: CD D9 02    call $02D9
2FC4: 18 14       jr   $2FDA
2FC6: FE 71       cp   $71
2FC8: 38 10       jr   c,$2FDA
2FCA: DD 36 06 00 ld   (ix+$06),$00
2FCE: 3E 10       ld   a,$10
2FD0: CD EA 02    call $02EA
2FD3: 3E 0F       ld   a,$0F
2FD5: 06 00       ld   b,$00
2FD7: CD D9 02    call $02D9
2FDA: DD CB 00 6E bit  5,(ix+$00)
2FDE: C2 75 30    jp   nz,$3075
2FE1: DD 46 01    ld   b,(ix+$01)
2FE4: DD 4E 02    ld   c,(ix+$02)
2FE7: 78          ld   a,b
2FE8: B1          or   c
2FE9: 28 09       jr   z,$2FF4
2FEB: 0B          dec  bc
2FEC: DD 70 01    ld   (ix+$01),b
2FEF: DD 71 02    ld   (ix+$02),c
2FF2: 18 4B       jr   $303F
2FF4: DD 35 05    dec  (ix+$05)
2FF7: 20 46       jr   nz,$303F
2FF9: 21 1A E2    ld   hl,$E21A
2FFC: 11 15 00    ld   de,$0015
2FFF: 06 08       ld   b,$08
3001: CB 7E       bit  7,(hl)
3003: 28 05       jr   z,$300A
3005: 19          add  hl,de
3006: 10 F9       djnz $3001
3008: 18 4D       jr   $3057
300A: 36 80       ld   (hl),$80
300C: DD 34 04    inc  (ix+$04)
300F: DD 7E 04    ld   a,(ix+$04)
3012: DD BE 03    cp   (ix+$03)
3015: 30 40       jr   nc,$3057
3017: CD 76 1A    call $1A76
301A: FE 14       cp   $14
301C: 38 02       jr   c,$3020
301E: 3E 13       ld   a,$13
3020: 87          add  a,a
3021: 5F          ld   e,a
3022: 16 00       ld   d,$00
3024: 21 A1 31    ld   hl,$31A1
3027: 19          add  hl,de
3028: 5E          ld   e,(hl)
3029: 23          inc  hl
302A: 56          ld   d,(hl)
302B: DD 6E 04    ld   l,(ix+$04)
302E: 26 00       ld   h,$00
3030: 29          add  hl,hl
3031: 19          add  hl,de
3032: 7E          ld   a,(hl)
3033: DD 77 02    ld   (ix+$02),a
3036: 23          inc  hl
3037: 7E          ld   a,(hl)
3038: DD 77 01    ld   (ix+$01),a
303B: DD 36 05 30 ld   (ix+$05),$30
303F: 06 2D       ld   b,$2D
3041: 0E 02       ld   c,$02
3043: DD 7E 05    ld   a,(ix+$05)
3046: FE 10       cp   $10
3048: 38 06       jr   c,$3050
304A: E6 08       and  $08
304C: 20 02       jr   nz,$3050
304E: 06 6C       ld   b,$6C
3050: 11 80 78    ld   de,$7880
3053: CD 9D 02    call $029D
3056: C9          ret
3057: DD CB 00 EE set  5,(ix+$00)
305B: CD 58 31    call $3158
305E: 5F          ld   e,a
305F: 87          add  a,a
3060: 87          add  a,a
3061: C6 00       add  a,$00
3063: 08          ex   af,af'
3064: 16 00       ld   d,$00
3066: 21 0D 32    ld   hl,$320D
3069: 19          add  hl,de
306A: 7E          ld   a,(hl)
306B: 01 02 02    ld   bc,$0202
306E: 11 CF 81    ld   de,$81CF
3071: CD 42 04    call $0442
3074: C9          ret
3075: CD 80 31    call $3180
3078: DD 7E 00    ld   a,(ix+$00)
307B: CB 57       bit  2,a
307D: C0          ret  nz
307E: E6 18       and  $18
3080: C2 13 31    jp   nz,$3113
3083: CD 58 31    call $3158
3086: 5F          ld   e,a
3087: C6 3D       add  a,$3D
3089: 47          ld   b,a
308A: 16 00       ld   d,$00
308C: 21 19 32    ld   hl,$3219
308F: 19          add  hl,de
3090: 4E          ld   c,(hl)
3091: 11 80 78    ld   de,$7880
3094: CD 9D 02    call $029D
3097: 3A C5 E1    ld   a,($E1C5)
309A: E6 98       and  $98
309C: FE 80       cp   $80
309E: C0          ret  nz
309F: 3A C6 E1    ld   a,($E1C6)
30A2: 67          ld   h,a
30A3: 3A C8 E1    ld   a,($E1C8)
30A6: 6F          ld   l,a
30A7: 11 80 78    ld   de,$7880
30AA: 01 05 05    ld   bc,$0505
30AD: CD EF 05    call $05EF
30B0: D0          ret  nc
30B1: DD CB 00 DE set  3,(ix+$00)
30B5: 21 00 E0    ld   hl,$E000
30B8: CB DE       set  3,(hl)
30BA: 21 C5 E1    ld   hl,$E1C5
30BD: CB BE       res  7,(hl)
30BF: DD 36 02 1E ld   (ix+$02),$1E
30C3: DD 36 01 01 ld   (ix+$01),$01
30C7: 11 CF 89    ld   de,$89CF
30CA: 01 02 01    ld   bc,$0102
30CD: CD 6C 04    call $046C
30D0: 11 D0 81    ld   de,$81D0
30D3: 01 02 01    ld   bc,$0102
30D6: CD 6C 04    call $046C
30D9: CD 58 31    call $3158
30DC: 5F          ld   e,a
30DD: 16 00       ld   d,$00
30DF: 21 25 32    ld   hl,$3225
30E2: 19          add  hl,de
30E3: 7E          ld   a,(hl)
30E4: 21 7D E0    ld   hl,$E07D
30E7: 36 00       ld   (hl),$00
30E9: 23          inc  hl
30EA: 77          ld   (hl),a
30EB: 23          inc  hl
30EC: 36 00       ld   (hl),$00
30EE: EB          ex   de,hl
30EF: CD 2A 03    call $032A
30F2: FD 36 1B 03 ld   (iy+$1b),$03
30F6: 3E 20       ld   a,$20
30F8: 06 00       ld   b,$00
30FA: CD D9 02    call $02D9
30FD: CD 58 31    call $3158
3100: C6 16       add  a,$16
3102: 32 CF 85    ld   ($85CF),a
3105: 3E 15       ld   a,$15
3107: 32 EF 85    ld   ($85EF),a
310A: 3E 09       ld   a,$09
310C: 32 CF 81    ld   ($81CF),a
310F: 32 EF 81    ld   ($81EF),a
3112: C9          ret
3113: DD 35 02    dec  (ix+$02)
3116: 28 07       jr   z,$311F
3118: E6 18       and  $18
311A: FE 08       cp   $08
311C: 28 DF       jr   z,$30FD
311E: C9          ret
311F: DD 36 02 1E ld   (ix+$02),$1E
3123: DD 35 01    dec  (ix+$01)
3126: C0          ret  nz
3127: E6 18       and  $18
3129: FE 10       cp   $10
312B: 30 21       jr   nc,$314E
312D: DD 7E 00    ld   a,(ix+$00)
3130: C6 08       add  a,$08
3132: DD 77 00    ld   (ix+$00),a
3135: DD 36 01 09 ld   (ix+$01),$09
3139: 21 C5 E1    ld   hl,$E1C5
313C: CB FE       set  7,(hl)
313E: 21 17 0B    ld   hl,$0B17
3141: CD D4 03    call $03D4
3144: 11 CF 81    ld   de,$81CF
3147: 01 02 01    ld   bc,$0102
314A: CD 6C 04    call $046C
314D: C9          ret
314E: 21 00 E0    ld   hl,$E000
3151: CB 9E       res  3,(hl)
3153: DD CB 00 D6 set  2,(ix+$00)
3157: C9          ret
3158: FD 7E 08    ld   a,(iy+$08)
315B: FE 16       cp   $16
315D: 38 02       jr   c,$3161
315F: 3E 15       ld   a,$15
3161: 5F          ld   e,a
3162: 16 00       ld   d,$00
3164: 21 6A 31    ld   hl,$316A
3167: 19          add  hl,de
3168: 7E          ld   a,(hl)
3169: C9          ret

3180: DD 7E 00    ld   a,(ix+$00)
3183: E6 03       and  $03
3185: FE 02       cp   $02
3187: D0          ret  nc
3188: FE 01       cp   $01
318A: 30 0D       jr   nc,$3199
318C: FD 7E 0A    ld   a,(iy+$0a)
318F: 3D          dec  a
3190: C0          ret  nz
3191: DD 34 00    inc  (ix+$00)
3194: DD 36 05 FF ld   (ix+$05),$FF
3198: C9          ret
3199: DD 35 05    dec  (ix+$05)
319C: C0          ret  nz
319D: DD 34 00    inc  (ix+$00)
31A0: C9          ret
31A1: C9          ret

3231: DD CB 00 76 bit  6,(ix+$00)
3235: 20 2C       jr   nz,$3263
3237: DD 36 00 C3 ld   (ix+$00),$C3
323B: DD 36 01 78 ld   (ix+$01),$78
323F: DD 36 02 00 ld   (ix+$02),$00
3243: DD 36 03 80 ld   (ix+$03),$80
3247: DD 36 04 00 ld   (ix+$04),$00
324B: DD 36 05 10 ld   (ix+$05),$10
324F: DD 36 06 00 ld   (ix+$06),$00
3253: DD 36 07 00 ld   (ix+$07),$00
3257: DD 36 08 00 ld   (ix+$08),$00
325B: DD 36 13 00 ld   (ix+$13),$00
325F: DD 36 14 00 ld   (ix+$14),$00
3263: DD 7E 00    ld   a,(ix+$00)
3266: 1F          rra
3267: 1F          rra
3268: 1F          rra
3269: DA A1 36    jp   c,$36A1
326C: 1F          rra
326D: DA 7A 36    jp   c,$367A
3270: 1F          rra
3271: DA 59 36    jp   c,$3659
3274: 47          ld   b,a
3275: 3A 00 E0    ld   a,($E000)
3278: E6 40       and  $40
327A: 20 08       jr   nz,$3284
327C: CD 69 1D    call $1D69
327F: DD 36 00 00 ld   (ix+$00),$00
3283: C9          ret
3284: 78          ld   a,b
3285: 21 0E 33    ld   hl,return_330e		; [push_function]
3288: E5          push hl
3289: 1F          rra
328A: DA 4D 36    jp   c,$364D
328D: 3A B6 E1    ld   a,($E1B6)
3290: A7          and  a
3291: C0          ret  nz
3292: 3A C5 E1    ld   a,($E1C5)
3295: E6 98       and  $98
3297: FE 80       cp   $80
3299: C0          ret  nz
329A: FD E5       push iy
329C: FD 21 C5 E1 ld   iy,$E1C5
32A0: 01 07 07    ld   bc,$0707
32A3: CD D7 05    call $05D7
32A6: 30 0F       jr   nc,$32B7
32A8: FD CB 00 DE set  3,(iy+$00)
32AC: DD CB 00 EE set  5,(ix+$00)
32B0: DD 36 06 1E ld   (ix+$06),$1E
32B4: FD E1       pop  iy
32B6: C9          ret
32B7: FD E1       pop  iy
32B9: 3A 00 E0    ld   a,($E000)
32BC: E6 08       and  $08
32BE: C2 D6 41    jp   nz,$41D6
32C1: 3A 01 E0    ld   a,($E001)
32C4: E6 60       and  $60
32C6: C2 D6 41    jp   nz,$41D6
32C9: CD 1F 43    call $431F
32CC: DD 7E 05    ld   a,(ix+$05)
32CF: E6 F0       and  $F0
32D1: FE 60       cp   $60
32D3: 28 17       jr   z,$32EC
32D5: 3A 12 E2    ld   a,($E212)
32D8: E6 02       and  $02
32DA: 28 10       jr   z,$32EC
32DC: DD 36 05 60 ld   (ix+$05),$60
32E0: DD CB 07 BE res  7,(ix+$07)
32E4: DD 36 0D FF ld   (ix+$0d),$FF
32E8: DD 36 0E FF ld   (ix+$0e),$FF
32EC: DD 7E 05    ld   a,(ix+$05)
32EF: E6 F0       and  $F0
32F1: 0F          rrca
32F2: 0F          rrca
32F3: 0F          rrca
32F4: 5F          ld   e,a
32F5: 16 00       ld   d,$00
32F7: 21 00 33    ld   hl,jump_table_3300
32FA: 19          add  hl,de
32FB: 5E          ld   e,(hl)
32FC: 23          inc  hl
32FD: 56          ld   d,(hl)
32FE: EB          ex   de,hl
32FF: E9          jp   (hl)		; [indirect_jump]

jump_table_3300:
	.word	$35D2 
	.word	$339E 
	.word	$35DF 
	.word	$3581
	.word	$33A5 
	.word	$3412 
	.word	$34BE 

return_330e:
330E: DD 7E 13    ld   a,(ix+$13)
3311: FE 24       cp   $24
3313: 30 03       jr   nc,$3318
3315: A7          and  a
3316: 20 4A       jr   nz,$3362
3318: AF          xor  a
3319: DD 46 07    ld   b,(ix+$07)
331C: CB 68       bit  5,b
331E: 20 08       jr   nz,$3328
3320: CB 60       bit  4,b
3322: 28 06       jr   z,$332A
3324: C6 06       add  a,$06
3326: 18 02       jr   $332A
3328: C6 0C       add  a,$0C
332A: 47          ld   b,a
332B: DD 34 08    inc  (ix+$08)
332E: DD 7E 08    ld   a,(ix+$08)
3331: E6 18       and  $18
3333: 0F          rrca
3334: 0F          rrca
3335: FE 06       cp   $06
3337: 38 02       jr   c,$333B
3339: 3E 02       ld   a,$02
333B: 80          add  a,b
333C: 5F          ld   e,a
333D: 16 00       ld   d,$00
333F: 21 8C 33    ld   hl,$338C
3342: 19          add  hl,de
3343: 46          ld   b,(hl)
3344: 23          inc  hl
3345: 4E          ld   c,(hl)
3346: DD 7E 00    ld   a,(ix+$00)
3349: CB 4F       bit  1,a
334B: 28 0B       jr   z,$3358
334D: 04          inc  b
334E: 04          inc  b
334F: 04          inc  b
3350: E6 01       and  $01
3352: 28 0A       jr   z,$335E
3354: CB E1       set  4,c
3356: 18 06       jr   $335E
3358: E6 01       and  $01
335A: 28 02       jr   z,$335E
335C: CB E9       set  5,c
335E: CD 97 02    call $0297
3361: C9          ret
3362: 06 7A       ld   b,$7A
3364: 0E 08       ld   c,$08
3366: FE 18       cp   $18
3368: 30 06       jr   nc,$3370
336A: 04          inc  b
336B: FE 0C       cp   $0C
336D: 30 01       jr   nc,$3370
336F: 04          inc  b
3370: DD 7E 00    ld   a,(ix+$00)
3373: CB 4F       bit  1,a
3375: 20 08       jr   nz,$337F
3377: E6 01       and  $01
3379: 28 0D       jr   z,$3388
337B: CB E9       set  5,c
337D: 18 09       jr   $3388
337F: 04          inc  b
3380: 04          inc  b
3381: 04          inc  b
3382: E6 01       and  $01
3384: 28 02       jr   z,$3388
3386: CB E1       set  4,c
3388: CD 97 02    call $0297
338B: C9          ret

339E: CD 5B 3B    call $3B5B
33A1: A7          and  a
33A2: 28 FA       jr   z,$339E
33A4: C9          ret
33A5: CD B0 3D    call $3DB0
33A8: 28 40       jr   z,$33EA
33AA: CD C1 3D    call $3DC1
33AD: 20 1D       jr   nz,$33CC
33AF: DD CB 07 7E bit  7,(ix+$07)
33B3: 20 1B       jr   nz,$33D0
33B5: CD 6C 42    call $426C
33B8: A7          and  a
33B9: C2 35 36    jp   nz,$3635
33BC: CD D6 3D    call $3DD6
33BF: FE 04       cp   $04
33C1: 30 2F       jr   nc,$33F2
33C3: DD 36 14 00 ld   (ix+$14),$00
33C7: CD D7 3E    call $3ED7
33CA: 18 04       jr   $33D0
33CC: DD CB 07 BE res  7,(ix+$07)
33D0: CD AA 40    call $40AA
33D3: 38 04       jr   c,$33D9
33D5: CD 02 3A    call $3A02
33D8: C9          ret
33D9: DD 7E 00    ld   a,(ix+$00)
33DC: EE 01       xor  $01
33DE: DD 77 00    ld   (ix+$00),a
33E1: DD 36 05 00 ld   (ix+$05),$00
33E5: DD 36 07 00 ld   (ix+$07),$00
33E9: C9          ret
33EA: CD 5B 3B    call $3B5B
33ED: DD 36 07 00 ld   (ix+$07),$00
33F1: C9          ret
33F2: DD 7E 14    ld   a,(ix+$14)
33F5: A7          and  a
33F6: 20 05       jr   nz,$33FD
33F8: DD 36 14 1E ld   (ix+$14),$1E
33FC: C9          ret
33FD: DD 35 14    dec  (ix+$14)
3400: C0          ret  nz
3401: DD 36 05 60 ld   (ix+$05),$60
3405: DD 36 0D 00 ld   (ix+$0d),$00
3409: DD 36 0E 3C ld   (ix+$0e),$3C
340D: DD 36 07 00 ld   (ix+$07),$00
3411: C9          ret
3412: DD 7E 05    ld   a,(ix+$05)
3415: E6 0F       and  $0F
3417: 20 03       jr   nz,$341C
3419: DD 34 05    inc  (ix+$05)
341C: DD 7E 13    ld   a,(ix+$13)
341F: A7          and  a
3420: 20 12       jr   nz,$3434
3422: CD B0 3D    call $3DB0
3425: 20 0D       jr   nz,$3434
3427: CD C1 3D    call $3DC1
342A: 20 08       jr   nz,$3434
342C: DD 36 07 00 ld   (ix+$07),$00
3430: CD 5B 3B    call $3B5B
3433: C9          ret
3434: DD 7E 05    ld   a,(ix+$05)
3437: E6 0F       and  $0F
3439: FE 02       cp   $02
343B: 30 64       jr   nc,$34A1
343D: CD C1 3D    call $3DC1
3440: 20 1D       jr   nz,$345F
3442: DD CB 07 7E bit  7,(ix+$07)
3446: 20 1B       jr   nz,$3463
3448: CD 6C 42    call $426C
344B: A7          and  a
344C: C2 35 36    jp   nz,$3635
344F: CD D6 3D    call $3DD6
3452: FE 04       cp   $04
3454: 30 9C       jr   nc,$33F2
3456: DD 36 14 00 ld   (ix+$14),$00
345A: CD D7 3E    call $3ED7
345D: 18 04       jr   $3463
345F: DD CB 07 BE res  7,(ix+$07)
3463: CD AA 40    call $40AA
3466: 38 04       jr   c,$346C
3468: CD 02 3A    call $3A02
346B: C9          ret
346C: DD 34 05    inc  (ix+$05)
346F: DD 7E 01    ld   a,(ix+$01)
3472: E6 F0       and  $F0
3474: 47          ld   b,a
3475: DD 7E 03    ld   a,(ix+$03)
3478: E6 F0       and  $F0
347A: 0F          rrca
347B: 0F          rrca
347C: 0F          rrca
347D: 0F          rrca
347E: B0          or   b
347F: DD 77 0F    ld   (ix+$0f),a
3482: DD 7E 00    ld   a,(ix+$00)
3485: CD 32 40    call $4032
3488: DD 77 12    ld   (ix+$12),a
348B: DD 7E 00    ld   a,(ix+$00)
348E: EE 01       xor  $01
3490: DD 77 00    ld   (ix+$00),a
3493: CD 32 40    call $4032
3496: DD 77 10    ld   (ix+$10),a
3499: DD 77 11    ld   (ix+$11),a
349C: DD 36 07 00 ld   (ix+$07),$00
34A0: C9          ret
34A1: CD BA 36    call $36BA
34A4: DD CB 07 66 bit  4,(ix+$07)
34A8: C0          ret  nz
34A9: DD 7E 05    ld   a,(ix+$05)
34AC: E6 0F       and  $0F
34AE: FE 03       cp   $03
34B0: C0          ret  nz
34B1: DD 35 05    dec  (ix+$05)
34B4: DD 7E 12    ld   a,(ix+$12)
34B7: A7          and  a
34B8: C0          ret  nz
34B9: DD 36 05 51 ld   (ix+$05),$51
34BD: C9          ret
34BE: DD 7E 05    ld   a,(ix+$05)
34C1: E6 0F       and  $0F
34C3: 20 14       jr   nz,$34D9
34C5: DD 34 05    inc  (ix+$05)
34C8: DD 36 13 00 ld   (ix+$13),$00
34CC: DD 36 14 00 ld   (ix+$14),$00
34D0: DD CB 07 66 bit  4,(ix+$07)
34D4: 28 03       jr   z,$34D9
34D6: DD 34 05    inc  (ix+$05)
34D9: DD 7E 13    ld   a,(ix+$13)
34DC: A7          and  a
34DD: 20 2F       jr   nz,$350E
34DF: CD B0 3D    call $3DB0
34E2: 20 0D       jr   nz,$34F1
34E4: CD C1 3D    call $3DC1
34E7: 20 25       jr   nz,$350E
34E9: DD 36 07 00 ld   (ix+$07),$00
34ED: CD 5B 3B    call $3B5B
34F0: C9          ret
34F1: DD 7E 14    ld   a,(ix+$14)
34F4: A7          and  a
34F5: 20 13       jr   nz,$350A
34F7: DD 7E 0E    ld   a,(ix+$0e)
34FA: E6 3F       and  $3F
34FC: 20 10       jr   nz,$350E
34FE: CD F4 02    call $02F4
3501: E6 03       and  $03
3503: 20 09       jr   nz,$350E
3505: DD 36 14 20 ld   (ix+$14),$20
3509: C9          ret
350A: DD 35 14    dec  (ix+$14)
350D: C9          ret
350E: DD 7E 05    ld   a,(ix+$05)
3511: E6 0F       and  $0F
3513: FE 02       cp   $02
3515: 30 4D       jr   nc,$3564
3517: CD C1 3D    call $3DC1
351A: 20 24       jr   nz,$3540
351C: DD CB 07 7E bit  7,(ix+$07)
3520: 20 22       jr   nz,$3544
3522: CD 6C 42    call $426C
3525: A7          and  a
3526: C2 35 36    jp   nz,$3635
3529: CD A2 37    call $37A2
352C: DD 7E 05    ld   a,(ix+$05)
352F: E6 0F       and  $0F
3531: FE 02       cp   $02
3533: D0          ret  nc
3534: CD D6 3D    call $3DD6
3537: FE 04       cp   $04
3539: 30 16       jr   nc,$3551
353B: CD D7 3E    call $3ED7
353E: 18 04       jr   $3544
3540: DD CB 07 BE res  7,(ix+$07)
3544: CD AA 40    call $40AA
3547: 38 04       jr   c,$354D
3549: CD 02 3A    call $3A02
354C: C9          ret
354D: CD 6C 34    call $346C
3550: C9          ret
3551: DD 34 05    inc  (ix+$05)
3554: DD 36 0F 00 ld   (ix+$0f),$00
3558: DD 7E 00    ld   a,(ix+$00)
355B: EE 01       xor  $01
355D: CD 32 40    call $4032
3560: DD 77 10    ld   (ix+$10),a
3563: C9          ret
3564: CD BA 36    call $36BA
3567: DD CB 07 66 bit  4,(ix+$07)
356B: C0          ret  nz
356C: DD 7E 05    ld   a,(ix+$05)
356F: E6 0F       and  $0F
3571: FE 03       cp   $03
3573: C0          ret  nz
3574: DD 35 05    dec  (ix+$05)
3577: DD 7E 12    ld   a,(ix+$12)
357A: A7          and  a
357B: C0          ret  nz
357C: DD 36 05 60 ld   (ix+$05),$60
3580: C9          ret
3581: CD B0 3D    call $3DB0
3584: 28 44       jr   z,$35CA
3586: CD C1 3D    call $3DC1
3589: 20 19       jr   nz,$35A4
358B: DD CB 07 7E bit  7,(ix+$07)
358F: 20 17       jr   nz,$35A8
3591: CD 6C 42    call $426C
3594: A7          and  a
3595: C2 35 36    jp   nz,$3635
3598: CD 1A 3E    call $3E1A
359B: FE 04       cp   $04
359D: 30 12       jr   nc,$35B1
359F: CD D7 3E    call $3ED7
35A2: 18 04       jr   $35A8
35A4: DD CB 07 BE res  7,(ix+$07)
35A8: CD AA 40    call $40AA
35AB: 38 15       jr   c,$35C2
35AD: CD 02 3A    call $3A02
35B0: C9          ret
35B1: DD 36 05 00 ld   (ix+$05),$00
35B5: DD 36 0D 00 ld   (ix+$0d),$00
35B9: DD 36 0E B4 ld   (ix+$0e),$B4
35BD: DD 36 07 00 ld   (ix+$07),$00
35C1: C9          ret
35C2: DD 7E 00    ld   a,(ix+$00)
35C5: EE 01       xor  $01
35C7: DD 77 00    ld   (ix+$00),a
35CA: CD 5B 3B    call $3B5B
35CD: DD 36 07 00 ld   (ix+$07),$00
35D1: C9          ret

35D2: CD B0 3D    call $3DB0
35D5: 28 04       jr   z,$35DB
35D7: CD D6 41    call $41D6
35DA: C9          ret
35DB: CD 5B 3B    call $3B5B
35DE: C9          ret
35DF: CD B0 3D    call $3DB0
35E2: 28 49       jr   z,$362D
35E4: CD C1 3D    call $3DC1
35E7: 20 2C       jr   nz,$3615
35E9: DD CB 07 7E bit  7,(ix+$07)
35ED: 20 2A       jr   nz,$3619
35EF: CD 6C 42    call $426C
35F2: A7          and  a
35F3: 20 40       jr   nz,$3635
35F5: CD 7C 3E    call $3E7C
35F8: FE 04       cp   $04
35FA: 30 31       jr   nc,$362D
35FC: DD 4E 00    ld   c,(ix+$00)
35FF: CD D7 3E    call $3ED7
3602: A9          xor  c
3603: E6 03       and  $03
3605: FE 01       cp   $01
3607: 20 10       jr   nz,$3619
3609: DD 7E 05    ld   a,(ix+$05)
360C: DD 34 05    inc  (ix+$05)
360F: E6 0F       and  $0F
3611: 20 1A       jr   nz,$362D
3613: 18 1B       jr   $3630
3615: DD CB 07 BE res  7,(ix+$07)
3619: CD 41 40    call $4041
361C: CD 76 40    call $4076
361F: 38 04       jr   c,$3625
3621: CD 02 3A    call $3A02
3624: C9          ret
3625: DD 7E 00    ld   a,(ix+$00)
3628: EE 01       xor  $01
362A: DD 77 00    ld   (ix+$00),a
362D: CD 5B 3B    call $3B5B
3630: DD 36 07 00 ld   (ix+$07),$00
3634: C9          ret
3635: CD FF 42    call $42FF
3638: C8          ret  z
3639: CD D7 3E    call $3ED7
363C: CD 41 40    call $4041
363F: CD 76 40    call $4076
3642: 38 04       jr   c,$3648
3644: CD 02 3A    call $3A02
3647: C9          ret
3648: DD CB 07 BE res  7,(ix+$07)
364C: C9          ret
364D: DD 35 06    dec  (ix+$06)
3650: C0          ret  nz
3651: CD 69 1D    call $1D69
3654: DD 36 00 00 ld   (ix+$00),$00
3658: C9          ret
3659: DD CB 07 4E bit  1,(ix+$07)
365D: 20 0E       jr   nz,$366D
365F: DD CB 07 CE set  1,(ix+$07)
3663: CD 69 1D    call $1D69
3666: CD A6 36    call $36A6
3669: DD 36 06 00 ld   (ix+$06),$00
366D: DD 35 06    dec  (ix+$06)
3670: 28 2F       jr   z,$36A1
3672: 06 3C       ld   b,$3C
3674: 0E 02       ld   c,$02
3676: CD 97 02    call $0297
3679: C9          ret
367A: DD CB 07 46 bit  0,(ix+$07)
367E: 20 14       jr   nz,$3694
3680: DD CB 07 C6 set  0,(ix+$07)
3684: DD 36 06 1F ld   (ix+$06),$1F
3688: CD 69 1D    call $1D69
368B: CD A6 36    call $36A6
368E: 11 5A 3B    ld   de,$3B5A
3691: CD 2A 03    call $032A
3694: DD 35 06    dec  (ix+$06)
3697: 28 08       jr   z,$36A1
3699: 06 71       ld   b,$71
369B: 0E 0A       ld   c,$0A
369D: CD 97 02    call $0297
36A0: C9          ret
36A1: DD 36 00 00 ld   (ix+$00),$00
36A5: C9          ret
36A6: FD 35 0A    dec  (iy+$0a)
36A9: C0          ret  nz
36AA: 21 B6 E1    ld   hl,$E1B6
36AD: CB FE       set  7,(hl)
36AF: FD 36 30 01 ld   (iy+$30),$01
36B3: FD 7E 08    ld   a,(iy+$08)
36B6: FD 77 09    ld   (iy+$09),a
36B9: C9          ret
36BA: CD C1 3D    call $3DC1
36BD: 20 31       jr   nz,$36F0
36BF: DD CB 07 7E bit  7,(ix+$07)
36C3: 20 2F       jr   nz,$36F4
36C5: DD 7E 01    ld   a,(ix+$01)
36C8: E6 F0       and  $F0
36CA: 47          ld   b,a
36CB: DD 7E 03    ld   a,(ix+$03)
36CE: 3C          inc  a
36CF: E6 F0       and  $F0
36D1: 0F          rrca
36D2: 0F          rrca
36D3: 0F          rrca
36D4: 0F          rrca
36D5: B0          or   b
36D6: DD BE 0F    cp   (ix+$0f)
36D9: 28 06       jr   z,$36E1
36DB: DD 77 0F    ld   (ix+$0f),a
36DE: CD 3C 37    call $373C
36E1: CD 51 3F    call $3F51
36E4: FE 04       cp   $04
36E6: D0          ret  nc
36E7: CD D7 3E    call $3ED7
36EA: DD CB 07 B6 res  6,(ix+$07)
36EE: 18 04       jr   $36F4
36F0: DD CB 07 BE res  7,(ix+$07)
36F4: CD AA 40    call $40AA
36F7: 38 27       jr   c,$3720
36F9: CD 80 38    call $3880
36FC: DD CB 07 F6 set  6,(ix+$07)
3700: DD CB 07 66 bit  4,(ix+$07)
3704: 28 0C       jr   z,$3712
3706: DD 7E 05    ld   a,(ix+$05)
3709: E6 0F       and  $0F
370B: FE 03       cp   $03
370D: 30 03       jr   nc,$3712
370F: DD 34 05    inc  (ix+$05)
3712: DD 7E 13    ld   a,(ix+$13)
3715: A7          and  a
3716: 28 04       jr   z,$371C
3718: DD 35 13    dec  (ix+$13)
371B: C0          ret  nz
371C: CD 02 3A    call $3A02
371F: C9          ret
3720: DD 7E 00    ld   a,(ix+$00)
3723: CD 32 40    call $4032
3726: DD B6 12    or   (ix+$12)
3729: DD 77 12    ld   (ix+$12),a
372C: CD 69 1D    call $1D69
372F: DD 7E 00    ld   a,(ix+$00)
3732: EE 01       xor  $01
3734: DD 77 00    ld   (ix+$00),a
3737: DD 36 13 00 ld   (ix+$13),$00
373B: C9          ret
373C: DD 7E 00    ld   a,(ix+$00)
373F: EE 01       xor  $01
3741: CD 32 40    call $4032
3744: DD 77 11    ld   (ix+$11),a
3747: DD 36 12 00 ld   (ix+$12),$00
374B: DD 7E 10    ld   a,(ix+$10)
374E: CB 5F       bit  3,a
3750: 20 36       jr   nz,$3788
3752: CB 4F       bit  1,a
3754: 20 22       jr   nz,$3778
3756: CB 57       bit  2,a
3758: 20 0F       jr   nz,$3769
375A: DD 7E 01    ld   a,(ix+$01)
375D: E6 F0       and  $F0
375F: 47          ld   b,a
3760: 3A C6 E1    ld   a,($E1C6)
3763: E6 F0       and  $F0
3765: B8          cp   b
3766: 38 2E       jr   c,$3796
3768: C9          ret
3769: 3A C6 E1    ld   a,($E1C6)
376C: E6 F0       and  $F0
376E: 47          ld   b,a
376F: DD 7E 01    ld   a,(ix+$01)
3772: E6 F0       and  $F0
3774: B8          cp   b
3775: 38 1F       jr   c,$3796
3777: C9          ret
3778: DD 7E 03    ld   a,(ix+$03)
377B: 3C          inc  a
377C: E6 F0       and  $F0
377E: 47          ld   b,a
377F: 3A C8 E1    ld   a,($E1C8)
3782: E6 F0       and  $F0
3784: B8          cp   b
3785: 38 0F       jr   c,$3796
3787: C9          ret
3788: 3A C8 E1    ld   a,($E1C8)
378B: E6 F0       and  $F0
378D: 47          ld   b,a
378E: DD 7E 03    ld   a,(ix+$03)
3791: 3C          inc  a
3792: E6 F0       and  $F0
3794: B8          cp   b
3795: D0          ret  nc
3796: DD 7E 00    ld   a,(ix+$00)
3799: EE 01       xor  $01
379B: CD 32 40    call $4032
379E: DD 77 10    ld   (ix+$10),a
37A1: C9          ret
37A2: DD 7E 01    ld   a,(ix+$01)
37A5: E6 F0       and  $F0
37A7: 0F          rrca
37A8: 57          ld   d,a
37A9: DD 7E 03    ld   a,(ix+$03)
37AC: 3C          inc  a
37AD: E6 F0       and  $F0
37AF: 0F          rrca
37B0: 5F          ld   e,a
37B1: 3A C6 E1    ld   a,($E1C6)
37B4: E6 F0       and  $F0
37B6: 0F          rrca
37B7: 92          sub  d
37B8: 30 02       jr   nc,$37BC
37BA: ED 44       neg
37BC: 57          ld   d,a
37BD: 3A C8 E1    ld   a,($E1C8)
37C0: E6 F0       and  $F0
37C2: 0F          rrca
37C3: 93          sub  e
37C4: 30 02       jr   nc,$37C8
37C6: ED 44       neg
37C8: BA          cp   d
37C9: 38 0D       jr   c,$37D8
37CB: 28 0B       jr   z,$37D8
37CD: CD 04 38    call $3804
37D0: CD 23 38    call $3823
37D3: CD 3A 38    call $383A
37D6: 18 09       jr   $37E1
37D8: CD 04 38    call $3804
37DB: CD 3A 38    call $383A
37DE: CD 23 38    call $3823
37E1: CD A3 1D    call $1DA3
37E4: 23          inc  hl
37E5: D9          exx
37E6: 7C          ld   a,h
37E7: D9          exx
37E8: BE          cp   (hl)
37E9: 38 05       jr   c,$37F0
37EB: DD 36 05 61 ld   (ix+$05),$61
37EF: C9          ret
37F0: DD 36 05 62 ld   (ix+$05),$62
37F4: AF          xor  a
37F5: DD 77 0F    ld   (ix+$0f),a
37F8: DD 7E 00    ld   a,(ix+$00)
37FB: EE 01       xor  $01
37FD: CD 32 40    call $4032
3800: DD 77 10    ld   (ix+$10),a
3803: C9          ret
3804: D9          exx
3805: 21 00 00    ld   hl,$0000
3808: D9          exx
3809: DD 7E 01    ld   a,(ix+$01)
380C: E6 F0       and  $F0
380E: 57          ld   d,a
380F: DD 7E 03    ld   a,(ix+$03)
3812: 3C          inc  a
3813: E6 F0       and  $F0
3815: 5F          ld   e,a
3816: 3A C6 E1    ld   a,($E1C6)
3819: E6 F0       and  $F0
381B: 47          ld   b,a
381C: 3A C8 E1    ld   a,($E1C8)
381F: E6 F0       and  $F0
3821: 4F          ld   c,a
3822: C9          ret
3823: 78          ld   a,b
3824: BA          cp   d
3825: C8          ret  z
3826: 38 09       jr   c,$3831
3828: CD 51 38    call $3851
382B: 7A          ld   a,d
382C: C6 10       add  a,$10
382E: 57          ld   d,a
382F: 18 F2       jr   $3823
3831: CD 51 38    call $3851
3834: 7A          ld   a,d
3835: D6 10       sub  $10
3837: 57          ld   d,a
3838: 18 E9       jr   $3823
383A: 79          ld   a,c
383B: BB          cp   e
383C: C8          ret  z
383D: 38 09       jr   c,$3848
383F: CD 51 38    call $3851
3842: 7B          ld   a,e
3843: C6 10       add  a,$10
3845: 5F          ld   e,a
3846: 18 F2       jr   $383A
3848: CD 51 38    call $3851
384B: 7B          ld   a,e
384C: D6 10       sub  $10
384E: 5F          ld   e,a
384F: 18 E9       jr   $383A
3851: D5          push de
3852: CD C0 1D    call $1DC0
3855: D1          pop  de
3856: 7E          ld   a,(hl)
3857: E6 0F       and  $0F
3859: 28 04       jr   z,$385F
385B: D9          exx
385C: 24          inc  h
385D: D9          exx
385E: C9          ret
385F: D9          exx
3860: EB          ex   de,hl
3861: CD 76 1A    call $1A76
3864: EB          ex   de,hl
3865: 11 7F 38    ld   de,$387F
3868: FE 0F       cp   $0F
386A: 30 0B       jr   nc,$3877
386C: 1B          dec  de
386D: FE 0A       cp   $0A
386F: 30 06       jr   nc,$3877
3871: 1B          dec  de
3872: FE 05       cp   $05
3874: 30 01       jr   nc,$3877
3876: 1B          dec  de
3877: 1A          ld   a,(de)
3878: 84          add  a,h
3879: 67          ld   h,a
387A: D9          exx
387B: C9          ret
387C: 05          dec  b
387D: 04          inc  b
387E: 03          inc  bc
387F: 02          ld   (bc),a
3880: DD 7E 00    ld   a,(ix+$00)
3883: E6 03       and  $03
3885: CA 7A 39    jp   z,$397A
3888: FE 01       cp   $01
388A: CA 2A 39    jp   z,$392A
388D: FE 02       cp   $02
388F: 28 49       jr   z,$38DA
3891: DD CB 07 76 bit  6,(ix+$07)
3895: 20 20       jr   nz,$38B7
3897: DD 7E 03    ld   a,(ix+$03)
389A: E6 0F       and  $0F
389C: 28 04       jr   z,$38A2
389E: FE 0F       cp   $0F
38A0: 20 15       jr   nz,$38B7
38A2: CD A3 1D    call $1DA3
38A5: CB 4E       bit  1,(hl)
38A7: 28 08       jr   z,$38B1
38A9: CD 1B 28    call $281B
38AC: DD 36 13 00 ld   (ix+$13),$00
38B0: C9          ret
38B1: CD D2 39    call $39D2
38B4: CD 29 28    call $2829
38B7: DD 7E 03    ld   a,(ix+$03)
38BA: E6 03       and  $03
38BC: FE 02       cp   $02
38BE: DA CD 39    jp   c,$39CD
38C1: DD 7E 07    ld   a,(ix+$07)
38C4: E6 14       and  $14
38C6: FE 10       cp   $10
38C8: C0          ret  nz
38C9: CD D0 1A    call $1AD0
38CC: CD E1 39    call $39E1
38CF: DD 7E 03    ld   a,(ix+$03)
38D2: E6 0F       and  $0F
38D4: FE 04       cp   $04
38D6: DC 1F 1E    call c,$1E1F
38D9: C9          ret
38DA: CD 78 1F    call $1F78
38DD: DD CB 07 76 bit  6,(ix+$07)
38E1: 20 21       jr   nz,$3904
38E3: DD 7E 03    ld   a,(ix+$03)
38E6: E6 0F       and  $0F
38E8: 28 04       jr   z,$38EE
38EA: FE 0F       cp   $0F
38EC: 20 16       jr   nz,$3904
38EE: CD A3 1D    call $1DA3
38F1: CB 5E       bit  3,(hl)
38F3: 28 08       jr   z,$38FD
38F5: CD 1B 28    call $281B
38F8: DD 36 13 00 ld   (ix+$13),$00
38FC: C9          ret
38FD: CD D2 39    call $39D2
3900: CD 29 28    call $2829
3903: C9          ret
3904: DD 7E 03    ld   a,(ix+$03)
3907: E6 03       and  $03
3909: CA CD 39    jp   z,$39CD
390C: FE 03       cp   $03
390E: CA CD 39    jp   z,$39CD
3911: DD 7E 07    ld   a,(ix+$07)
3914: E6 14       and  $14
3916: FE 10       cp   $10
3918: C0          ret  nz
3919: CD 9B 1A    call $1A9B
391C: CD E1 39    call $39E1
391F: DD 7E 03    ld   a,(ix+$03)
3922: E6 0F       and  $0F
3924: FE 0D       cp   $0D
3926: D4 C9 1D    call nc,$1DC9
3929: C9          ret
392A: CD 78 1F    call $1F78
392D: DD CB 07 76 bit  6,(ix+$07)
3931: 20 22       jr   nz,$3955
3933: DD 7E 01    ld   a,(ix+$01)
3936: E6 0F       and  $0F
3938: FE 07       cp   $07
393A: 28 04       jr   z,$3940
393C: FE 08       cp   $08
393E: 20 15       jr   nz,$3955
3940: CD A3 1D    call $1DA3
3943: CB 46       bit  0,(hl)
3945: 28 08       jr   z,$394F
3947: CD 1B 28    call $281B
394A: DD 36 13 00 ld   (ix+$13),$00
394E: C9          ret
394F: CD D2 39    call $39D2
3952: CD 29 28    call $2829
3955: DD 7E 01    ld   a,(ix+$01)
3958: E6 03       and  $03
395A: FE 02       cp   $02
395C: 38 6F       jr   c,$39CD
395E: DD 7E 07    ld   a,(ix+$07)
3961: E6 14       and  $14
3963: FE 10       cp   $10
3965: C0          ret  nz
3966: CD 3B 1B    call $1B3B
3969: CD E1 39    call $39E1
396C: DD 7E 01    ld   a,(ix+$01)
396F: E6 0F       and  $0F
3971: FE 0A       cp   $0A
3973: D8          ret  c
3974: FE 0D       cp   $0D
3976: DC C5 1E    call c,$1EC5
3979: C9          ret
397A: CD 78 1F    call $1F78
397D: DD CB 07 76 bit  6,(ix+$07)
3981: 20 23       jr   nz,$39A6
3983: DD 7E 01    ld   a,(ix+$01)
3986: E6 0F       and  $0F
3988: FE 07       cp   $07
398A: 28 04       jr   z,$3990
398C: FE 08       cp   $08
398E: 20 16       jr   nz,$39A6
3990: CD A3 1D    call $1DA3
3993: CB 56       bit  2,(hl)
3995: 28 08       jr   z,$399F
3997: CD 1B 28    call $281B
399A: DD 36 13 00 ld   (ix+$13),$00
399E: C9          ret
399F: CD D2 39    call $39D2
39A2: CD 29 28    call $2829
39A5: C9          ret
39A6: DD 7E 01    ld   a,(ix+$01)
39A9: E6 03       and  $03
39AB: 28 20       jr   z,$39CD
39AD: FE 03       cp   $03
39AF: 28 1C       jr   z,$39CD
39B1: DD 7E 07    ld   a,(ix+$07)
39B4: E6 14       and  $14
39B6: FE 10       cp   $10
39B8: C0          ret  nz
39B9: CD 05 1B    call $1B05
39BC: CD E1 39    call $39E1
39BF: DD 7E 01    ld   a,(ix+$01)
39C2: E6 0F       and  $0F
39C4: FE 07       cp   $07
39C6: D0          ret  nc
39C7: FE 05       cp   $05
39C9: D4 75 1E    call nc,$1E75
39CC: C9          ret
39CD: DD CB 07 96 res  2,(ix+$07)
39D1: C9          ret
39D2: DD CB 07 66 bit  4,(ix+$07)
39D6: C0          ret  nz
39D7: DD 7E 13    ld   a,(ix+$13)
39DA: A7          and  a
39DB: C0          ret  nz
39DC: DD 36 13 30 ld   (ix+$13),$30
39E0: C9          ret
39E1: DD E5       push ix
39E3: E1          pop  hl
39E4: 11 09 00    ld   de,$0009
39E7: 19          add  hl,de
39E8: 3E DB       ld   a,$DB
39EA: 06 04       ld   b,$04
39EC: BE          cp   (hl)
39ED: 30 05       jr   nc,$39F4
39EF: FD 35 0B    dec  (iy+$0b)
39F2: 28 04       jr   z,$39F8
39F4: 23          inc  hl
39F5: 10 F5       djnz $39EC
39F7: C9          ret
39F8: 21 B6 E1    ld   hl,$E1B6
39FB: CB FE       set  7,(hl)
39FD: FD 36 30 02 ld   (iy+$30),$02
3A01: C9          ret
3A02: DD 46 07    ld   b,(ix+$07)
3A05: CB 68       bit  5,b
3A07: 20 32       jr   nz,$3A3B
3A09: CD 76 1A    call $1A76
3A0C: FE 20       cp   $20
3A0E: 38 02       jr   c,$3A12
3A10: 3E 1F       ld   a,$1F
3A12: 5F          ld   e,a
3A13: 16 00       ld   d,$00
3A15: 21 88 3A    ld   hl,$3A88
3A18: 19          add  hl,de
3A19: 5E          ld   e,(hl)
3A1A: FD 7E 0E    ld   a,(iy+$0e)
3A1D: CB 60       bit  4,b
3A1F: 20 0B       jr   nz,$3A2C
3A21: 21 A8 3A    ld   hl,$3AA8
3A24: A7          and  a
3A25: 20 0E       jr   nz,$3A35
3A27: 21 D4 3A    ld   hl,$3AD4
3A2A: 18 09       jr   $3A35
3A2C: 21 00 3B    ld   hl,$3B00
3A2F: A7          and  a
3A30: 20 03       jr   nz,$3A35
3A32: 21 2C 3B    ld   hl,$3B2C
3A35: 19          add  hl,de
3A36: 4E          ld   c,(hl)
3A37: 23          inc  hl
3A38: 46          ld   b,(hl)
3A39: 18 03       jr   $3A3E
3A3B: 01 55 00    ld   bc,$0055
3A3E: DD 7E 00    ld   a,(ix+$00)
3A41: CB 4F       bit  1,a
3A43: 28 1C       jr   z,$3A61
3A45: DD 66 03    ld   h,(ix+$03)
3A48: DD 6E 04    ld   l,(ix+$04)
3A4B: 1F          rra
3A4C: DC E3 2C    call c,$2CE3
3A4F: 09          add  hl,bc
3A50: DD 74 03    ld   (ix+$03),h
3A53: DD 75 04    ld   (ix+$04),l
3A56: DD 7E 01    ld   a,(ix+$01)
3A59: E6 F0       and  $F0
3A5B: C6 08       add  a,$08
3A5D: DD 77 01    ld   (ix+$01),a
3A60: C9          ret
3A61: DD 66 01    ld   h,(ix+$01)
3A64: DD 6E 02    ld   l,(ix+$02)
3A67: 1F          rra
3A68: DC E3 2C    call c,$2CE3
3A6B: 09          add  hl,bc
3A6C: DD 74 01    ld   (ix+$01),h
3A6F: DD 75 02    ld   (ix+$02),l
3A72: DD 7E 03    ld   a,(ix+$03)
3A75: 3C          inc  a
3A76: E6 F0       and  $F0
3A78: DD 77 03    ld   (ix+$03),a
3A7B: DD CB 07 6E bit  5,(ix+$07)
3A7F: C8          ret  z
3A80: 50          ld   d,b
3A81: 59          ld   e,c
3A82: 06 90       ld   b,$90
3A84: CD 3F 1F    call $1F3F
3A87: C9          ret

3B5B: CD F4 02    call $02F4
3B5E: 47          ld   b,a
3B5F: FD 7E 09    ld   a,(iy+$09)
3B62: 21 00 E0    ld   hl,$E000
3B65: CB 7E       bit  7,(hl)
3B67: 28 0E       jr   z,$3B77
3B69: 21 02 A0    ld   hl,dsw_1_a002
3B6C: CB 4E       bit  1,(hl)
3B6E: 20 07       jr   nz,$3B77
3B70: FE 80       cp   $80
3B72: 30 03       jr   nc,$3B77
3B74: 87          add  a,a
3B75: C6 01       add  a,$01
3B77: FE 20       cp   $20
3B79: 38 02       jr   c,$3B7D
3B7B: 3E 1F       ld   a,$1F
3B7D: 87          add  a,a
3B7E: 87          add  a,a
3B7F: 87          add  a,a
3B80: 4F          ld   c,a
3B81: FD 7E 12    ld   a,(iy+$12)
3B84: E6 38       and  $38
3B86: 0F          rrca
3B87: 0F          rrca
3B88: 0F          rrca
3B89: 81          add  a,c
3B8A: 5F          ld   e,a
3B8B: 16 00       ld   d,$00
3B8D: 21 C0 3B    ld   hl,$3BC0
3B90: 19          add  hl,de
3B91: 78          ld   a,b
3B92: E6 07       and  $07
3B94: 86          add  a,(hl)
3B95: 5F          ld   e,a
3B96: 16 00       ld   d,$00
3B98: 21 B8 3C    ld   hl,$3CB8
3B9B: 19          add  hl,de
3B9C: 7E          ld   a,(hl)
3B9D: CB 58       bit  3,b
3B9F: 20 04       jr   nz,$3BA5
3BA1: 0F          rrca
3BA2: 0F          rrca
3BA3: 0F          rrca
3BA4: 0F          rrca
3BA5: E6 0F       and  $0F
3BA7: 47          ld   b,a
3BA8: 87          add  a,a
3BA9: 80          add  a,b
3BAA: 5F          ld   e,a
3BAB: 16 00       ld   d,$00
3BAD: 21 80 3D    ld   hl,$3D80
3BB0: 19          add  hl,de
3BB1: 7E          ld   a,(hl)
3BB2: 23          inc  hl
3BB3: 4E          ld   c,(hl)
3BB4: 23          inc  hl
3BB5: 46          ld   b,(hl)
3BB6: DD 77 05    ld   (ix+$05),a
3BB9: DD 70 0D    ld   (ix+$0d),b
3BBC: DD 71 0E    ld   (ix+$0e),c
3BBF: C9          ret

3DB0: DD 46 0D    ld   b,(ix+$0d)
3DB3: DD 4E 0E    ld   c,(ix+$0e)
3DB6: 78          ld   a,b
3DB7: B1          or   c
3DB8: C8          ret  z
3DB9: 0B          dec  bc
3DBA: DD 70 0D    ld   (ix+$0d),b
3DBD: DD 71 0E    ld   (ix+$0e),c
3DC0: C9          ret
3DC1: DD 7E 01    ld   a,(ix+$01)
3DC4: E6 0F       and  $0F
3DC6: FE 07       cp   $07
3DC8: 28 03       jr   z,$3DCD
3DCA: FE 08       cp   $08
3DCC: C0          ret  nz
3DCD: DD 7E 03    ld   a,(ix+$03)
3DD0: E6 0F       and  $0F
3DD2: C8          ret  z
3DD3: FE 0F       cp   $0F
3DD5: C9          ret
3DD6: CD A3 1D    call $1DA3
3DD9: 46          ld   b,(hl)
3DDA: 23          inc  hl
3DDB: 7E          ld   a,(hl)
3DDC: CB 50       bit  2,b
3DDE: 28 0B       jr   z,$3DEB
3DE0: EB          ex   de,hl
3DE1: 21 20 00    ld   hl,$0020
3DE4: 19          add  hl,de
3DE5: BE          cp   (hl)
3DE6: EB          ex   de,hl
3DE7: 38 02       jr   c,$3DEB
3DE9: AF          xor  a
3DEA: C9          ret
3DEB: CB 40       bit  0,b
3DED: 28 0C       jr   z,$3DFB
3DEF: EB          ex   de,hl
3DF0: 21 E0 FF    ld   hl,$FFE0
3DF3: 19          add  hl,de
3DF4: BE          cp   (hl)
3DF5: EB          ex   de,hl
3DF6: 38 03       jr   c,$3DFB
3DF8: 3E 01       ld   a,$01
3DFA: C9          ret
3DFB: CB 58       bit  3,b
3DFD: 28 0A       jr   z,$3E09
3DFF: 23          inc  hl
3E00: 23          inc  hl
3E01: BE          cp   (hl)
3E02: 2B          dec  hl
3E03: 2B          dec  hl
3E04: 38 03       jr   c,$3E09
3E06: 3E 02       ld   a,$02
3E08: C9          ret
3E09: CB 48       bit  1,b
3E0B: 28 0A       jr   z,$3E17
3E0D: 2B          dec  hl
3E0E: 2B          dec  hl
3E0F: BE          cp   (hl)
3E10: 23          inc  hl
3E11: 23          inc  hl
3E12: 38 03       jr   c,$3E17
3E14: 3E 03       ld   a,$03
3E16: C9          ret
3E17: 3E 04       ld   a,$04
3E19: C9          ret
3E1A: CD A3 1D    call $1DA3
3E1D: 46          ld   b,(hl)
3E1E: CB 70       bit  6,b
3E20: 28 B4       jr   z,$3DD6
3E22: 23          inc  hl
3E23: 4E          ld   c,(hl)
3E24: CB 58       bit  3,b
3E26: 28 10       jr   z,$3E38
3E28: 23          inc  hl
3E29: 56          ld   d,(hl)
3E2A: 23          inc  hl
3E2B: 7E          ld   a,(hl)
3E2C: 2B          dec  hl
3E2D: 2B          dec  hl
3E2E: CB 72       bit  6,d
3E30: 28 06       jr   z,$3E38
3E32: B9          cp   c
3E33: 38 03       jr   c,$3E38
3E35: 3E 02       ld   a,$02
3E37: C9          ret
3E38: CB 50       bit  2,b
3E3A: 28 12       jr   z,$3E4E
3E3C: EB          ex   de,hl
3E3D: 21 20 00    ld   hl,$0020
3E40: 19          add  hl,de
3E41: 7E          ld   a,(hl)
3E42: 2B          dec  hl
3E43: CB 76       bit  6,(hl)
3E45: EB          ex   de,hl
3E46: 28 06       jr   z,$3E4E
3E48: B9          cp   c
3E49: 38 03       jr   c,$3E4E
3E4B: 3E 00       ld   a,$00
3E4D: C9          ret
3E4E: CB 48       bit  1,b
3E50: 28 11       jr   z,$3E63
3E52: 2B          dec  hl
3E53: 2B          dec  hl
3E54: 7E          ld   a,(hl)
3E55: 2B          dec  hl
3E56: CB 76       bit  6,(hl)
3E58: 23          inc  hl
3E59: 23          inc  hl
3E5A: 23          inc  hl
3E5B: 28 06       jr   z,$3E63
3E5D: B9          cp   c
3E5E: 38 03       jr   c,$3E63
3E60: 3E 03       ld   a,$03
3E62: C9          ret
3E63: CB 40       bit  0,b
3E65: 28 12       jr   z,$3E79
3E67: EB          ex   de,hl
3E68: 21 E0 FF    ld   hl,$FFE0
3E6B: 19          add  hl,de
3E6C: 7E          ld   a,(hl)
3E6D: 2B          dec  hl
3E6E: CB 76       bit  6,(hl)
3E70: EB          ex   de,hl
3E71: 28 06       jr   z,$3E79
3E73: B9          cp   c
3E74: 38 03       jr   c,$3E79
3E76: 3E 01       ld   a,$01
3E78: C9          ret
3E79: 3E 04       ld   a,$04
3E7B: C9          ret
3E7C: CD A3 1D    call $1DA3
3E7F: 46          ld   b,(hl)
3E80: 23          inc  hl
3E81: 0E 00       ld   c,$00
3E83: CB 58       bit  3,b
3E85: 28 0C       jr   z,$3E93
3E87: 0C          inc  c
3E88: 23          inc  hl
3E89: 23          inc  hl
3E8A: 7E          ld   a,(hl)
3E8B: 2B          dec  hl
3E8C: 2B          dec  hl
3E8D: BE          cp   (hl)
3E8E: 38 03       jr   c,$3E93
3E90: 3E 02       ld   a,$02
3E92: C9          ret
3E93: CB 50       bit  2,b
3E95: 28 0E       jr   z,$3EA5
3E97: 0C          inc  c
3E98: EB          ex   de,hl
3E99: 21 20 00    ld   hl,$0020
3E9C: 19          add  hl,de
3E9D: EB          ex   de,hl
3E9E: 1A          ld   a,(de)
3E9F: BE          cp   (hl)
3EA0: 38 03       jr   c,$3EA5
3EA2: 3E 00       ld   a,$00
3EA4: C9          ret
3EA5: CB 48       bit  1,b
3EA7: 28 0C       jr   z,$3EB5
3EA9: 0C          inc  c
3EAA: 2B          dec  hl
3EAB: 2B          dec  hl
3EAC: 7E          ld   a,(hl)
3EAD: 23          inc  hl
3EAE: 23          inc  hl
3EAF: BE          cp   (hl)
3EB0: 38 03       jr   c,$3EB5
3EB2: 3E 03       ld   a,$03
3EB4: C9          ret
3EB5: CB 40       bit  0,b
3EB7: 28 0E       jr   z,$3EC7
3EB9: 0C          inc  c
3EBA: EB          ex   de,hl
3EBB: 21 E0 FF    ld   hl,$FFE0
3EBE: 19          add  hl,de
3EBF: EB          ex   de,hl
3EC0: 1A          ld   a,(de)
3EC1: BE          cp   (hl)
3EC2: 38 03       jr   c,$3EC7
3EC4: 3E 01       ld   a,$01
3EC6: C9          ret
3EC7: 79          ld   a,c
3EC8: FE 02       cp   $02
3ECA: 30 08       jr   nc,$3ED4
3ECC: DD 7E 00    ld   a,(ix+$00)
3ECF: EE 01       xor  $01
3ED1: E6 03       and  $03
3ED3: C9          ret
3ED4: 3E 04       ld   a,$04
3ED6: C9          ret
3ED7: 47          ld   b,a
3ED8: DD 7E 00    ld   a,(ix+$00)
3EDB: E6 FC       and  $FC
3EDD: B0          or   b
3EDE: DD 77 00    ld   (ix+$00),a
3EE1: DD CB 07 FE set  7,(ix+$07)
3EE5: C9          ret
3EE6: CD A3 1D    call $1DA3
3EE9: 46          ld   b,(hl)
3EEA: 23          inc  hl
3EEB: 4E          ld   c,(hl)
3EEC: DD 7E 00    ld   a,(ix+$00)
3EEF: E6 03       and  $03
3EF1: FE 03       cp   $03
3EF3: 28 0F       jr   z,$3F04
3EF5: CB 58       bit  3,b
3EF7: 28 0B       jr   z,$3F04
3EF9: 23          inc  hl
3EFA: 23          inc  hl
3EFB: 7E          ld   a,(hl)
3EFC: 2B          dec  hl
3EFD: 2B          dec  hl
3EFE: B9          cp   c
3EFF: 38 03       jr   c,$3F04
3F01: 3E 02       ld   a,$02
3F03: C9          ret
3F04: DD 7E 00    ld   a,(ix+$00)
3F07: E6 03       and  $03
3F09: FE 01       cp   $01
3F0B: 28 11       jr   z,$3F1E
3F0D: CB 50       bit  2,b
3F0F: 28 0D       jr   z,$3F1E
3F11: EB          ex   de,hl
3F12: 21 20 00    ld   hl,$0020
3F15: 19          add  hl,de
3F16: EB          ex   de,hl
3F17: 1A          ld   a,(de)
3F18: B9          cp   c
3F19: 38 03       jr   c,$3F1E
3F1B: 3E 00       ld   a,$00
3F1D: C9          ret
3F1E: DD 7E 00    ld   a,(ix+$00)
3F21: E6 03       and  $03
3F23: FE 02       cp   $02
3F25: 28 0F       jr   z,$3F36
3F27: CB 48       bit  1,b
3F29: 28 0B       jr   z,$3F36
3F2B: 2B          dec  hl
3F2C: 2B          dec  hl
3F2D: 7E          ld   a,(hl)
3F2E: 23          inc  hl
3F2F: 23          inc  hl
3F30: B9          cp   c
3F31: 38 03       jr   c,$3F36
3F33: 3E 03       ld   a,$03
3F35: C9          ret
3F36: DD 7E 00    ld   a,(ix+$00)
3F39: E6 03       and  $03
3F3B: 28 11       jr   z,$3F4E
3F3D: CB 40       bit  0,b
3F3F: 28 0D       jr   z,$3F4E
3F41: EB          ex   de,hl
3F42: 21 E0 FF    ld   hl,$FFE0
3F45: 19          add  hl,de
3F46: EB          ex   de,hl
3F47: 1A          ld   a,(de)
3F48: B9          cp   c
3F49: 38 03       jr   c,$3F4E
3F4B: 3E 01       ld   a,$01
3F4D: C9          ret
3F4E: 3E 04       ld   a,$04
3F50: C9          ret
3F51: DD 7E 01    ld   a,(ix+$01)
3F54: 3C          inc  a
3F55: E6 FE       and  $FE
3F57: 0F          rrca
3F58: 57          ld   d,a
3F59: DD 7E 03    ld   a,(ix+$03)
3F5C: 3C          inc  a
3F5D: E6 FE       and  $FE
3F5F: 0F          rrca
3F60: 5F          ld   e,a
3F61: 3A C6 E1    ld   a,($E1C6)
3F64: E6 FE       and  $FE
3F66: 0F          rrca
3F67: 92          sub  d
3F68: 67          ld   h,a
3F69: 30 02       jr   nc,$3F6D
3F6B: ED 44       neg
3F6D: 57          ld   d,a
3F6E: 3A C8 E1    ld   a,($E1C8)
3F71: E6 FE       and  $FE
3F73: 0F          rrca
3F74: 93          sub  e
3F75: 6F          ld   l,a
3F76: 30 02       jr   nc,$3F7A
3F78: ED 44       neg
3F7A: 5F          ld   e,a
3F7B: 28 07       jr   z,$3F84
3F7D: 7A          ld   a,d
3F7E: A7          and  a
3F7F: 28 21       jr   z,$3FA2
3F81: BB          cp   e
3F82: 30 1E       jr   nc,$3FA2
3F84: CB 7D       bit  7,l
3F86: 20 06       jr   nz,$3F8E
3F88: 0E 08       ld   c,$08
3F8A: 16 02       ld   d,$02
3F8C: 18 04       jr   $3F92
3F8E: 0E 02       ld   c,$02
3F90: 16 08       ld   d,$08
3F92: CB 7C       bit  7,h
3F94: 20 06       jr   nz,$3F9C
3F96: 06 04       ld   b,$04
3F98: 1E 01       ld   e,$01
3F9A: 18 22       jr   $3FBE
3F9C: 06 01       ld   b,$01
3F9E: 1E 04       ld   e,$04
3FA0: 18 1C       jr   $3FBE
3FA2: CB 7C       bit  7,h
3FA4: 20 06       jr   nz,$3FAC
3FA6: 0E 04       ld   c,$04
3FA8: 16 01       ld   d,$01
3FAA: 18 04       jr   $3FB0
3FAC: 0E 01       ld   c,$01
3FAE: 16 04       ld   d,$04
3FB0: CB 7D       bit  7,l
3FB2: 20 06       jr   nz,$3FBA
3FB4: 06 08       ld   b,$08
3FB6: 1E 02       ld   e,$02
3FB8: 18 04       jr   $3FBE
3FBA: 06 02       ld   b,$02
3FBC: 1E 08       ld   e,$08
3FBE: 21 8D E0    ld   hl,$E08D
3FC1: 70          ld   (hl),b
3FC2: 23          inc  hl
3FC3: 71          ld   (hl),c
3FC4: 23          inc  hl
3FC5: 72          ld   (hl),d
3FC6: 23          inc  hl
3FC7: 73          ld   (hl),e
3FC8: 21 8D E0    ld   hl,$E08D
3FCB: 06 04       ld   b,$04
3FCD: DD 7E 10    ld   a,(ix+$10)
3FD0: DD B6 11    or   (ix+$11)
3FD3: DD B6 12    or   (ix+$12)
3FD6: 2F          cpl
3FD7: 4F          ld   c,a
3FD8: 79          ld   a,c
3FD9: A6          and  (hl)
3FDA: 28 06       jr   z,$3FE2
3FDC: CD FF 3F    call $3FFF
3FDF: FE 04       cp   $04
3FE1: D8          ret  c
3FE2: 23          inc  hl
3FE3: 10 F3       djnz $3FD8
3FE5: 21 8D E0    ld   hl,$E08D
3FE8: 06 04       ld   b,$04
3FEA: DD 7E 12    ld   a,(ix+$12)
3FED: 2F          cpl
3FEE: 4F          ld   c,a
3FEF: 79          ld   a,c
3FF0: A6          and  (hl)
3FF1: 28 06       jr   z,$3FF9
3FF3: CD FF 3F    call $3FFF
3FF6: FE 04       cp   $04
3FF8: D8          ret  c
3FF9: 23          inc  hl
3FFA: 10 F3       djnz $3FEF
3FFC: 3E 04       ld   a,$04
3FFE: C9          ret
3FFF: CB 5F       bit  3,a
4001: 20 25       jr   nz,$4028
4003: CB 57       bit  2,a
4005: 20 18       jr   nz,$401F
4007: CB 4F       bit  1,a
4009: 20 0A       jr   nz,$4015
400B: DD 7E 01    ld   a,(ix+$01)
400E: FE 29       cp   $29
4010: 38 EA       jr   c,$3FFC
4012: 3E 01       ld   a,$01
4014: C9          ret
4015: DD 7E 03    ld   a,(ix+$03)
4018: FE 21       cp   $21
401A: 38 E0       jr   c,$3FFC
401C: 3E 03       ld   a,$03
401E: C9          ret
401F: DD 7E 01    ld   a,(ix+$01)
4022: FE D7       cp   $D7
4024: 30 D6       jr   nc,$3FFC
4026: AF          xor  a
4027: C9          ret
4028: DD 7E 03    ld   a,(ix+$03)
402B: FE DF       cp   $DF
402D: 30 CD       jr   nc,$3FFC
402F: 3E 02       ld   a,$02
4031: C9          ret
4032: E6 03       and  $03
4034: 5F          ld   e,a
4035: 16 00       ld   d,$00
4037: 21 3D 40    ld   hl,$403D
403A: 19          add  hl,de
403B: 7E          ld   a,(hl)
403C: C9          ret
403D: 04          inc  b
403E: 01 08 02    ld   bc,$0208
4041: DD 56 01    ld   d,(ix+$01)
4044: DD 5E 03    ld   e,(ix+$03)
4047: DD 7E 00    ld   a,(ix+$00)
404A: E6 03       and  $03
404C: 28 20       jr   z,$406E
404E: FE 01       cp   $01
4050: 28 14       jr   z,$4066
4052: FE 02       cp   $02
4054: 28 08       jr   z,$405E
4056: 7B          ld   a,e
4057: D6 07       sub  $07
4059: 5F          ld   e,a
405A: 01 07 0E    ld   bc,$0E07
405D: C9          ret
405E: 7B          ld   a,e
405F: C6 07       add  a,$07
4061: 5F          ld   e,a
4062: 01 07 0E    ld   bc,$0E07
4065: C9          ret
4066: 7A          ld   a,d
4067: D6 07       sub  $07
4069: 57          ld   d,a
406A: 01 0E 07    ld   bc,$070E
406D: C9          ret
406E: 7A          ld   a,d
406F: C6 07       add  a,$07
4071: 57          ld   d,a
4072: 01 0E 07    ld   bc,$070E
4075: C9          ret
4076: FD E5       push iy
4078: D9          exx
4079: 11 31 00    ld   de,$0031
407C: FD 19       add  iy,de
407E: 06 0C       ld   b,$0C
4080: 11 07 00    ld   de,$0007
4083: D9          exx
4084: FD 7E 00    ld   a,(iy+$00)
4087: FE 80       cp   $80
4089: 38 16       jr   c,$40A1
408B: FE D0       cp   $D0
408D: 28 04       jr   z,$4093
408F: FE B8       cp   $B8
4091: 30 0E       jr   nc,$40A1
4093: FD 66 01    ld   h,(iy+$01)
4096: FD 6E 03    ld   l,(iy+$03)
4099: CD EF 05    call $05EF
409C: 30 03       jr   nc,$40A1
409E: FD E1       pop  iy
40A0: C9          ret
40A1: D9          exx
40A2: FD 19       add  iy,de
40A4: 10 DD       djnz $4083
40A6: FD E1       pop  iy
40A8: A7          and  a
40A9: C9          ret
40AA: DD CB 00 4E bit  1,(ix+$00)
40AE: 28 0B       jr   z,$40BB
40B0: CD 41 40    call $4041
40B3: CD 76 40    call $4076
40B6: DD CB 07 AE res  5,(ix+$07)
40BA: C9          ret
40BB: DD 4E 00    ld   c,(ix+$00)
40BE: DD 56 01    ld   d,(ix+$01)
40C1: DD 7E 03    ld   a,(ix+$03)
40C4: 3C          inc  a
40C5: E6 F0       and  $F0
40C7: 5F          ld   e,a
40C8: 21 80 E0    ld   hl,$E080
40CB: 36 00       ld   (hl),$00
40CD: 23          inc  hl
40CE: D9          exx
40CF: FD E5       push iy
40D1: 11 31 00    ld   de,$0031
40D4: FD 19       add  iy,de
40D6: 11 07 00    ld   de,$0007
40D9: 06 0C       ld   b,$0C
40DB: FD 7E 00    ld   a,(iy+$00)
40DE: FE 80       cp   $80
40E0: 38 6D       jr   c,$414F
40E2: FE D0       cp   $D0
40E4: 28 04       jr   z,$40EA
40E6: FE B8       cp   $B8
40E8: 30 65       jr   nc,$414F
40EA: D9          exx
40EB: FD 7E 03    ld   a,(iy+$03)
40EE: 93          sub  e
40EF: 20 43       jr   nz,$4134
40F1: CB 41       bit  0,c
40F3: 20 06       jr   nz,$40FB
40F5: FD 7E 01    ld   a,(iy+$01)
40F8: 92          sub  d
40F9: 18 04       jr   $40FF
40FB: 7A          ld   a,d
40FC: FD 96 01    sub  (iy+$01)
40FF: 28 4D       jr   z,$414E
4101: FE 11       cp   $11
4103: 30 49       jr   nc,$414E
4105: FE 0F       cp   $0F
4107: D2 9B 41    jp   nc,$419B
410A: FD 7E 00    ld   a,(iy+$00)
410D: FE 90       cp   $90
410F: D2 A9 41    jp   nc,$41A9
4112: 3A 80 E0    ld   a,($E080)
4115: 3C          inc  a
4116: 32 80 E0    ld   ($E080),a
4119: D9          exx
411A: 78          ld   a,b
411B: D9          exx
411C: 77          ld   (hl),a
411D: 23          inc  hl
411E: FD 56 01    ld   d,(iy+$01)
4121: FD 5E 03    ld   e,(iy+$03)
4124: 7A          ld   a,d
4125: FE D8       cp   $D8
4127: D2 A9 41    jp   nc,$41A9
412A: FE 29       cp   $29
412C: DA A9 41    jp   c,$41A9
412F: D9          exx
4130: FD E1       pop  iy
4132: 18 9B       jr   $40CF
4134: FE 09       cp   $09
4136: 38 04       jr   c,$413C
4138: FE F8       cp   $F8
413A: 38 12       jr   c,$414E
413C: CB 41       bit  0,c
413E: 20 06       jr   nz,$4146
4140: FD 7E 01    ld   a,(iy+$01)
4143: 92          sub  d
4144: 18 04       jr   $414A
4146: 7A          ld   a,d
4147: FD 96 01    sub  (iy+$01)
414A: FE 0F       cp   $0F
414C: 38 5B       jr   c,$41A9
414E: D9          exx
414F: FD 19       add  iy,de
4151: 10 88       djnz $40DB
4153: 3A 80 E0    ld   a,($E080)
4156: A7          and  a
4157: 28 48       jr   z,$41A1
4159: D9          exx
415A: 3E 08       ld   a,$08
415C: CB 41       bit  0,c
415E: 28 02       jr   z,$4162
4160: 3E F8       ld   a,$F8
4162: D5          push de
4163: 82          add  a,d
4164: 57          ld   d,a
4165: CD 0B 54    call $540B
4168: D1          pop  de
4169: 38 3E       jr   c,$41A9
416B: 3E 07       ld   a,$07
416D: CB 41       bit  0,c
416F: 28 02       jr   z,$4173
4171: 3E F9       ld   a,$F9
4173: 82          add  a,d
4174: 57          ld   d,a
4175: CD AD 41    call $41AD
4178: 38 2F       jr   c,$41A9
417A: 3A C5 E1    ld   a,($E1C5)
417D: E6 98       and  $98
417F: FE 80       cp   $80
4181: 20 10       jr   nz,$4193
4183: 3A C6 E1    ld   a,($E1C6)
4186: 67          ld   h,a
4187: 3A C8 E1    ld   a,($E1C8)
418A: 6F          ld   l,a
418B: 01 0E 08    ld   bc,$080E
418E: CD EF 05    call $05EF
4191: 38 16       jr   c,$41A9
4193: FD E1       pop  iy
4195: DD CB 07 EE set  5,(ix+$07)
4199: A7          and  a
419A: C9          ret
419B: 3A 80 E0    ld   a,($E080)
419E: A7          and  a
419F: 20 F2       jr   nz,$4193
41A1: FD E1       pop  iy
41A3: DD CB 07 AE res  5,(ix+$07)
41A7: A7          and  a
41A8: C9          ret
41A9: FD E1       pop  iy
41AB: 37          scf
41AC: C9          ret
41AD: 01 02 06    ld   bc,$0602
41B0: D9          exx
41B1: FD 21 1A E2 ld   iy,$E21A
41B5: 11 15 00    ld   de,$0015
41B8: 06 08       ld   b,$08
41BA: D9          exx
41BB: FD 7E 00    ld   a,(iy+$00)
41BE: E6 98       and  $98
41C0: FE 80       cp   $80
41C2: 20 0A       jr   nz,$41CE
41C4: FD 66 01    ld   h,(iy+$01)
41C7: FD 6E 03    ld   l,(iy+$03)
41CA: CD EF 05    call $05EF
41CD: D8          ret  c
41CE: D9          exx
41CF: FD 19       add  iy,de
41D1: 10 E7       djnz $41BA
41D3: D9          exx
41D4: A7          and  a
41D5: C9          ret
41D6: DD CB 07 66 bit  4,(ix+$07)
41DA: C0          ret  nz
41DB: DD 7E 13    ld   a,(ix+$13)
41DE: A7          and  a
41DF: C0          ret  nz
41E0: FD E5       push iy
41E2: 11 31 00    ld   de,$0031
41E5: FD 19       add  iy,de
41E7: 11 07 00    ld   de,$0007
41EA: 06 0C       ld   b,$0C
41EC: FD 7E 00    ld   a,(iy+$00)
41EF: FE 98       cp   $98
41F1: 20 1A       jr   nz,$420D
41F3: DD 7E 03    ld   a,(ix+$03)
41F6: FD 96 03    sub  (iy+$03)
41F9: 28 04       jr   z,$41FF
41FB: FE FF       cp   $FF
41FD: 38 0E       jr   c,$420D
41FF: DD 7E 01    ld   a,(ix+$01)
4202: FD 96 01    sub  (iy+$01)
4205: FE 0E       cp   $0E
4207: 38 0B       jr   c,$4214
4209: FE F3       cp   $F3
420B: 30 11       jr   nc,$421E
420D: FD 19       add  iy,de
420F: 10 DB       djnz $41EC
4211: FD E1       pop  iy
4213: C9          ret
4214: DD 7E 00    ld   a,(ix+$00)
4217: E6 FC       and  $FC
4219: DD 77 00    ld   (ix+$00),a
421C: 18 0A       jr   $4228
421E: DD 7E 00    ld   a,(ix+$00)
4221: E6 FC       and  $FC
4223: F6 01       or   $01
4225: DD 77 00    ld   (ix+$00),a
4228: FD E1       pop  iy
422A: CD C1 3D    call $3DC1
422D: 20 35       jr   nz,$4264
422F: CD A3 1D    call $1DA3
4232: DD 7E 00    ld   a,(ix+$00)
4235: E6 03       and  $03
4237: 20 05       jr   nz,$423E
4239: 7E          ld   a,(hl)
423A: E6 0E       and  $0E
423C: 18 03       jr   $4241
423E: 7E          ld   a,(hl)
423F: E6 0B       and  $0B
4241: CB 57       bit  2,a
4243: 20 17       jr   nz,$425C
4245: CB 47       bit  0,a
4247: 20 0F       jr   nz,$4258
4249: CB 4F       bit  1,a
424B: 20 07       jr   nz,$4254
424D: CB 5F       bit  3,a
424F: C8          ret  z
4250: 3E 02       ld   a,$02
4252: 18 09       jr   $425D
4254: 3E 03       ld   a,$03
4256: 18 05       jr   $425D
4258: 3E 01       ld   a,$01
425A: 18 01       jr   $425D
425C: AF          xor  a
425D: CD D7 3E    call $3ED7
4260: DD CB 07 BE res  7,(ix+$07)
4264: CD AA 40    call $40AA
4267: D8          ret  c
4268: CD 02 3A    call $3A02
426B: C9          ret
426C: CD A3 1D    call $1DA3
426F: FD E5       push iy
4271: 11 31 00    ld   de,$0031
4274: FD 19       add  iy,de
4276: 11 07 00    ld   de,$0007
4279: 06 0C       ld   b,$0C
427B: FD 7E 00    ld   a,(iy+$00)
427E: FE A0       cp   $A0
4280: 38 32       jr   c,$42B4
4282: FE B8       cp   $B8
4284: 30 2E       jr   nc,$42B4
4286: FD 7E 01    ld   a,(iy+$01)
4289: DD 96 01    sub  (ix+$01)
428C: 30 02       jr   nc,$4290
428E: ED 44       neg
4290: FE 0E       cp   $0E
4292: 30 20       jr   nc,$42B4
4294: FD 7E 03    ld   a,(iy+$03)
4297: DD 96 03    sub  (ix+$03)
429A: 38 18       jr   c,$42B4
429C: E6 F0       and  $F0
429E: 28 1C       jr   z,$42BC
42A0: 0F          rrca
42A1: 0F          rrca
42A2: 0F          rrca
42A3: 0F          rrca
42A4: 4F          ld   c,a
42A5: E5          push hl
42A6: 7E          ld   a,(hl)
42A7: E6 0F       and  $0F
42A9: 28 08       jr   z,$42B3
42AB: 23          inc  hl
42AC: 23          inc  hl
42AD: 0D          dec  c
42AE: 20 F6       jr   nz,$42A6
42B0: E1          pop  hl
42B1: 18 09       jr   $42BC
42B3: E1          pop  hl
42B4: FD 19       add  iy,de
42B6: 10 C3       djnz $427B
42B8: FD E1       pop  iy
42BA: 18 05       jr   $42C1
42BC: FD E1       pop  iy
42BE: 3E 07       ld   a,$07
42C0: C9          ret
42C1: 3A D7 E1    ld   a,($E1D7)
42C4: E6 88       and  $88
42C6: 28 35       jr   z,$42FD
42C8: FE 80       cp   $80
42CA: 28 07       jr   z,$42D3
42CC: 3A DD E1    ld   a,($E1DD)
42CF: FE 20       cp   $20
42D1: 30 2A       jr   nc,$42FD
42D3: 3A D8 E1    ld   a,($E1D8)
42D6: DD 96 01    sub  (ix+$01)
42D9: FE 20       cp   $20
42DB: 38 08       jr   c,$42E5
42DD: FE E0       cp   $E0
42DF: 38 1C       jr   c,$42FD
42E1: 06 04       ld   b,$04
42E3: 18 02       jr   $42E7
42E5: 06 01       ld   b,$01
42E7: 3A DA E1    ld   a,($E1DA)
42EA: DD 96 03    sub  (ix+$03)
42ED: FE 20       cp   $20
42EF: 38 08       jr   c,$42F9
42F1: FE E0       cp   $E0
42F3: 38 08       jr   c,$42FD
42F5: 78          ld   a,b
42F6: F6 08       or   $08
42F8: C9          ret
42F9: 78          ld   a,b
42FA: F6 02       or   $02
42FC: C9          ret
42FD: AF          xor  a
42FE: C9          ret
42FF: F5          push af
4300: CD A3 1D    call $1DA3
4303: F1          pop  af
4304: A6          and  (hl)
4305: C8          ret  z
4306: CB 57       bit  2,a
4308: 20 0C       jr   nz,$4316
430A: CB 47       bit  0,a
430C: 20 0E       jr   nz,$431C
430E: CB 4F       bit  1,a
4310: 20 07       jr   nz,$4319
4312: B7          or   a
4313: 3E 02       ld   a,$02
4315: C9          ret
4316: 3E 00       ld   a,$00
4318: C9          ret
4319: 3E 03       ld   a,$03
431B: C9          ret
431C: 3E 01       ld   a,$01
431E: C9          ret
431F: DD CB 07 66 bit  4,(ix+$07)
4323: 20 0E       jr   nz,$4333
4325: CD A3 1D    call $1DA3
4328: 23          inc  hl
4329: 7E          ld   a,(hl)
432A: FE 08       cp   $08
432C: D0          ret  nc
432D: 87          add  a,a
432E: 87          add  a,a
432F: 87          add  a,a
4330: 87          add  a,a
4331: 18 19       jr   $434C
4333: 3A C6 E1    ld   a,($E1C6)
4336: DD 96 01    sub  (ix+$01)
4339: 30 02       jr   nc,$433D
433B: ED 44       neg
433D: 47          ld   b,a
433E: 3A C8 E1    ld   a,($E1C8)
4341: DD 96 03    sub  (ix+$03)
4344: 30 02       jr   nc,$4348
4346: ED 44       neg
4348: B8          cp   b
4349: 30 01       jr   nc,$434C
434B: 78          ld   a,b
434C: 21 19 E2    ld   hl,$E219
434F: BE          cp   (hl)
4350: D0          ret  nc
4351: 77          ld   (hl),a
4352: C9          ret

4353: DD 7E 00    ld   a,(ix+$00)
4356: CB 77       bit  6,a
4358: 20 3E       jr   nz,$4398
435A: DD 36 00 C0 ld   (ix+$00),$C0
435E: DD 36 02 00 ld   (ix+$02),$00
4362: DD 36 03 F1 ld   (ix+$03),$F1
4366: DD 36 04 00 ld   (ix+$04),$00
436A: DD 36 05 00 ld   (ix+$05),$00
436E: DD 36 06 00 ld   (ix+$06),$00
4372: DD 36 07 00 ld   (ix+$07),$00
4376: DD 36 08 00 ld   (ix+$08),$00
437A: DD 36 09 00 ld   (ix+$09),$00
437E: DD 36 0A 00 ld   (ix+$0a),$00
4382: DD 36 0B 00 ld   (ix+$0b),$00
4386: DD 36 0C 00 ld   (ix+$0c),$00
438A: DD 36 0D 00 ld   (ix+$0d),$00
438E: DD 36 0E 00 ld   (ix+$0e),$00
4392: FD CB 1B 8E res  1,(iy+$1b)
4396: 18 4B       jr   $43E3
4398: DD CB 00 6E bit  5,(ix+$00)
439C: C2 4C 44    jp   nz,$444C
439F: 3A 00 E0    ld   a,($E000)
43A2: E6 40       and  $40
43A4: 20 05       jr   nz,$43AB
43A6: DD 36 00 00 ld   (ix+$00),$00
43AA: C9          ret
43AB: 3A B6 E1    ld   a,($E1B6)
43AE: A7          and  a
43AF: C2 E0 44    jp   nz,$44E0
43B2: FD CB 1B 46 bit  0,(iy+$1b)
43B6: 28 06       jr   z,$43BE
43B8: FD CB 1B 86 res  0,(iy+$1b)
43BC: 18 52       jr   $4410
43BE: CD 61 48    call $4861
43C1: C2 E0 44    jp   nz,$44E0
43C4: FD CB 16 4E bit  1,(iy+$16)
43C8: 20 10       jr   nz,$43DA
43CA: FD 34 17    inc  (iy+$17)
43CD: FD 7E 17    ld   a,(iy+$17)
43D0: FE 04       cp   $04
43D2: 38 0F       jr   c,$43E3
43D4: FD CB 16 CE set  1,(iy+$16)
43D8: 18 09       jr   $43E3
43DA: FD 35 17    dec  (iy+$17)
43DD: 20 04       jr   nz,$43E3
43DF: FD CB 16 8E res  1,(iy+$16)
43E3: 21 AA 47    ld   hl,$47AA
43E6: 3A 00 E0    ld   a,($E000)
43E9: 87          add  a,a
43EA: 30 0A       jr   nc,$43F6
43EC: 3A 02 A0    ld   a,(dsw_1_a002)
43EF: E6 10       and  $10
43F1: 20 03       jr   nz,$43F6
43F3: 21 AE 47    ld   hl,$47AE
43F6: CD CD 47    call $47CD
43F9: 17          rla
43FA: 30 02       jr   nc,$43FE
43FC: 23          inc  hl
43FD: 23          inc  hl
43FE: 7E          ld   a,(hl)
43FF: DD 77 10    ld   (ix+$10),a
4402: 23          inc  hl
4403: 7E          ld   a,(hl)
4404: DD 77 0F    ld   (ix+$0f),a
4407: CD C2 47    call $47C2
440A: DD 77 01    ld   (ix+$01),a
440D: C3 E0 44    jp   $44E0
4410: DD 36 00 E3 ld   (ix+$00),$E3
4414: DD 36 05 00 ld   (ix+$05),$00
4418: FD 7E 1A    ld   a,(iy+$1a)
441B: FE 04       cp   $04
441D: 38 02       jr   c,$4421
441F: 3E 03       ld   a,$03
4421: 87          add  a,a
4422: 5F          ld   e,a
4423: 16 00       ld   d,$00
4425: 21 B2 47    ld   hl,$47B2
4428: 3A 02 A0    ld   a,(dsw_1_a002)
442B: E6 10       and  $10
442D: 20 03       jr   nz,$4432
442F: 21 BA 47    ld   hl,$47BA
4432: 19          add  hl,de
4433: 7E          ld   a,(hl)
4434: DD 77 10    ld   (ix+$10),a
4437: 23          inc  hl
4438: 7E          ld   a,(hl)
4439: DD 77 0F    ld   (ix+$0f),a
443C: CD DB 47    call $47DB
443F: 21 01 E0    ld   hl,$E001
4442: CB E6       set  4,(hl)
4444: 3E 17       ld   a,$17
4446: 06 00       ld   b,$00
4448: CD D9 02    call $02D9
444B: C9          ret
444C: FD 46 14    ld   b,(iy+$14)
444F: FD 4E 15    ld   c,(iy+$15)
4452: 78          ld   a,b
4453: B1          or   c
4454: 28 07       jr   z,$445D
4456: 0B          dec  bc
4457: FD 70 14    ld   (iy+$14),b
445A: FD 71 15    ld   (iy+$15),c
445D: FD CB 1B 86 res  0,(iy+$1b)
4461: DD 7E 00    ld   a,(ix+$00)
4464: CB 57       bit  2,a
4466: C2 72 47    jp   nz,$4772
4469: CB 5F       bit  3,a
446B: C2 20 47    jp   nz,$4720
446E: E6 10       and  $10
4470: C2 FC 46    jp   nz,$46FC
4473: DD CB 07 6E bit  5,(ix+$07)
4477: C2 C1 46    jp   nz,$46C1
447A: CD DB 47    call $47DB
447D: 3A 00 E0    ld   a,($E000)
4480: E6 40       and  $40
4482: 20 08       jr   nz,$448C
4484: DD 36 00 00 ld   (ix+$00),$00
4488: CD 4F 05    call $054F
448B: C9          ret
448C: 21 DD 44    ld   hl,entry_44dd		; [push_function]
448F: E5          push hl
4490: DD CB 07 56 bit  2,(ix+$07)
4494: C2 B5 46    jp   nz,$46B5
4497: 3A B6 E1    ld   a,($E1B6)
449A: A7          and  a
449B: C0          ret  nz
449C: 3A C5 E1    ld   a,($E1C5)
449F: E6 98       and  $98
44A1: FE 80       cp   $80
44A3: C0          ret  nz
44A4: FD E5       push iy
44A6: FD 21 C5 E1 ld   iy,$E1C5
44AA: 01 07 07    ld   bc,$0707
44AD: CD D7 05    call $05D7
44B0: 30 0F       jr   nc,$44C1
44B2: FD CB 00 DE set  3,(iy+$00)
44B6: DD CB 07 D6 set  2,(ix+$07)
44BA: DD 36 06 1E ld   (ix+$06),$1E
44BE: FD E1       pop  iy
44C0: C9          ret
44C1: FD E1       pop  iy
44C3: DD 7E 05    ld   a,(ix+$05)
44C6: FE 40       cp   $40
44C8: D2 83 46    jp   nc,$4683
44CB: FE 30       cp   $30
44CD: D2 47 46    jp   nc,$4647
44D0: FE 20       cp   $20
44D2: D2 D2 45    jp   nc,$45D2
44D5: FE 10       cp   $10
44D7: D2 46 45    jp   nc,$4546
44DA: C3 01 45    jp   $4501

entry_44dd:
44DD: DD 34 08    inc  (ix+$08)
44E0: DD 7E 08    ld   a,(ix+$08)
44E3: FE 18       cp   $18
44E5: 38 04       jr   c,$44EB
44E7: AF          xor  a
44E8: DD 77 08    ld   (ix+$08),a
44EB: E6 18       and  $18
44ED: 0F          rrca
44EE: 0F          rrca
44EF: 0F          rrca
44F0: 4F          ld   c,a
44F1: FD 7E 17    ld   a,(iy+$17)
44F4: 47          ld   b,a
44F5: 87          add  a,a
44F6: 80          add  a,b
44F7: 81          add  a,c
44F8: C6 4D       add  a,$4D
44FA: 47          ld   b,a
44FB: 0E 04       ld   c,$04
44FD: CD 97 02    call $0297
4500: C9          ret
4501: DD 7E 0D    ld   a,(ix+$0d)
4504: A7          and  a
4505: 28 04       jr   z,$450B
4507: DD 35 0D    dec  (ix+$0d)
450A: C9          ret
450B: DD 7E 05    ld   a,(ix+$05)
450E: E6 0F       and  $0F
4510: 20 06       jr   nz,$4518
4512: CD A5 49    call $49A5
4515: DD 34 05    inc  (ix+$05)
4518: DD 66 03    ld   h,(ix+$03)
451B: DD 6E 04    ld   l,(ix+$04)
451E: 11 2B FF    ld   de,$FF2B
4521: 19          add  hl,de
4522: DD 74 03    ld   (ix+$03),h
4525: DD 75 04    ld   (ix+$04),l
4528: 7C          ld   a,h
4529: FE E1       cp   $E1
452B: D0          ret  nc
452C: 3A 01 E0    ld   a,($E001)
452F: E6 40       and  $40
4531: 20 06       jr   nz,$4539
4533: DD 36 05 10 ld   (ix+$05),$10
4537: 18 04       jr   $453D
4539: DD 36 05 20 ld   (ix+$05),$20
453D: DD 7E 0C    ld   a,(ix+$0c)
4540: F6 E0       or   $E0
4542: DD 77 00    ld   (ix+$00),a
4545: C9          ret
4546: CD 61 48    call $4861
4549: 20 0C       jr   nz,$4557
454B: 3A 01 E0    ld   a,($E001)
454E: E6 40       and  $40
4550: 20 05       jr   nz,$4557
4552: DD 36 05 30 ld   (ix+$05),$30
4556: C9          ret
4557: CD F2 48    call $48F2
455A: D8          ret  c
455B: 3A CC E1    ld   a,($E1CC)
455E: 87          add  a,a
455F: 30 4F       jr   nc,$45B0
4561: CD C1 3D    call $3DC1
4564: 20 42       jr   nz,$45A8
4566: DD CB 07 7E bit  7,(ix+$07)
456A: 20 40       jr   nz,$45AC
456C: DD CB 07 76 bit  6,(ix+$07)
4570: 20 1C       jr   nz,$458E
4572: CD 7C 3E    call $3E7C
4575: FE 04       cp   $04
4577: D0          ret  nc
4578: DD 4E 00    ld   c,(ix+$00)
457B: CD D7 3E    call $3ED7
457E: A9          xor  c
457F: E6 03       and  $03
4581: FE 01       cp   $01
4583: 20 27       jr   nz,$45AC
4585: DD CB 07 F6 set  6,(ix+$07)
4589: DD CB 07 BE res  7,(ix+$07)
458D: C9          ret
458E: CD E6 3E    call $3EE6
4591: FE 04       cp   $04
4593: 30 08       jr   nc,$459D
4595: CD D7 3E    call $3ED7
4598: FD CB 07 B6 res  6,(iy+$07)
459C: C9          ret
459D: CD D6 3D    call $3DD6
45A0: FE 04       cp   $04
45A2: D0          ret  nc
45A3: CD D7 3E    call $3ED7
45A6: 18 04       jr   $45AC
45A8: DD CB 07 BE res  7,(ix+$07)
45AC: CD 3F 49    call $493F
45AF: C9          ret
45B0: DD CB 07 B6 res  6,(ix+$07)
45B4: CD C1 3D    call $3DC1
45B7: 20 11       jr   nz,$45CA
45B9: DD CB 07 7E bit  7,(ix+$07)
45BD: 20 0F       jr   nz,$45CE
45BF: CD D6 3D    call $3DD6
45C2: FE 04       cp   $04
45C4: D0          ret  nc
45C5: CD D7 3E    call $3ED7
45C8: 18 04       jr   $45CE
45CA: DD CB 07 BE res  7,(ix+$07)
45CE: CD 3F 49    call $493F
45D1: C9          ret
45D2: DD 7E 0E    ld   a,(ix+$0e)
45D5: FE 02       cp   $02
45D7: 30 05       jr   nc,$45DE
45D9: DD 36 05 10 ld   (ix+$05),$10
45DD: C9          ret
45DE: CD 61 48    call $4861
45E1: CD F2 48    call $48F2
45E4: D8          ret  c
45E5: DD 7E 0D    ld   a,(ix+$0d)
45E8: A7          and  a
45E9: 28 04       jr   z,$45EF
45EB: DD 35 0D    dec  (ix+$0d)
45EE: C9          ret
45EF: FD E5       push iy
45F1: FD 21 D3 E2 ld   iy,$E2D3
45F5: 11 0F 00    ld   de,$000F
45F8: 06 03       ld   b,$03
45FA: D9          exx
45FB: 01 0E 0E    ld   bc,$0E0E
45FE: D9          exx
45FF: FD 7E 00    ld   a,(iy+$00)
4602: E6 BC       and  $BC
4604: FE 80       cp   $80
4606: 20 0E       jr   nz,$4616
4608: D9          exx
4609: CD D7 05    call $05D7
460C: D9          exx
460D: 30 07       jr   nc,$4616
460F: FD E1       pop  iy
4611: DD 36 0D 1E ld   (ix+$0d),$1E
4615: C9          ret
4616: FD 19       add  iy,de
4618: 10 E5       djnz $45FF
461A: FD E1       pop  iy
461C: CD C1 3D    call $3DC1
461F: 20 1E       jr   nz,$463F
4621: DD CB 07 7E bit  7,(ix+$07)
4625: 20 1C       jr   nz,$4643
4627: CD D6 3D    call $3DD6
462A: FE 04       cp   $04
462C: D0          ret  nc
462D: DD 4E 00    ld   c,(ix+$00)
4630: CD D7 3E    call $3ED7
4633: A9          xor  c
4634: E6 03       and  $03
4636: FE 01       cp   $01
4638: 20 09       jr   nz,$4643
463A: DD 36 0D 1E ld   (ix+$0d),$1E
463E: C9          ret
463F: DD CB 07 BE res  7,(ix+$07)
4643: CD 3F 49    call $493F
4646: C9          ret
4647: DD 7E 03    ld   a,(ix+$03)
464A: FE DF       cp   $DF
464C: 38 13       jr   c,$4661
464E: CD C2 47    call $47C2
4651: DD BE 01    cp   (ix+$01)
4654: 28 06       jr   z,$465C
4656: 3D          dec  a
4657: DD BE 01    cp   (ix+$01)
465A: 20 05       jr   nz,$4661
465C: DD 36 05 40 ld   (ix+$05),$40
4660: C9          ret
4661: CD F2 48    call $48F2
4664: D8          ret  c
4665: CD C1 3D    call $3DC1
4668: 20 11       jr   nz,$467B
466A: DD CB 07 7E bit  7,(ix+$07)
466E: 20 0F       jr   nz,$467F
4670: CD 72 48    call $4872
4673: FE 04       cp   $04
4675: D0          ret  nc
4676: CD D7 3E    call $3ED7
4679: 18 04       jr   $467F
467B: DD CB 07 BE res  7,(ix+$07)
467F: CD 3F 49    call $493F
4682: C9          ret
4683: DD 7E 05    ld   a,(ix+$05)
4686: E6 0F       and  $0F
4688: 20 07       jr   nz,$4691
468A: DD 34 05    inc  (ix+$05)
468D: DD 36 00 E2 ld   (ix+$00),$E2
4691: DD 66 03    ld   h,(ix+$03)
4694: DD 6E 04    ld   l,(ix+$04)
4697: 11 D5 00    ld   de,$00D5
469A: 19          add  hl,de
469B: DD 74 03    ld   (ix+$03),h
469E: DD 75 04    ld   (ix+$04),l
46A1: 7C          ld   a,h
46A2: FE F0       cp   $F0
46A4: D8          ret  c
46A5: CD 4F 05    call $054F
46A8: CD 97 4D    call $4D97
46AB: 3E 17       ld   a,$17
46AD: CD EA 02    call $02EA
46B0: DD 36 00 80 ld   (ix+$00),$80
46B4: C9          ret
46B5: DD 35 06    dec  (ix+$06)
46B8: C0          ret  nz
46B9: DD 36 00 00 ld   (ix+$00),$00
46BD: CD 4F 05    call $054F
46C0: C9          ret
46C1: CD D3 49    call $49D3
46C4: DD 7E 0A    ld   a,(ix+$0a)
46C7: FE 20       cp   $20
46C9: 30 1C       jr   nc,$46E7
46CB: 06 2B       ld   b,$2B
46CD: 0E 04       ld   c,$04
46CF: DD 7E 00    ld   a,(ix+$00)
46D2: CB 4F       bit  1,a
46D4: 20 08       jr   nz,$46DE
46D6: E6 01       and  $01
46D8: 28 1E       jr   z,$46F8
46DA: CB E9       set  5,c
46DC: 18 1A       jr   $46F8
46DE: 04          inc  b
46DF: E6 01       and  $01
46E1: 28 15       jr   z,$46F8
46E3: CB E1       set  4,c
46E5: 18 11       jr   $46F8
46E7: 06 49       ld   b,$49
46E9: 0E 04       ld   c,$04
46EB: DD 7E 0B    ld   a,(ix+$0b)
46EE: D6 08       sub  $08
46F0: 38 06       jr   c,$46F8
46F2: 04          inc  b
46F3: E6 08       and  $08
46F5: 28 01       jr   z,$46F8
46F7: 04          inc  b
46F8: CD 97 02    call $0297
46FB: C9          ret
46FC: DD CB 07 4E bit  1,(ix+$07)
4700: 20 11       jr   nz,$4713
4702: DD CB 07 CE set  1,(ix+$07)
4706: CD 77 47    call $4777
4709: CD 97 4D    call $4D97
470C: CD AE 4D    call $4DAE
470F: DD 36 06 00 ld   (ix+$06),$00
4713: DD 35 06    dec  (ix+$06)
4716: 28 5A       jr   z,$4772
4718: 06 5C       ld   b,$5C
471A: 0E 04       ld   c,$04
471C: CD 97 02    call $0297
471F: C9          ret
4720: DD CB 07 46 bit  0,(ix+$07)
4724: 20 21       jr   nz,$4747
4726: DD CB 07 C6 set  0,(ix+$07)
472A: DD 36 06 FF ld   (ix+$06),$FF
472E: CD 77 47    call $4777
4731: 11 5A 3B    ld   de,$3B5A
4734: CD 2A 03    call $032A
4737: CD 97 4D    call $4D97
473A: DD CB 07 6E bit  5,(ix+$07)
473E: 28 07       jr   z,$4747
4740: DD 7E 0A    ld   a,(ix+$0a)
4743: FE 10       cp   $10
4745: 28 28       jr   z,$476F
4747: DD 34 06    inc  (ix+$06)
474A: DD 7E 06    ld   a,(ix+$06)
474D: FE 26       cp   $26
474F: 30 21       jr   nc,$4772
4751: FE 08       cp   $08
4753: 28 0F       jr   z,$4764
4755: 30 10       jr   nc,$4767
4757: 06 67       ld   b,$67
4759: 0E 05       ld   c,$05
475B: FE 04       cp   $04
475D: 30 01       jr   nc,$4760
475F: 04          inc  b
4760: CD 97 02    call $0297
4763: C9          ret
4764: CD C6 4D    call $4DC6
4767: 06 71       ld   b,$71
4769: 0E 0A       ld   c,$0A
476B: CD 97 02    call $0297
476E: C9          ret
476F: CD AE 4D    call $4DAE
4772: DD 36 00 80 ld   (ix+$00),$80
4776: C9          ret
4777: FD 46 17    ld   b,(iy+$17)
477A: 78          ld   a,b
477B: A7          and  a
477C: 3E 80       ld   a,$80
477E: 28 03       jr   z,$4783
4780: 0F          rrca
4781: 10 FD       djnz $4780
4783: FD B6 16    or   (iy+$16)
4786: FD 77 16    ld   (iy+$16),a
4789: CD 4F 05    call $054F
478C: 3E 17       ld   a,$17
478E: CD EA 02    call $02EA
4791: FD 7E 16    ld   a,(iy+$16)
4794: E6 F8       and  $F8
4796: FE F8       cp   $F8
4798: C0          ret  nz
4799: 3A 00 E0    ld   a,($E000)
479C: 87          add  a,a
479D: D0          ret  nc
479E: 21 B6 E1    ld   hl,$E1B6
47A1: CB FE       set  7,(hl)
47A3: CB DE       set  3,(hl)
47A5: FD 36 30 04 ld   (iy+$30),$04
47A9: C9          ret

47C2: FD 7E 17    ld   a,(iy+$17)
47C5: 87          add  a,a
47C6: 87          add  a,a
47C7: 47          ld   b,a
47C8: 87          add  a,a
47C9: 80          add  a,b
47CA: C6 68       add  a,$68
47CC: C9          ret
47CD: FD 4E 16    ld   c,(iy+$16)
47D0: FD 7E 17    ld   a,(iy+$17)
47D3: 47          ld   b,a
47D4: A7          and  a
47D5: 79          ld   a,c
47D6: C8          ret  z
47D7: 87          add  a,a
47D8: 10 FD       djnz $47D7
47DA: C9          ret
47DB: FD CB 1B 4E bit  1,(iy+$1b)
47DF: C8          ret  z
47E0: FD CB 1B 8E res  1,(iy+$1b)
47E4: 21 01 E0    ld   hl,$E001
47E7: CB F6       set  6,(hl)
47E9: 3E 3C       ld   a,$3C
47EB: CD BE 06    call $06BE
47EE: DD 7E 05    ld   a,(ix+$05)
47F1: A7          and  a
47F2: 28 04       jr   z,$47F8
47F4: FE 40       cp   $40
47F6: 38 0E       jr   c,$4806
47F8: DD 36 05 00 ld   (ix+$05),$00
47FC: CD F4 02    call $02F4
47FF: E6 01       and  $01
4801: DD 77 0C    ld   (ix+$0c),a
4804: 18 04       jr   $480A
4806: DD 36 05 20 ld   (ix+$05),$20
480A: DD 7E 00    ld   a,(ix+$00)
480D: E6 03       and  $03
480F: F6 80       or   $80
4811: 47          ld   b,a
4812: DD 4E 01    ld   c,(ix+$01)
4815: DD 56 03    ld   d,(ix+$03)
4818: DD 5E 05    ld   e,(ix+$05)
481B: DD 66 0C    ld   h,(ix+$0c)
481E: 3E 1E       ld   a,$1E
4820: FD E5       push iy
4822: FD 21 D3 E2 ld   iy,$E2D3
4826: D9          exx
4827: 11 0F 00    ld   de,$000F
482A: D9          exx
482B: FD 70 00    ld   (iy+$00),b
482E: FD 71 01    ld   (iy+$01),c
4831: FD 36 02 00 ld   (iy+$02),$00
4835: FD 72 03    ld   (iy+$03),d
4838: FD 36 04 00 ld   (iy+$04),$00
483C: FD 73 05    ld   (iy+$05),e
483F: FD 74 0C    ld   (iy+$0c),h
4842: FD 77 0D    ld   (iy+$0d),a
4845: D9          exx
4846: FD 19       add  iy,de
4848: D9          exx
4849: C6 1E       add  a,$1E
484B: FE 78       cp   $78
484D: 38 DC       jr   c,$482B
484F: FD E1       pop  iy
4851: DD 77 0D    ld   (ix+$0d),a
4854: DD 36 0E 03 ld   (ix+$0e),$03
4858: FD 36 14 02 ld   (iy+$14),$02
485C: FD 36 15 D0 ld   (iy+$15),$D0
4860: C9          ret
4861: DD 46 0F    ld   b,(ix+$0f)
4864: DD 4E 10    ld   c,(ix+$10)
4867: 78          ld   a,b
4868: B1          or   c
4869: C8          ret  z
486A: 0B          dec  bc
486B: DD 70 0F    ld   (ix+$0f),b
486E: DD 71 10    ld   (ix+$10),c
4871: C9          ret
4872: DD 7E 03    ld   a,(ix+$03)
4875: FE DF       cp   $DF
4877: 38 17       jr   c,$4890
4879: DD 7E 01    ld   a,(ix+$01)
487C: FE 67       cp   $67
487E: 38 10       jr   c,$4890
4880: FE 99       cp   $99
4882: 30 0C       jr   nc,$4890
4884: 4F          ld   c,a
4885: CD C2 47    call $47C2
4888: B9          cp   c
4889: 38 02       jr   c,$488D
488B: AF          xor  a
488C: C9          ret
488D: 3E 01       ld   a,$01
488F: C9          ret
4890: CD A3 1D    call $1DA3
4893: 46          ld   b,(hl)
4894: CB 68       bit  5,b
4896: CA D6 3D    jp   z,$3DD6
4899: 23          inc  hl
489A: 4E          ld   c,(hl)
489B: CB 58       bit  3,b
489D: 28 10       jr   z,$48AF
489F: 23          inc  hl
48A0: 56          ld   d,(hl)
48A1: 23          inc  hl
48A2: 7E          ld   a,(hl)
48A3: 2B          dec  hl
48A4: 2B          dec  hl
48A5: CB 6A       bit  5,d
48A7: 28 06       jr   z,$48AF
48A9: B9          cp   c
48AA: 38 03       jr   c,$48AF
48AC: 3E 02       ld   a,$02
48AE: C9          ret
48AF: CB 50       bit  2,b
48B1: 28 11       jr   z,$48C4
48B3: EB          ex   de,hl
48B4: 21 20 00    ld   hl,$0020
48B7: 19          add  hl,de
48B8: 7E          ld   a,(hl)
48B9: 2B          dec  hl
48BA: CB 6E       bit  5,(hl)
48BC: EB          ex   de,hl
48BD: 28 05       jr   z,$48C4
48BF: B9          cp   c
48C0: 38 02       jr   c,$48C4
48C2: AF          xor  a
48C3: C9          ret
48C4: CB 48       bit  1,b
48C6: 28 11       jr   z,$48D9
48C8: 2B          dec  hl
48C9: 2B          dec  hl
48CA: 7E          ld   a,(hl)
48CB: 2B          dec  hl
48CC: CB 6E       bit  5,(hl)
48CE: 23          inc  hl
48CF: 23          inc  hl
48D0: 23          inc  hl
48D1: 28 06       jr   z,$48D9
48D3: B9          cp   c
48D4: 38 03       jr   c,$48D9
48D6: 3E 03       ld   a,$03
48D8: C9          ret
48D9: CB 40       bit  0,b
48DB: 28 12       jr   z,$48EF
48DD: EB          ex   de,hl
48DE: 21 E0 FF    ld   hl,$FFE0
48E1: 19          add  hl,de
48E2: 7E          ld   a,(hl)
48E3: 2B          dec  hl
48E4: CB 6E       bit  5,(hl)
48E6: EB          ex   de,hl
48E7: 28 06       jr   z,$48EF
48E9: B9          cp   c
48EA: 38 03       jr   c,$48EF
48EC: 3E 01       ld   a,$01
48EE: C9          ret
48EF: 3E 04       ld   a,$04
48F1: C9          ret
48F2: CD 41 40    call $4041
48F5: FD E5       push iy
48F7: D9          exx
48F8: 11 31 00    ld   de,$0031
48FB: FD 19       add  iy,de
48FD: 06 0C       ld   b,$0C
48FF: 11 07 00    ld   de,$0007
4902: FD 7E 00    ld   a,(iy+$00)
4905: FE 80       cp   $80
4907: 38 17       jr   c,$4920
4909: FE B8       cp   $B8
490B: 30 13       jr   nc,$4920
490D: E6 F8       and  $F8
490F: FE A8       cp   $A8
4911: 28 0D       jr   z,$4920
4913: D9          exx
4914: FD 66 01    ld   h,(iy+$01)
4917: FD 6E 03    ld   l,(iy+$03)
491A: CD EF 05    call $05EF
491D: 38 09       jr   c,$4928
491F: D9          exx
4920: FD 19       add  iy,de
4922: 10 DE       djnz $4902
4924: FD E1       pop  iy
4926: A7          and  a
4927: C9          ret
4928: DD CB 07 EE set  5,(ix+$07)
492C: D9          exx
492D: DD 70 09    ld   (ix+$09),b
4930: DD 36 0A 00 ld   (ix+$0a),$00
4934: DD 36 0B 00 ld   (ix+$0b),$00
4938: DD 36 0C 00 ld   (ix+$0c),$00
493C: FD E1       pop  iy
493E: C9          ret
493F: 01 D5 00    ld   bc,$00D5
4942: 3A 01 E0    ld   a,($E001)
4945: E6 40       and  $40
4947: 28 20       jr   z,$4969
4949: 01 B3 00    ld   bc,$00B3
494C: FD 7E 14    ld   a,(iy+$14)
494F: FD B6 15    or   (iy+$15)
4952: 20 03       jr   nz,$4957
4954: 01 DE 00    ld   bc,$00DE
4957: FD 7E 08    ld   a,(iy+$08)
495A: FE 10       cp   $10
495C: 38 02       jr   c,$4960
495E: 3E 0F       ld   a,$0F
4960: 87          add  a,a
4961: 87          add  a,a
4962: 87          add  a,a
4963: 6F          ld   l,a
4964: 26 00       ld   h,$00
4966: 09          add  hl,bc
4967: 44          ld   b,h
4968: 4D          ld   c,l
4969: DD CB 00 46 bit  0,(ix+$00)
496D: C4 E3 2C    call nz,$2CE3
4970: DD CB 00 4E bit  1,(ix+$00)
4974: 20 17       jr   nz,$498D
4976: DD 66 01    ld   h,(ix+$01)
4979: DD 6E 02    ld   l,(ix+$02)
497C: 09          add  hl,bc
497D: DD 74 01    ld   (ix+$01),h
4980: DD 75 02    ld   (ix+$02),l
4983: DD 7E 03    ld   a,(ix+$03)
4986: 3C          inc  a
4987: E6 F0       and  $F0
4989: DD 77 03    ld   (ix+$03),a
498C: C9          ret
498D: DD 66 03    ld   h,(ix+$03)
4990: DD 6E 04    ld   l,(ix+$04)
4993: 09          add  hl,bc
4994: DD 74 03    ld   (ix+$03),h
4997: DD 75 04    ld   (ix+$04),l
499A: DD 7E 01    ld   a,(ix+$01)
499D: E6 F0       and  $F0
499F: C6 08       add  a,$08
49A1: DD 77 01    ld   (ix+$01),a
49A4: C9          ret
49A5: FD 7E 17    ld   a,(iy+$17)
49A8: 87          add  a,a
49A9: 87          add  a,a
49AA: 5F          ld   e,a
49AB: 16 00       ld   d,$00
49AD: 21 BF 49    ld   hl,$49BF
49B0: 19          add  hl,de
49B1: 5E          ld   e,(hl)
49B2: 23          inc  hl
49B3: 56          ld   d,(hl)
49B4: 23          inc  hl
49B5: 46          ld   b,(hl)
49B6: 23          inc  hl
49B7: 4E          ld   c,(hl)
49B8: EB          ex   de,hl
49B9: 3E 25       ld   a,$25
49BB: CD 5C 04    call $045C
49BE: C9          ret

49D3: DD 7E 0A    ld   a,(ix+$0a)
49D6: FE 20       cp   $20
49D8: D2 DF 4A    jp   nc,$4ADF
49DB: FE 10       cp   $10
49DD: D2 8D 4A    jp   nc,$4A8D
49E0: FD E5       push iy
49E2: CD 03 4B    call $4B03
49E5: FD 7E 00    ld   a,(iy+$00)
49E8: FE 80       cp   $80
49EA: DA 82 4A    jp   c,$4A82
49ED: FE B8       cp   $B8
49EF: D2 82 4A    jp   nc,$4A82
49F2: E6 F8       and  $F8
49F4: FE A8       cp   $A8
49F6: CA 82 4A    jp   z,$4A82
49F9: 01 0E 0E    ld   bc,$0E0E
49FC: CD D7 05    call $05D7
49FF: D2 82 4A    jp   nc,$4A82
4A02: FD 7E 01    ld   a,(iy+$01)
4A05: DD 96 01    sub  (ix+$01)
4A08: 38 04       jr   c,$4A0E
4A0A: FE 02       cp   $02
4A0C: 38 12       jr   c,$4A20
4A0E: FD 7E 03    ld   a,(iy+$03)
4A11: DD 96 03    sub  (ix+$03)
4A14: 38 04       jr   c,$4A1A
4A16: FE 02       cp   $02
4A18: 38 16       jr   c,$4A30
4A1A: FD E1       pop  iy
4A1C: CD 3F 49    call $493F
4A1F: C9          ret
4A20: FD 7E 03    ld   a,(iy+$03)
4A23: DD 96 03    sub  (ix+$03)
4A26: 38 04       jr   c,$4A2C
4A28: 06 02       ld   b,$02
4A2A: 18 12       jr   $4A3E
4A2C: 06 03       ld   b,$03
4A2E: 18 0E       jr   $4A3E
4A30: FD 7E 01    ld   a,(iy+$01)
4A33: DD 96 01    sub  (ix+$01)
4A36: 38 04       jr   c,$4A3C
4A38: 06 00       ld   b,$00
4A3A: 18 02       jr   $4A3E
4A3C: 06 01       ld   b,$01
4A3E: FD 7E 00    ld   a,(iy+$00)
4A41: FD 36 00 D0 ld   (iy+$00),$D0
4A45: FD 36 06 00 ld   (iy+$06),$00
4A49: FE B0       cp   $B0
4A4B: 28 04       jr   z,$4A51
4A4D: FD 36 05 00 ld   (iy+$05),$00
4A51: FD E1       pop  iy
4A53: DD 36 0A 10 ld   (ix+$0a),$10
4A57: DD 7E 00    ld   a,(ix+$00)
4A5A: E6 03       and  $03
4A5C: B8          cp   b
4A5D: C8          ret  z
4A5E: DD 7E 00    ld   a,(ix+$00)
4A61: E6 FC       and  $FC
4A63: B0          or   b
4A64: DD 77 00    ld   (ix+$00),a
4A67: 78          ld   a,b
4A68: EE 01       xor  $01
4A6A: F6 80       or   $80
4A6C: DD 77 0C    ld   (ix+$0c),a
4A6F: C9          ret
4A70: FD 36 00 00 ld   (iy+$00),$00
4A74: FD E1       pop  iy
4A76: DD 36 0A 20 ld   (ix+$0a),$20
4A7A: 3E 15       ld   a,$15
4A7C: 06 00       ld   b,$00
4A7E: CD D9 02    call $02D9
4A81: C9          ret
4A82: FD E1       pop  iy
4A84: DD CB 07 AE res  5,(ix+$07)
4A88: DD CB 07 BE res  7,(ix+$07)
4A8C: C9          ret
4A8D: CD C1 3D    call $3DC1
4A90: 20 13       jr   nz,$4AA5
4A92: CD D6 3D    call $3DD6
4A95: 47          ld   b,a
4A96: DD 7E 00    ld   a,(ix+$00)
4A99: E6 03       and  $03
4A9B: B8          cp   b
4A9C: 28 07       jr   z,$4AA5
4A9E: EE 01       xor  $01
4AA0: F6 80       or   $80
4AA2: DD 77 0C    ld   (ix+$0c),a
4AA5: FD E5       push iy
4AA7: CD 03 4B    call $4B03
4AAA: FD 7E 00    ld   a,(iy+$00)
4AAD: FE D0       cp   $D0
4AAF: 20 2A       jr   nz,$4ADB
4AB1: FD 7E 01    ld   a,(iy+$01)
4AB4: DD 96 01    sub  (ix+$01)
4AB7: 38 10       jr   c,$4AC9
4AB9: FE 02       cp   $02
4ABB: 30 0C       jr   nc,$4AC9
4ABD: FD 7E 03    ld   a,(iy+$03)
4AC0: DD 96 03    sub  (ix+$03)
4AC3: 38 04       jr   c,$4AC9
4AC5: FE 02       cp   $02
4AC7: 38 A7       jr   c,$4A70
4AC9: 01 0F 0F    ld   bc,$0F0F
4ACC: CD D7 05    call $05D7
4ACF: 30 06       jr   nc,$4AD7
4AD1: FD E1       pop  iy
4AD3: CD 3F 49    call $493F
4AD6: C9          ret
4AD7: FD 36 00 88 ld   (iy+$00),$88
4ADB: FD E1       pop  iy
4ADD: 18 09       jr   $4AE8
4ADF: DD 34 0B    inc  (ix+$0b)
4AE2: DD 7E 0B    ld   a,(ix+$0b)
4AE5: FE 40       cp   $40
4AE7: D8          ret  c
4AE8: DD CB 07 AE res  5,(ix+$07)
4AEC: DD CB 07 BE res  7,(ix+$07)
4AF0: DD 7E 0C    ld   a,(ix+$0c)
4AF3: CB 7F       bit  7,a
4AF5: C8          ret  z
4AF6: E6 03       and  $03
4AF8: 47          ld   b,a
4AF9: DD 7E 00    ld   a,(ix+$00)
4AFC: E6 FC       and  $FC
4AFE: B0          or   b
4AFF: DD 77 00    ld   (ix+$00),a
4B02: C9          ret
4B03: 3E 0C       ld   a,$0C
4B05: DD 96 09    sub  (ix+$09)
4B08: 4F          ld   c,a
4B09: 87          add  a,a
4B0A: 87          add  a,a
4B0B: 87          add  a,a
4B0C: 91          sub  c
4B0D: 5F          ld   e,a
4B0E: 16 00       ld   d,$00
4B10: 21 31 00    ld   hl,$0031
4B13: 19          add  hl,de
4B14: EB          ex   de,hl
4B15: FD 19       add  iy,de
4B17: C9          ret

4B18: DD CB 00 76 bit  6,(ix+$00)
4B1C: 20 1C       jr   nz,$4B3A
4B1E: DD CB 00 F6 set  6,(ix+$00)
4B22: DD 36 06 00 ld   (ix+$06),$00
4B26: DD 36 07 00 ld   (ix+$07),$00
4B2A: DD 36 08 00 ld   (ix+$08),$00
4B2E: DD 36 09 00 ld   (ix+$09),$00
4B32: DD 36 0A 00 ld   (ix+$0a),$00
4B36: DD 36 0B 00 ld   (ix+$0b),$00
4B3A: DD 7E 00    ld   a,(ix+$00)
4B3D: CB 57       bit  2,a
4B3F: C2 47 4D    jp   nz,$4D47
4B42: CB 5F       bit  3,a
4B44: C2 F8 4C    jp   nz,$4CF8
4B47: CB 6F       bit  5,a
4B49: C2 4C 4D    jp   nz,$4D4C
4B4C: E6 10       and  $10
4B4E: C2 D7 4C    jp   nz,$4CD7
4B51: DD CB 07 6E bit  5,(ix+$07)
4B55: C2 92 4C    jp   nz,$4C92
4B58: 3A 00 E0    ld   a,($E000)
4B5B: E6 40       and  $40
4B5D: 20 05       jr   nz,$4B64
4B5F: DD 36 00 00 ld   (ix+$00),$00
4B63: C9          ret
4B64: 21 CB 4B    ld   hl,entry_4bcb		; [push_function]
4B67: E5          push hl
4B68: DD CB 07 56 bit  2,(ix+$07)
4B6C: C2 89 4C    jp   nz,$4C89
4B6F: 3A 01 E0    ld   a,($E001)
4B72: E6 40       and  $40
4B74: 20 05       jr   nz,$4B7B
4B76: DD CB 00 EE set  5,(ix+$00)
4B7A: C9          ret
4B7B: 3A B6 E1    ld   a,($E1B6)
4B7E: A7          and  a
4B7F: C0          ret  nz
4B80: 3A C5 E1    ld   a,($E1C5)
4B83: E6 98       and  $98
4B85: FE 80       cp   $80
4B87: C0          ret  nz
4B88: FD E5       push iy
4B8A: FD 21 C5 E1 ld   iy,$E1C5
4B8E: 01 07 07    ld   bc,$0707
4B91: CD D7 05    call $05D7
4B94: 30 0F       jr   nc,$4BA5
4B96: FD CB 00 DE set  3,(iy+$00)
4B9A: DD CB 07 D6 set  2,(ix+$07)
4B9E: DD 36 06 1E ld   (ix+$06),$1E
4BA2: FD E1       pop  iy
4BA4: C9          ret
4BA5: FD E1       pop  iy
4BA7: DD 7E 0D    ld   a,(ix+$0d)
4BAA: A7          and  a
4BAB: 28 14       jr   z,$4BC1
4BAD: DD 35 0D    dec  (ix+$0d)
4BB0: C0          ret  nz
4BB1: 21 C9 E2    ld   hl,$E2C9
4BB4: CB 66       bit  4,(hl)
4BB6: C0          ret  nz
4BB7: CB E6       set  4,(hl)
4BB9: 3E 11       ld   a,$11
4BBB: 06 00       ld   b,$00
4BBD: CD D9 02    call $02D9
4BC0: C9          ret
4BC1: DD 7E 05    ld   a,(ix+$05)
4BC4: A7          and  a
4BC5: C2 15 4C    jp   nz,$4C15
4BC8: C3 F4 4B    jp   $4BF4

entry_4bcb:
4BCB: DD 34 08    inc  (ix+$08)
4BCE: 06 27       ld   b,$27
4BD0: 0E 02       ld   c,$02
4BD2: DD 7E 00    ld   a,(ix+$00)
4BD5: CB 4F       bit  1,a
4BD7: 20 08       jr   nz,$4BE1
4BD9: E6 01       and  $01
4BDB: 28 0C       jr   z,$4BE9
4BDD: CB E9       set  5,c
4BDF: 18 08       jr   $4BE9
4BE1: 06 29       ld   b,$29
4BE3: E6 01       and  $01
4BE5: 28 02       jr   z,$4BE9
4BE7: CB E1       set  4,c
4BE9: DD CB 08 5E bit  3,(ix+$08)
4BED: 28 01       jr   z,$4BF0
4BEF: 04          inc  b
4BF0: CD 97 02    call $0297
4BF3: C9          ret
4BF4: DD 66 03    ld   h,(ix+$03)
4BF7: DD 6E 04    ld   l,(ix+$04)
4BFA: 11 2B FF    ld   de,$FF2B
4BFD: 19          add  hl,de
4BFE: DD 74 03    ld   (ix+$03),h
4C01: DD 75 04    ld   (ix+$04),l
4C04: 7C          ld   a,h
4C05: FE E1       cp   $E1
4C07: D0          ret  nc
4C08: DD 36 05 10 ld   (ix+$05),$10
4C0C: DD 7E 0C    ld   a,(ix+$0c)
4C0F: F6 C0       or   $C0
4C11: DD 77 00    ld   (ix+$00),a
4C14: C9          ret
4C15: CD F2 48    call $48F2
4C18: D8          ret  c
4C19: CD C1 3D    call $3DC1
4C1C: 20 16       jr   nz,$4C34
4C1E: DD CB 07 7E bit  7,(ix+$07)
4C22: 20 14       jr   nz,$4C38
4C24: CD D6 3D    call $3DD6
4C27: FE 04       cp   $04
4C29: 30 11       jr   nc,$4C3C
4C2B: DD 36 0E 00 ld   (ix+$0e),$00
4C2F: CD D7 3E    call $3ED7
4C32: 18 04       jr   $4C38
4C34: DD CB 07 BE res  7,(ix+$07)
4C38: CD 3F 49    call $493F
4C3B: C9          ret
4C3C: DD 7E 0E    ld   a,(ix+$0e)
4C3F: A7          and  a
4C40: 20 05       jr   nz,$4C47
4C42: DD 36 0E 1E ld   (ix+$0e),$1E
4C46: C9          ret
4C47: DD 35 0E    dec  (ix+$0e)
4C4A: C0          ret  nz
4C4B: 3A C6 E1    ld   a,($E1C6)
4C4E: DD 96 01    sub  (ix+$01)
4C51: FE 12       cp   $12
4C53: 38 03       jr   c,$4C58
4C55: FE EF       cp   $EF
4C57: D8          ret  c
4C58: 47          ld   b,a
4C59: 3A C8 E1    ld   a,($E1C8)
4C5C: DD 96 03    sub  (ix+$03)
4C5F: FE 12       cp   $12
4C61: 38 03       jr   c,$4C66
4C63: FE EF       cp   $EF
4C65: D8          ret  c
4C66: B8          cp   b
4C67: 38 10       jr   c,$4C79
4C69: E6 80       and  $80
4C6B: 20 06       jr   nz,$4C73
4C6D: 3E 02       ld   a,$02
4C6F: CD D7 3E    call $3ED7
4C72: C9          ret
4C73: 3E 03       ld   a,$03
4C75: CD D7 3E    call $3ED7
4C78: C9          ret
4C79: CB 78       bit  7,b
4C7B: 20 06       jr   nz,$4C83
4C7D: 3E 00       ld   a,$00
4C7F: CD D7 3E    call $3ED7
4C82: C9          ret
4C83: 3E 01       ld   a,$01
4C85: CD D7 3E    call $3ED7
4C88: C9          ret
4C89: DD 35 06    dec  (ix+$06)
4C8C: C0          ret  nz
4C8D: DD 36 00 00 ld   (ix+$00),$00
4C91: C9          ret
4C92: CD D3 49    call $49D3
4C95: DD 7E 0A    ld   a,(ix+$0a)
4C98: FE 20       cp   $20
4C9A: 30 1C       jr   nc,$4CB8
4C9C: 06 2B       ld   b,$2B
4C9E: 0E 04       ld   c,$04
4CA0: DD 7E 00    ld   a,(ix+$00)
4CA3: CB 4F       bit  1,a
4CA5: 20 08       jr   nz,$4CAF
4CA7: E6 01       and  $01
4CA9: 28 1E       jr   z,$4CC9
4CAB: CB E9       set  5,c
4CAD: 18 1A       jr   $4CC9
4CAF: 04          inc  b
4CB0: E6 01       and  $01
4CB2: 28 15       jr   z,$4CC9
4CB4: CB E1       set  4,c
4CB6: 18 11       jr   $4CC9
4CB8: 06 49       ld   b,$49
4CBA: 0E 04       ld   c,$04
4CBC: DD 7E 0B    ld   a,(ix+$0b)
4CBF: D6 08       sub  $08
4CC1: 38 06       jr   c,$4CC9
4CC3: 04          inc  b
4CC4: E6 08       and  $08
4CC6: 28 01       jr   z,$4CC9
4CC8: 04          inc  b
4CC9: CD 97 02    call $0297
4CCC: 3A 01 E0    ld   a,($E001)
4CCF: E6 40       and  $40
4CD1: C0          ret  nz
4CD2: DD CB 00 EE set  5,(ix+$00)
4CD6: C9          ret
4CD7: DD CB 07 4E bit  1,(ix+$07)
4CDB: 20 0E       jr   nz,$4CEB
4CDD: DD CB 07 CE set  1,(ix+$07)
4CE1: CD 8D 4D    call $4D8D
4CE4: CD AE 4D    call $4DAE
4CE7: DD 36 06 00 ld   (ix+$06),$00
4CEB: DD 35 06    dec  (ix+$06)
4CEE: 28 57       jr   z,$4D47
4CF0: 06 4C       ld   b,$4C
4CF2: 0E 02       ld   c,$02
4CF4: CD 97 02    call $0297
4CF7: C9          ret
4CF8: DD CB 07 46 bit  0,(ix+$07)
4CFC: 20 1E       jr   nz,$4D1C
4CFE: DD CB 07 C6 set  0,(ix+$07)
4D02: DD 36 06 FF ld   (ix+$06),$FF
4D06: CD 8D 4D    call $4D8D
4D09: 11 5A 3B    ld   de,$3B5A
4D0C: CD 2A 03    call $032A
4D0F: DD CB 07 6E bit  5,(ix+$07)
4D13: 28 07       jr   z,$4D1C
4D15: DD 7E 0A    ld   a,(ix+$0a)
4D18: FE 10       cp   $10
4D1A: 28 28       jr   z,$4D44
4D1C: DD 34 06    inc  (ix+$06)
4D1F: DD 7E 06    ld   a,(ix+$06)
4D22: FE 26       cp   $26
4D24: 30 21       jr   nc,$4D47
4D26: FE 08       cp   $08
4D28: 28 0F       jr   z,$4D39
4D2A: 30 10       jr   nc,$4D3C
4D2C: 06 67       ld   b,$67
4D2E: 0E 05       ld   c,$05
4D30: FE 04       cp   $04
4D32: 38 01       jr   c,$4D35
4D34: 04          inc  b
4D35: CD 97 02    call $0297
4D38: C9          ret
4D39: CD C6 4D    call $4DC6
4D3C: 06 71       ld   b,$71
4D3E: 0E 0A       ld   c,$0A
4D40: CD 97 02    call $0297
4D43: C9          ret
4D44: CD AE 4D    call $4DAE
4D47: DD 36 00 00 ld   (ix+$00),$00
4D4B: C9          ret
4D4C: DD CB 07 5E bit  3,(ix+$07)
4D50: 20 0B       jr   nz,$4D5D
4D52: DD CB 07 DE set  3,(ix+$07)
4D56: DD 36 06 FF ld   (ix+$06),$FF
4D5A: CD 8D 4D    call $4D8D
4D5D: DD 34 06    inc  (ix+$06)
4D60: DD 7E 06    ld   a,(ix+$06)
4D63: D6 20       sub  $20
4D65: DA CB 4B    jp   c,$4BCB
4D68: FE 20       cp   $20
4D6A: 30 0D       jr   nc,$4D79
4D6C: 06 67       ld   b,$67
4D6E: 0E 05       ld   c,$05
4D70: FE 10       cp   $10
4D72: 38 01       jr   c,$4D75
4D74: 04          inc  b
4D75: CD 97 02    call $0297
4D78: C9          ret
4D79: DD CB 07 6E bit  5,(ix+$07)
4D7D: 28 09       jr   z,$4D88
4D7F: DD 7E 0A    ld   a,(ix+$0a)
4D82: FE 10       cp   $10
4D84: 20 02       jr   nz,$4D88
4D86: 18 BC       jr   $4D44
4D88: CD C6 4D    call $4DC6
4D8B: 18 BA       jr   $4D47
4D8D: 21 D0 E2    ld   hl,$E2D0
4D90: 35          dec  (hl)
4D91: C0          ret  nz
4D92: 3E 11       ld   a,$11
4D94: CD EA 02    call $02EA
4D97: 21 00 E0    ld   hl,$E000
4D9A: CB 76       bit  6,(hl)
4D9C: C8          ret  z
4D9D: 23          inc  hl
4D9E: CB 76       bit  6,(hl)
4DA0: C8          ret  z
4DA1: CB B6       res  6,(hl)
4DA3: CB EE       set  5,(hl)
4DA5: 3E 40       ld   a,$40
4DA7: 32 05 E0    ld   ($E005),a
4DAA: CD A1 06    call $06A1
4DAD: C9          ret
4DAE: DD CB 07 6E bit  5,(ix+$07)
4DB2: C8          ret  z
4DB3: FD E5       push iy
4DB5: CD 03 4B    call $4B03
4DB8: FD 7E 00    ld   a,(iy+$00)
4DBB: FE D0       cp   $D0
4DBD: 20 04       jr   nz,$4DC3
4DBF: FD 36 00 88 ld   (iy+$00),$88
4DC3: FD E1       pop  iy
4DC5: C9          ret
4DC6: FD E5       push iy
4DC8: 11 31 00    ld   de,$0031
4DCB: FD 19       add  iy,de
4DCD: 11 07 00    ld   de,$0007
4DD0: 06 0C       ld   b,$0C
4DD2: FD 7E 00    ld   a,(iy+$00)
4DD5: A7          and  a
4DD6: 28 07       jr   z,$4DDF
4DD8: FD 19       add  iy,de
4DDA: 10 F6       djnz $4DD2
4DDC: FD E1       pop  iy
4DDE: C9          ret
4DDF: FD 36 00 88 ld   (iy+$00),$88
4DE3: DD 7E 01    ld   a,(ix+$01)
4DE6: FD 77 01    ld   (iy+$01),a
4DE9: FD 36 02 00 ld   (iy+$02),$00
4DED: DD 7E 03    ld   a,(ix+$03)
4DF0: FD 77 03    ld   (iy+$03),a
4DF3: FD 36 04 00 ld   (iy+$04),$00
4DF7: FD 36 05 00 ld   (iy+$05),$00
4DFB: FD 36 06 00 ld   (iy+$06),$00
4DFF: FD E1       pop  iy
4E01: C9          ret

4E02: 3A 00 E0    ld   a,($E000)
4E05: E6 40       and  $40
4E07: 20 04       jr   nz,$4E0D
4E09: DD 36 00 00 ld   (ix+$00),$00
4E0D: FD E5       push iy
4E0F: DD E1       pop  ix
4E11: 11 31 00    ld   de,$0031
4E14: DD 19       add  ix,de
4E16: 11 07 00    ld   de,$0007
4E19: 06 0C       ld   b,$0C
4E1B: DD CB 00 7E bit  7,(ix+$00)
4E1F: 28 07       jr   z,$4E28
4E21: C5          push bc
4E22: D5          push de
4E23: CD 2D 4E    call $4E2D
4E26: D1          pop  de
4E27: C1          pop  bc
4E28: DD 19       add  ix,de
4E2A: 10 EF       djnz $4E1B
4E2C: C9          ret
4E2D: 21 44 4E    ld   hl,entry_4e44		; [push_function]
4E30: E5          push hl
4E31: DD 7E 00    ld   a,(ix+$00)
4E34: E6 78       and  $78
4E36: 0F          rrca
4E37: 0F          rrca
4E38: 5F          ld   e,a
4E39: 16 00       ld   d,$00
4E3B: 21 4C 4E    ld   hl,jump_table_4E4C
4E3E: 19          add  hl,de
4E3F: 5E          ld   e,(hl)
4E40: 23          inc  hl
4E41: 56          ld   d,(hl)
4E42: EB          ex   de,hl
4E43: E9          jp   (hl)		; [indirect_jump]

entry_4e44:
4E44: 06 5E       ld   b,$5E
4E46: 0E 05       ld   c,$05
4E48: CD 97 02    call $0297
4E4B: C9          ret

jump_table_4E4C:
	.word	$4E62  
	.word	$4E63  
	.word	$4E98 
	.word	$4E98 
	.word	$4EB6  
	.word	$4F08  
	.word	$4F68  
	.word	$5010  
	.word	$503D  
	.word	$5085 
	.word	$50FA 


4E63: 3A C5 E1    ld   a,($E1C5)
4E66: 87          add  a,a
4E67: 30 1A       jr   nc,$4E83
4E69: 3A C8 E1    ld   a,($E1C8)
4E6C: DD 96 03    sub  (ix+$03)
4E6F: FE ED       cp   $ED
4E71: 38 10       jr   c,$4E83
4E73: FE F4       cp   $F4
4E75: 30 0C       jr   nc,$4E83
4E77: 3A C6 E1    ld   a,($E1C6)
4E7A: DD 96 01    sub  (ix+$01)
4E7D: FE 09       cp   $09
4E7F: D8          ret  c
4E80: FE F8       cp   $F8
4E82: D0          ret  nc
4E83: CD A9 53    call $53A9
4E86: DD 7E 00    ld   a,(ix+$00)
4E89: FE 88       cp   $88
4E8B: D8          ret  c
4E8C: DD 77 05    ld   (ix+$05),a
4E8F: DD 36 00 A0 ld   (ix+$00),$A0
4E93: DD 36 06 0A ld   (ix+$06),$0A
4E97: C9          ret
4E98: DD 46 00    ld   b,(ix+$00)
4E9B: C5          push bc
4E9C: CD A9 53    call $53A9
4E9F: C1          pop  bc
4EA0: DD 7E 00    ld   a,(ix+$00)
4EA3: FE 80       cp   $80
4EA5: 20 08       jr   nz,$4EAF
4EA7: 78          ld   a,b
4EA8: FE 98       cp   $98
4EAA: C0          ret  nz
4EAB: DD 77 00    ld   (ix+$00),a
4EAE: C9          ret
4EAF: FE B0       cp   $B0
4EB1: 20 43       jr   nz,$4EF6
4EB3: C3 52 4F    jp   $4F52
4EB6: 21 00 E3    ld   hl,$E300
4EB9: CB FE       set  7,(hl)
4EBB: DD 35 06    dec  (ix+$06)
4EBE: 20 17       jr   nz,$4ED7
4EC0: DD 34 00    inc  (ix+$00)
4EC3: DD 7E 00    ld   a,(ix+$00)
4EC6: E6 07       and  $07
4EC8: FE 04       cp   $04
4ECA: 28 20       jr   z,$4EEC
4ECC: DD 36 06 05 ld   (ix+$06),$05
4ED0: 0F          rrca
4ED1: 38 04       jr   c,$4ED7
4ED3: DD 36 06 0A ld   (ix+$06),$0A
4ED7: DD 7E 00    ld   a,(ix+$00)
4EDA: E6 03       and  $03
4EDC: CB 47       bit  0,a
4EDE: 28 02       jr   z,$4EE2
4EE0: E6 01       and  $01
4EE2: C6 5D       add  a,$5D
4EE4: 47          ld   b,a
4EE5: 0E 05       ld   c,$05
4EE7: CD 97 02    call $0297
4EEA: E1          pop  hl
4EEB: C9          ret
4EEC: DD 7E 05    ld   a,(ix+$05)
4EEF: FE B0       cp   $B0
4EF1: 28 5F       jr   z,$4F52
4EF3: DD 77 00    ld   (ix+$00),a
4EF6: DD 36 05 00 ld   (ix+$05),$00
4EFA: 1F          rra
4EFB: DD 7E 01    ld   a,(ix+$01)
4EFE: 38 02       jr   c,$4F02
4F00: C6 08       add  a,$08
4F02: E6 F8       and  $F8
4F04: DD 77 06    ld   (ix+$06),a
4F07: C9          ret
4F08: 21 00 E3    ld   hl,$E300
4F0B: CB FE       set  7,(hl)
4F0D: DD 7E 01    ld   a,(ix+$01)
4F10: DD BE 06    cp   (ix+$06)
4F13: 28 3A       jr   z,$4F4F
4F15: DD 56 03    ld   d,(ix+$03)
4F18: DD 5E 04    ld   e,(ix+$04)
4F1B: 21 95 FF    ld   hl,$FF95
4F1E: 19          add  hl,de
4F1F: DD 74 03    ld   (ix+$03),h
4F22: DD 75 04    ld   (ix+$04),l
4F25: DD 56 01    ld   d,(ix+$01)
4F28: DD 5E 02    ld   e,(ix+$02)
4F2B: 21 B9 00    ld   hl,$00B9
4F2E: DD CB 00 46 bit  0,(ix+$00)
4F32: 28 03       jr   z,$4F37
4F34: 21 47 FF    ld   hl,$FF47
4F37: 19          add  hl,de
4F38: DD 74 01    ld   (ix+$01),h
4F3B: DD 75 02    ld   (ix+$02),l
4F3E: 06 5D       ld   b,$5D
4F40: 0E 05       ld   c,$05
4F42: DD CB 00 46 bit  0,(ix+$00)
4F46: 28 02       jr   z,$4F4A
4F48: 06 5F       ld   b,$5F
4F4A: CD 97 02    call $0297
4F4D: E1          pop  hl
4F4E: C9          ret
4F4F: CD EF 51    call $51EF
4F52: DD 36 00 B0 ld   (ix+$00),$B0
4F56: DD 36 05 00 ld   (ix+$05),$00
4F5A: DD 7E 03    ld   a,(ix+$03)
4F5D: DD 77 06    ld   (ix+$06),a
4F60: 3E 12       ld   a,$12
4F62: 06 00       ld   b,$00
4F64: CD D9 02    call $02D9
4F67: C9          ret
4F68: 21 00 E3    ld   hl,$E300
4F6B: CB FE       set  7,(hl)
4F6D: FD E5       push iy
4F6F: 11 31 00    ld   de,$0031
4F72: FD 19       add  iy,de
4F74: 11 07 00    ld   de,$0007
4F77: 06 0C       ld   b,$0C
4F79: D9          exx
4F7A: 01 0E 0E    ld   bc,$0E0E
4F7D: D9          exx
4F7E: FD 7E 00    ld   a,(iy+$00)
4F81: FE 80       cp   $80
4F83: 38 2B       jr   c,$4FB0
4F85: FE D0       cp   $D0
4F87: 28 04       jr   z,$4F8D
4F89: FE B0       cp   $B0
4F8B: 30 23       jr   nc,$4FB0
4F8D: D9          exx
4F8E: CD D7 05    call $05D7
4F91: D9          exx
4F92: 30 1C       jr   nc,$4FB0
4F94: FD 36 00 C0 ld   (iy+$00),$C0
4F98: FD E1       pop  iy
4F9A: 3E 12       ld   a,$12
4F9C: CD EA 02    call $02EA
4F9F: DD 7E 05    ld   a,(ix+$05)
4FA2: E6 3F       and  $3F
4FA4: 20 05       jr   nz,$4FAB
4FA6: DD 36 00 C0 ld   (ix+$00),$C0
4FAA: C9          ret
4FAB: DD 36 00 B8 ld   (ix+$00),$B8
4FAF: C9          ret
4FB0: FD 19       add  iy,de
4FB2: 10 CA       djnz $4F7E
4FB4: FD E1       pop  iy
4FB6: CD A9 53    call $53A9
4FB9: DD 7E 00    ld   a,(ix+$00)
4FBC: FE B0       cp   $B0
4FBE: 20 1E       jr   nz,$4FDE
4FC0: DD 7E 03    ld   a,(ix+$03)
4FC3: FE 21       cp   $21
4FC5: 38 17       jr   c,$4FDE
4FC7: CD DF 51    call $51DF
4FCA: CD BE 52    call $52BE
4FCD: DD 56 03    ld   d,(ix+$03)
4FD0: DD 5E 04    ld   e,(ix+$04)
4FD3: 21 AB FE    ld   hl,$FEAB
4FD6: 19          add  hl,de
4FD7: DD 74 03    ld   (ix+$03),h
4FDA: DD 75 04    ld   (ix+$04),l
4FDD: C9          ret
4FDE: DD 7E 03    ld   a,(ix+$03)
4FE1: 3C          inc  a
4FE2: E6 F8       and  $F8
4FE4: DD 77 03    ld   (ix+$03),a
4FE7: DD CB 05 BE res  7,(ix+$05)
4FEB: 3E 12       ld   a,$12
4FED: CD EA 02    call $02EA
4FF0: DD 7E 05    ld   a,(ix+$05)
4FF3: E6 3F       and  $3F
4FF5: 20 B4       jr   nz,$4FAB
4FF7: DD 7E 06    ld   a,(ix+$06)
4FFA: DD 46 03    ld   b,(ix+$03)
4FFD: 90          sub  b
4FFE: FE 11       cp   $11
5000: 30 A4       jr   nc,$4FA6
5002: 78          ld   a,b
5003: FE 21       cp   $21
5005: 38 9F       jr   c,$4FA6
5007: DD 7E 00    ld   a,(ix+$00)
500A: FE 80       cp   $80
500C: C2 F6 4E    jp   nz,$4EF6
500F: C9          ret
5010: 21 00 E3    ld   hl,$E300
5013: CB FE       set  7,(hl)
5015: DD 7E 00    ld   a,(ix+$00)
5018: E6 07       and  $07
501A: 20 15       jr   nz,$5031
501C: DD 34 00    inc  (ix+$00)
501F: DD 36 06 1E ld   (ix+$06),$1E
5023: DD 7E 05    ld   a,(ix+$05)
5026: E6 2F       and  $2F
5028: 28 07       jr   z,$5031
502A: 3E 1A       ld   a,$1A
502C: 06 00       ld   b,$00
502E: CD D9 02    call $02D9
5031: DD 35 06    dec  (ix+$06)
5034: C0          ret  nz
5035: DD 36 00 C8 ld   (ix+$00),$C8
5039: CD 2A 51    call $512A
503C: C9          ret
503D: 21 00 E3    ld   hl,$E300
5040: CB FE       set  7,(hl)
5042: DD 7E 00    ld   a,(ix+$00)
5045: E6 07       and  $07
5047: 20 0E       jr   nz,$5057
5049: DD 34 00    inc  (ix+$00)
504C: DD 36 06 00 ld   (ix+$06),$00
5050: 3E 13       ld   a,$13
5052: 06 00       ld   b,$00
5054: CD D9 02    call $02D9
5057: DD 34 06    inc  (ix+$06)
505A: DD 7E 06    ld   a,(ix+$06)
505D: E6 18       and  $18
505F: FE 18       cp   $18
5061: CA C4 50    jp   z,$50C4
5064: 0F          rrca
5065: 0F          rrca
5066: C6 60       add  a,$60
5068: 47          ld   b,a
5069: 0E 05       ld   c,$05
506B: DD 7E 01    ld   a,(ix+$01)
506E: D6 08       sub  $08
5070: 57          ld   d,a
5071: DD 5E 03    ld   e,(ix+$03)
5074: C5          push bc
5075: D5          push de
5076: CD 9D 02    call $029D
5079: D1          pop  de
507A: C1          pop  bc
507B: 04          inc  b
507C: 7A          ld   a,d
507D: C6 10       add  a,$10
507F: 57          ld   d,a
5080: CD 9D 02    call $029D
5083: E1          pop  hl
5084: C9          ret
5085: 21 00 E3    ld   hl,$E300
5088: CB FE       set  7,(hl)
508A: DD 7E 00    ld   a,(ix+$00)
508D: E6 07       and  $07
508F: 20 1C       jr   nz,$50AD
5091: DD 34 00    inc  (ix+$00)
5094: DD 36 06 1E ld   (ix+$06),$1E
5098: DD 7E 05    ld   a,(ix+$05)
509B: E6 0F       and  $0F
509D: 28 18       jr   z,$50B7
509F: CD 91 51    call $5191
50A2: DD CB 05 66 bit  4,(ix+$05)
50A6: 28 05       jr   z,$50AD
50A8: 21 C5 E1    ld   hl,$E1C5
50AB: CB BE       res  7,(hl)
50AD: DD 35 06    dec  (ix+$06)
50B0: 28 05       jr   z,$50B7
50B2: CD B5 51    call $51B5
50B5: E1          pop  hl
50B6: C9          ret
50B7: DD CB 05 66 bit  4,(ix+$05)
50BB: 28 07       jr   z,$50C4
50BD: C3 C0 59    jp   $59C0
50C0: CB FE       set  7,(hl)
50C2: CB DE       set  3,(hl)
50C4: DD 36 00 00 ld   (ix+$00),$00
50C8: E1          pop  hl
50C9: 3A 00 E0    ld   a,($E000)
50CC: 87          add  a,a
50CD: D0          ret  nc
50CE: 3A 09 E3    ld   a,($E309)
50D1: A7          and  a
50D2: C0          ret  nz
50D3: CD F4 02    call $02F4
50D6: 3A 02 A0    ld   a,(dsw_1_a002)
50D9: E6 08       and  $08
50DB: 28 07       jr   z,$50E4
50DD: 7D          ld   a,l
50DE: E6 80       and  $80
50E0: B4          or   h
50E1: C0          ret  nz
50E2: 18 05       jr   $50E9
50E4: 7D          ld   a,l
50E5: E6 E0       and  $E0
50E7: B4          or   h
50E8: C0          ret  nz
50E9: 21 09 E3    ld   hl,$E309
50EC: 36 80       ld   (hl),$80
50EE: 23          inc  hl
50EF: EB          ex   de,hl
50F0: DD E5       push ix
50F2: E1          pop  hl
50F3: 23          inc  hl
50F4: 01 04 00    ld   bc,$0004
50F7: ED B0       ldir
50F9: C9          ret

50FA: 21 00 E3    ld   hl,$E300
50FD: CB FE       set  7,(hl)
50FF: DD 7E 06    ld   a,(ix+$06)
5102: A7          and  a
5103: 20 1A       jr   nz,$511F
5105: DD 34 06    inc  (ix+$06)
5108: CD 2A 51    call $512A
510B: DD CB 05 66 bit  4,(ix+$05)
510F: 28 05       jr   z,$5116
5111: 21 C5 E1    ld   hl,$E1C5
5114: CB DE       set  3,(hl)
5116: CD 91 51    call $5191
5119: 3E 12       ld   a,$12
511B: CD EA 02    call $02EA
511E: C9          ret
511F: DD 7E 05    ld   a,(ix+$05)
5122: E6 0F       and  $0F
5124: C8          ret  z
5125: CD B5 51    call $51B5
5128: E1          pop  hl
5129: C9          ret
512A: DD 7E 05    ld   a,(ix+$05)
512D: E6 0F       and  $0F
512F: C8          ret  z
5130: DD CB 05 6E bit  5,(ix+$05)
5134: 28 07       jr   z,$513D
5136: 21 C2 E2    ld   hl,$E2C2
5139: CB D6       set  2,(hl)
513B: 3D          dec  a
513C: C8          ret  z
513D: 4F          ld   c,a
513E: FD E5       push iy
5140: FD 21 1A E2 ld   iy,$E21A
5144: 11 15 00    ld   de,$0015
5147: 06 08       ld   b,$08
5149: FD 7E 00    ld   a,(iy+$00)
514C: E6 9C       and  $9C
514E: FE 90       cp   $90
5150: 20 11       jr   nz,$5163
5152: C5          push bc
5153: 01 FF 0E    ld   bc,$0EFF
5156: CD D7 05    call $05D7
5159: C1          pop  bc
515A: 30 07       jr   nc,$5163
515C: FD CB 00 D6 set  2,(iy+$00)
5160: 0D          dec  c
5161: 28 2B       jr   z,$518E
5163: FD 19       add  iy,de
5165: 10 E2       djnz $5149
5167: FD 21 D3 E2 ld   iy,$E2D3
516B: 11 0F 00    ld   de,$000F
516E: 06 03       ld   b,$03
5170: FD 7E 00    ld   a,(iy+$00)
5173: E6 BC       and  $BC
5175: FE 90       cp   $90
5177: 20 11       jr   nz,$518A
5179: C5          push bc
517A: 01 FF 0E    ld   bc,$0EFF
517D: CD D7 05    call $05D7
5180: C1          pop  bc
5181: 30 07       jr   nc,$518A
5183: FD CB 00 D6 set  2,(iy+$00)
5187: 0D          dec  c
5188: 28 04       jr   z,$518E
518A: FD 19       add  iy,de
518C: 10 E2       djnz $5170
518E: FD E1       pop  iy
5190: C9          ret
5191: DD 7E 05    ld   a,(ix+$05)
5194: E6 0F       and  $0F
5196: C8          ret  z
5197: FE 06       cp   $06
5199: 38 02       jr   c,$519D
519B: 3E 05       ld   a,$05
519D: 3D          dec  a
519E: 5F          ld   e,a
519F: 16 00       ld   d,$00
51A1: 21 26 54    ld   hl,$5426
51A4: 19          add  hl,de
51A5: 7E          ld   a,(hl)
51A6: 21 7D E0    ld   hl,$E07D
51A9: 36 00       ld   (hl),$00
51AB: 23          inc  hl
51AC: 77          ld   (hl),a
51AD: 23          inc  hl
51AE: 36 00       ld   (hl),$00
51B0: EB          ex   de,hl
51B1: CD 2A 03    call $032A
51B4: C9          ret
51B5: DD 7E 05    ld   a,(ix+$05)
51B8: E6 0F       and  $0F
51BA: FE 06       cp   $06
51BC: 38 02       jr   c,$51C0
51BE: 3E 05       ld   a,$05
51C0: C6 72       add  a,$72
51C2: 47          ld   b,a
51C3: 0E 0A       ld   c,$0A
51C5: DD 7E 01    ld   a,(ix+$01)
51C8: D6 08       sub  $08
51CA: 57          ld   d,a
51CB: DD 5E 03    ld   e,(ix+$03)
51CE: D5          push de
51CF: CD 9D 02    call $029D
51D2: D1          pop  de
51D3: 7A          ld   a,d
51D4: C6 10       add  a,$10
51D6: 57          ld   d,a
51D7: 06 72       ld   b,$72
51D9: 0E 0A       ld   c,$0A
51DB: CD 9D 02    call $029D
51DE: C9          ret
51DF: DD 7E 03    ld   a,(ix+$03)
51E2: E6 07       and  $07
51E4: 28 09       jr   z,$51EF
51E6: FE 07       cp   $07
51E8: 28 05       jr   z,$51EF
51EA: DD CB 05 BE res  7,(ix+$05)
51EE: C9          ret
51EF: DD CB 05 7E bit  7,(ix+$05)
51F3: C0          ret  nz
51F4: DD CB 05 FE set  7,(ix+$05)
51F8: DD 7E 01    ld   a,(ix+$01)
51FB: C6 04       add  a,$04
51FD: E6 F8       and  $F8
51FF: 57          ld   d,a
5200: DD 7E 03    ld   a,(ix+$03)
5203: C6 07       add  a,$07
5205: 5F          ld   e,a
5206: CD 0B 54    call $540B
5209: D8          ret  c
520A: 2B          dec  hl
520B: CD 0E 54    call $540E
520E: D8          ret  c
520F: 11 E1 FF    ld   de,$FFE1
5212: 19          add  hl,de
5213: CD 0E 54    call $540E
5216: D8          ret  c
5217: 2B          dec  hl
5218: CD 0E 54    call $540E
521B: D8          ret  c
521C: 06 05       ld   b,$05
521E: CD 87 1B    call $1B87
5221: 79          ld   a,c
5222: 32 01 E3    ld   ($E301),a
5225: CD 87 1B    call $1B87
5228: 79          ld   a,c
5229: 32 02 E3    ld   ($E302),a
522C: 2B          dec  hl
522D: CD 71 1B    call $1B71
5230: 79          ld   a,c
5231: 32 03 E3    ld   ($E303),a
5234: CD 71 1B    call $1B71
5237: 79          ld   a,c
5238: 32 04 E3    ld   ($E304),a
523B: 11 20 00    ld   de,$0020
523E: 19          add  hl,de
523F: 05          dec  b
5240: CD 71 1B    call $1B71
5243: 79          ld   a,c
5244: 32 05 E3    ld   ($E305),a
5247: CD 71 1B    call $1B71
524A: 79          ld   a,c
524B: 32 06 E3    ld   ($E306),a
524E: 23          inc  hl
524F: CD 87 1B    call $1B87
5252: 79          ld   a,c
5253: 32 07 E3    ld   ($E307),a
5256: CD 87 1B    call $1B87
5259: 79          ld   a,c
525A: 32 08 E3    ld   ($E308),a
525D: 21 01 E3    ld   hl,$E301
5260: 06 08       ld   b,$08
5262: 3E DB       ld   a,$DB
5264: CD EC 39    call $39EC
5267: DD 7E 01    ld   a,(ix+$01)
526A: C6 04       add  a,$04
526C: E6 F8       and  $F8
526E: 57          ld   d,a
526F: E6 08       and  $08
5271: C8          ret  z
5272: DD 7E 03    ld   a,(ix+$03)
5275: 3C          inc  a
5276: E6 F8       and  $F8
5278: 5F          ld   e,a
5279: E6 08       and  $08
527B: C0          ret  nz
527C: DD 7E 05    ld   a,(ix+$05)
527F: DD CB 05 F6 set  6,(ix+$05)
5283: E6 40       and  $40
5285: C8          ret  z
5286: D5          push de
5287: 21 01 E0    ld   hl,$E001
528A: CB C6       set  0,(hl)
528C: CD C0 1D    call $1DC0
528F: CD 15 1F    call $1F15
5292: D1          pop  de
5293: 7E          ld   a,(hl)
5294: E6 07       and  $07
5296: C0          ret  nz
5297: 44          ld   b,h
5298: 4D          ld   c,l
5299: 1D          dec  e
529A: CD 89 1D    call $1D89
529D: EB          ex   de,hl
529E: 60          ld   h,b
529F: 69          ld   l,c
52A0: 1A          ld   a,(de)
52A1: FE 8A       cp   $8A
52A3: 28 04       jr   z,$52A9
52A5: FE 76       cp   $76
52A7: 20 03       jr   nz,$52AC
52A9: CD 27 1F    call $1F27
52AC: EB          ex   de,hl
52AD: 01 E0 FF    ld   bc,$FFE0
52B0: 09          add  hl,bc
52B1: EB          ex   de,hl
52B2: 1A          ld   a,(de)
52B3: FE 8A       cp   $8A
52B5: 28 03       jr   z,$52BA
52B7: FE 76       cp   $76
52B9: C0          ret  nz
52BA: CD 33 1F    call $1F33
52BD: C9          ret
52BE: FD E5       push iy
52C0: FD 21 1A E2 ld   iy,$E21A
52C4: 11 15 00    ld   de,$0015
52C7: 06 08       ld   b,$08
52C9: D9          exx
52CA: 01 08 0E    ld   bc,$0E08
52CD: D9          exx
52CE: FD 7E 00    ld   a,(iy+$00)
52D1: E6 9C       and  $9C
52D3: FE 90       cp   $90
52D5: 28 04       jr   z,$52DB
52D7: FE 80       cp   $80
52D9: 20 1E       jr   nz,$52F9
52DB: D9          exx
52DC: CD D7 05    call $05D7
52DF: D9          exx
52E0: 30 17       jr   nc,$52F9
52E2: FD 7E 00    ld   a,(iy+$00)
52E5: E6 9C       and  $9C
52E7: FE 90       cp   $90
52E9: 28 09       jr   z,$52F4
52EB: FD CB 00 E6 set  4,(iy+$00)
52EF: DD 34 05    inc  (ix+$05)
52F2: 18 05       jr   $52F9
52F4: D9          exx
52F5: CD 98 53    call $5398
52F8: D9          exx
52F9: FD 19       add  iy,de
52FB: 10 D1       djnz $52CE
52FD: FD 21 C2 E2 ld   iy,$E2C2
5301: FD 7E 00    ld   a,(iy+$00)
5304: E6 B8       and  $B8
5306: 28 24       jr   z,$532C
5308: FE B0       cp   $B0
530A: 28 19       jr   z,$5325
530C: FE A0       cp   $A0
530E: 20 1C       jr   nz,$532C
5310: 01 08 0E    ld   bc,$0E08
5313: CD D7 05    call $05D7
5316: 30 14       jr   nc,$532C
5318: FD CB 00 E6 set  4,(iy+$00)
531C: DD 34 05    inc  (ix+$05)
531F: DD CB 05 EE set  5,(ix+$05)
5323: 18 07       jr   $532C
5325: DD CB 05 6E bit  5,(ix+$05)
5329: C4 98 53    call nz,$5398
532C: FD 21 C5 E1 ld   iy,$E1C5
5330: FD 7E 00    ld   a,(iy+$00)
5333: E6 98       and  $98
5335: 28 21       jr   z,$5358
5337: FE 90       cp   $90
5339: 28 16       jr   z,$5351
533B: FE 80       cp   $80
533D: 20 19       jr   nz,$5358
533F: 01 09 09    ld   bc,$0909
5342: CD D7 05    call $05D7
5345: 30 11       jr   nc,$5358
5347: FD CB 00 E6 set  4,(iy+$00)
534B: DD CB 05 E6 set  4,(ix+$05)
534F: 18 07       jr   $5358
5351: DD CB 05 66 bit  4,(ix+$05)
5355: C4 98 53    call nz,$5398
5358: FD 21 D3 E2 ld   iy,$E2D3
535C: 11 0F 00    ld   de,$000F
535F: 06 03       ld   b,$03
5361: D9          exx
5362: 01 08 0E    ld   bc,$0E08
5365: D9          exx
5366: FD 7E 00    ld   a,(iy+$00)
5369: E6 BC       and  $BC
536B: FE 90       cp   $90
536D: 28 04       jr   z,$5373
536F: FE 80       cp   $80
5371: 20 1E       jr   nz,$5391
5373: D9          exx
5374: CD D7 05    call $05D7
5377: D9          exx
5378: 30 17       jr   nc,$5391
537A: FD 7E 00    ld   a,(iy+$00)
537D: E6 BC       and  $BC
537F: FE 90       cp   $90
5381: 28 09       jr   z,$538C
5383: FD CB 00 E6 set  4,(iy+$00)
5387: DD 34 05    inc  (ix+$05)
538A: 18 05       jr   $5391
538C: D9          exx
538D: CD 98 53    call $5398
5390: D9          exx
5391: FD 19       add  iy,de
5393: 10 D1       djnz $5366
5395: FD E1       pop  iy
5397: C9          ret
5398: FD 56 03    ld   d,(iy+$03)
539B: FD 5E 04    ld   e,(iy+$04)
539E: 21 AB FE    ld   hl,$FEAB
53A1: 19          add  hl,de
53A2: FD 74 03    ld   (iy+$03),h
53A5: FD 75 04    ld   (iy+$04),l
53A8: C9          ret
53A9: DD 56 01    ld   d,(ix+$01)
53AC: DD 7E 03    ld   a,(ix+$03)
53AF: D6 09       sub  $09
53B1: 5F          ld   e,a
53B2: D5          push de
53B3: CD 0B 54    call $540B
53B6: D1          pop  de
53B7: 38 4D       jr   c,$5406
53B9: 7A          ld   a,d
53BA: C6 06       add  a,$06
53BC: 57          ld   d,a
53BD: D5          push de
53BE: CD 0B 54    call $540B
53C1: D1          pop  de
53C2: 38 29       jr   c,$53ED
53C4: 7A          ld   a,d
53C5: D6 0D       sub  $0D
53C7: 57          ld   d,a
53C8: D5          push de
53C9: CD 0B 54    call $540B
53CC: D1          pop  de
53CD: 38 05       jr   c,$53D4
53CF: DD 36 00 B0 ld   (ix+$00),$B0
53D3: C9          ret
53D4: 7A          ld   a,d
53D5: C6 0F       add  a,$0F
53D7: 57          ld   d,a
53D8: D5          push de
53D9: CD 0B 54    call $540B
53DC: D1          pop  de
53DD: 38 27       jr   c,$5406
53DF: 7B          ld   a,e
53E0: C6 08       add  a,$08
53E2: 5F          ld   e,a
53E3: CD 0B 54    call $540B
53E6: 38 1E       jr   c,$5406
53E8: DD 36 00 A8 ld   (ix+$00),$A8
53EC: C9          ret
53ED: 7A          ld   a,d
53EE: D6 0E       sub  $0E
53F0: 57          ld   d,a
53F1: D5          push de
53F2: CD 0B 54    call $540B
53F5: D1          pop  de
53F6: 38 0E       jr   c,$5406
53F8: 7B          ld   a,e
53F9: C6 08       add  a,$08
53FB: 5F          ld   e,a
53FC: CD 0B 54    call $540B
53FF: 38 05       jr   c,$5406
5401: DD 36 00 A9 ld   (ix+$00),$A9
5405: C9          ret
5406: DD 36 00 80 ld   (ix+$00),$80
540A: C9          ret
540B: CD 89 1D    call $1D89
540E: 7E          ld   a,(hl)
540F: FE 77       cp   $77
5411: 38 11       jr   c,$5424
5413: FE 7C       cp   $7C
5415: D8          ret  c
5416: FE 94       cp   $94
5418: 38 0A       jr   c,$5424
541A: FE A4       cp   $A4
541C: D8          ret  c
541D: FE DC       cp   $DC
541F: 38 03       jr   c,$5424
5421: FE E4       cp   $E4
5423: D8          ret  c
5424: A7          and  a
5425: C9          ret

542B: 3A 00 E0    ld   a,($E000)
542E: E6 40       and  $40
5430: CA BC 54    jp   z,$54BC
5433: DD CB 00 76 bit  6,(ix+$00)
5437: 20 19       jr   nz,$5452
5439: DD CB 00 F6 set  6,(ix+$00)
543D: DD 36 05 02 ld   (ix+$05),$02
5441: DD 36 06 58 ld   (ix+$06),$58
5445: DD 36 07 00 ld   (ix+$07),$00
5449: 3E 23       ld   a,$23
544B: 06 00       ld   b,$00
544D: CD D9 02    call $02D9
5450: 18 1D       jr   $546F
5452: DD CB 00 6E bit  5,(ix+$00)
5456: 20 6E       jr   nz,$54C6
5458: 3A B6 E1    ld   a,($E1B6)
545B: A7          and  a
545C: 20 49       jr   nz,$54A7
545E: DD 46 05    ld   b,(ix+$05)
5461: DD 4E 06    ld   c,(ix+$06)
5464: 0B          dec  bc
5465: 78          ld   a,b
5466: B1          or   c
5467: 28 53       jr   z,$54BC
5469: DD 70 05    ld   (ix+$05),b
546C: DD 71 06    ld   (ix+$06),c
546F: 3A C5 E1    ld   a,($E1C5)
5472: E6 98       and  $98
5474: FE 80       cp   $80
5476: 20 2F       jr   nz,$54A7
5478: FD E5       push iy
547A: FD 21 C5 E1 ld   iy,$E1C5
547E: 01 05 05    ld   bc,$0505
5481: CD D7 05    call $05D7
5484: FD E1       pop  iy
5486: 30 1F       jr   nc,$54A7
5488: DD CB 00 EE set  5,(ix+$00)
548C: DD 36 07 1E ld   (ix+$07),$1E
5490: 11 EB 54    ld   de,$54EB
5493: CD 2A 03    call $032A
5496: 3A 00 E0    ld   a,($E000)
5499: 87          add  a,a
549A: D0          ret  nc
549B: 21 B6 E1    ld   hl,$E1B6
549E: CB FE       set  7,(hl)
54A0: CB EE       set  5,(hl)
54A2: FD 36 30 03 ld   (iy+$30),$03
54A6: C9          ret
54A7: DD 34 07    inc  (ix+$07)
54AA: DD 7E 07    ld   a,(ix+$07)
54AD: E6 06       and  $06
54AF: 0F          rrca
54B0: FE 03       cp   $03
54B2: C8          ret  z
54B3: C6 69       add  a,$69
54B5: 47          ld   b,a
54B6: 0E 07       ld   c,$07
54B8: CD 97 02    call $0297
54BB: C9          ret
54BC: DD 36 00 00 ld   (ix+$00),$00
54C0: 3E 23       ld   a,$23
54C2: CD EA 02    call $02EA
54C5: C9          ret
54C6: DD 35 07    dec  (ix+$07)
54C9: 28 F1       jr   z,$54BC
54CB: DD 7E 01    ld   a,(ix+$01)
54CE: D6 08       sub  $08
54D0: 57          ld   d,a
54D1: DD 5E 03    ld   e,(ix+$03)
54D4: 06 77       ld   b,$77
54D6: 0E 0A       ld   c,$0A
54D8: C5          push bc
54D9: D5          push de
54DA: CD 9D 02    call $029D
54DD: D1          pop  de
54DE: C1          pop  bc
54DF: 7A          ld   a,d
54E0: C6 10       add  a,$10
54E2: 57          ld   d,a
54E3: 06 72       ld   b,$72
54E5: CD 9D 02    call $029D
54E8: C9          ret

54EC: 21 01 E0    ld   hl,$E001
54EF: CB CE       set  1,(hl)
54F1: CB 86       res  0,(hl)
54F3: 21 12 E4    ld   hl,$E412
54F6: 11 06 00    ld   de,$0006
54F9: 0E 0C       ld   c,$0C
54FB: 06 0D       ld   b,$0D
54FD: CB BE       res  7,(hl)
54FF: 23          inc  hl
5500: 23          inc  hl
5501: 10 FA       djnz $54FD
5503: 19          add  hl,de
5504: 0D          dec  c
5505: 20 F4       jr   nz,$54FB
5507: 21 00 00    ld   hl,$0000
550A: 22 D0 E5    ld   ($E5D0),hl
550D: 22 10 E6    ld   ($E610),hl
5510: DD 21 C5 E1 ld   ix,$E1C5
5514: CD A3 1D    call $1DA3
5517: 22 CE E5    ld   ($E5CE),hl
551A: CB FE       set  7,(hl)
551C: 23          inc  hl
551D: 36 00       ld   (hl),$00
551F: 3E 01       ld   a,$01
5521: 32 31 E4    ld   ($E431),a
5524: DD 21 CE E5 ld   ix,$E5CE
5528: FD 21 10 E6 ld   iy,$E610
552C: EB          ex   de,hl
552D: 1B          dec  de
552E: 1A          ld   a,(de)
552F: CB 5F       bit  3,a
5531: 28 09       jr   z,$553C
5533: 21 02 00    ld   hl,$0002
5536: 19          add  hl,de
5537: CB 7E       bit  7,(hl)
5539: CC 9C 56    call z,$569C
553C: CB 57       bit  2,a
553E: 28 09       jr   z,$5549
5540: 21 20 00    ld   hl,$0020
5543: 19          add  hl,de
5544: CB 7E       bit  7,(hl)
5546: CC 9C 56    call z,$569C
5549: CB 4F       bit  1,a
554B: 28 09       jr   z,$5556
554D: 21 FE FF    ld   hl,$FFFE
5550: 19          add  hl,de
5551: CB 7E       bit  7,(hl)
5553: CC 9C 56    call z,$569C
5556: CB 47       bit  0,a
5558: 28 09       jr   z,$5563
555A: 21 E0 FF    ld   hl,$FFE0
555D: 19          add  hl,de
555E: CB 7E       bit  7,(hl)
5560: CC 9C 56    call z,$569C
5563: DD 23       inc  ix
5565: DD 23       inc  ix
5567: DD 5E 00    ld   e,(ix+$00)
556A: DD 56 01    ld   d,(ix+$01)
556D: 7A          ld   a,d
556E: B3          or   e
556F: 20 BD       jr   nz,$552E
5571: 21 31 E4    ld   hl,$E431
5574: 34          inc  (hl)
5575: DD E5       push ix
5577: FD E5       push iy
5579: DD E1       pop  ix
557B: FD E1       pop  iy
557D: DD 5E 00    ld   e,(ix+$00)
5580: DD 56 01    ld   d,(ix+$01)
5583: 7A          ld   a,d
5584: B3          or   e
5585: 20 A7       jr   nz,$552E
5587: 21 01 E0    ld   hl,$E001
558A: CB 8E       res  1,(hl)
558C: CB E6       set  4,(hl)
558E: 21 01 E0    ld   hl,$E001
5591: CB DE       set  3,(hl)
5593: CB 96       res  2,(hl)
5595: 21 12 E4    ld   hl,$E412
5598: 11 06 00    ld   de,$0006
559B: 0E 0C       ld   c,$0C
559D: 06 0D       ld   b,$0D
559F: CB B6       res  6,(hl)
55A1: 23          inc  hl
55A2: 23          inc  hl
55A3: 10 FA       djnz $559F
55A5: 19          add  hl,de
55A6: 0D          dec  c
55A7: 20 F4       jr   nz,$559D
55A9: DD 21 C5 E1 ld   ix,$E1C5
55AD: CD A3 1D    call $1DA3
55B0: DD 7E 00    ld   a,(ix+$00)
55B3: E6 06       and  $06
55B5: 28 32       jr   z,$55E9
55B7: FE 02       cp   $02
55B9: 28 20       jr   z,$55DB
55BB: FE 04       cp   $04
55BD: 28 0E       jr   z,$55CD
55BF: DD 7E 03    ld   a,(ix+$03)
55C2: D6 18       sub  $18
55C4: E6 F0       and  $F0
55C6: 28 42       jr   z,$560A
55C8: 11 FE FF    ld   de,$FFFE
55CB: 18 28       jr   $55F5
55CD: 3E D8       ld   a,$D8
55CF: DD 96 03    sub  (ix+$03)
55D2: E6 F0       and  $F0
55D4: 28 34       jr   z,$560A
55D6: 11 02 00    ld   de,$0002
55D9: 18 1A       jr   $55F5
55DB: DD 7E 01    ld   a,(ix+$01)
55DE: D6 20       sub  $20
55E0: E6 F0       and  $F0
55E2: 28 26       jr   z,$560A
55E4: 11 E0 FF    ld   de,$FFE0
55E7: 18 0C       jr   $55F5
55E9: 3E E0       ld   a,$E0
55EB: DD 96 01    sub  (ix+$01)
55EE: E6 F0       and  $F0
55F0: 28 18       jr   z,$560A
55F2: 11 20 00    ld   de,$0020
55F5: 0F          rrca
55F6: 0F          rrca
55F7: 0F          rrca
55F8: 0F          rrca
55F9: 47          ld   b,a
55FA: E5          push hl
55FB: 19          add  hl,de
55FC: 7E          ld   a,(hl)
55FD: E6 0F       and  $0F
55FF: 20 05       jr   nz,$5606
5601: 10 F8       djnz $55FB
5603: E1          pop  hl
5604: 18 04       jr   $560A
5606: C1          pop  bc
5607: 18 01       jr   $560A
5609: 2B          dec  hl
560A: CB F6       set  6,(hl)
560C: 23          inc  hl
560D: 7E          ld   a,(hl)
560E: A7          and  a
560F: 28 30       jr   z,$5641
5611: 3D          dec  a
5612: 2B          dec  hl
5613: CB 5E       bit  3,(hl)
5615: 28 09       jr   z,$5620
5617: 23          inc  hl
5618: 23          inc  hl
5619: 23          inc  hl
561A: BE          cp   (hl)
561B: 28 EC       jr   z,$5609
561D: 2B          dec  hl
561E: 2B          dec  hl
561F: 2B          dec  hl
5620: CB 56       bit  2,(hl)
5622: 28 09       jr   z,$562D
5624: EB          ex   de,hl
5625: 21 21 00    ld   hl,$0021
5628: 19          add  hl,de
5629: BE          cp   (hl)
562A: 28 DD       jr   z,$5609
562C: EB          ex   de,hl
562D: CB 4E       bit  1,(hl)
562F: 28 05       jr   z,$5636
5631: 2B          dec  hl
5632: BE          cp   (hl)
5633: 28 D4       jr   z,$5609
5635: 23          inc  hl
5636: CB 46       bit  0,(hl)
5638: 28 07       jr   z,$5641
563A: 11 E1 FF    ld   de,$FFE1
563D: 19          add  hl,de
563E: BE          cp   (hl)
563F: 28 C8       jr   z,$5609
5641: 21 01 E0    ld   hl,$E001
5644: CB 9E       res  3,(hl)
5646: C9          ret
5647: 21 01 E0    ld   hl,$E001
564A: CB A6       res  4,(hl)
564C: 21 12 E4    ld   hl,$E412
564F: 11 06 00    ld   de,$0006
5652: 0E 0C       ld   c,$0C
5654: 06 0D       ld   b,$0D
5656: CB AE       res  5,(hl)
5658: 23          inc  hl
5659: 23          inc  hl
565A: 10 FA       djnz $5656
565C: 19          add  hl,de
565D: 0D          dec  c
565E: 20 F4       jr   nz,$5654
5660: 21 CA E4    ld   hl,$E4CA
5663: 18 01       jr   $5666
5665: 2B          dec  hl
5666: CB EE       set  5,(hl)
5668: 23          inc  hl
5669: 7E          ld   a,(hl)
566A: A7          and  a
566B: C8          ret  z
566C: 3D          dec  a
566D: 2B          dec  hl
566E: CB 5E       bit  3,(hl)
5670: 28 09       jr   z,$567B
5672: 23          inc  hl
5673: 23          inc  hl
5674: 23          inc  hl
5675: BE          cp   (hl)
5676: 28 ED       jr   z,$5665
5678: 2B          dec  hl
5679: 2B          dec  hl
567A: 2B          dec  hl
567B: CB 56       bit  2,(hl)
567D: 28 09       jr   z,$5688
567F: EB          ex   de,hl
5680: 21 21 00    ld   hl,$0021
5683: 19          add  hl,de
5684: BE          cp   (hl)
5685: 28 DE       jr   z,$5665
5687: EB          ex   de,hl
5688: CB 4E       bit  1,(hl)
568A: 28 05       jr   z,$5691
568C: 2B          dec  hl
568D: BE          cp   (hl)
568E: 28 D5       jr   z,$5665
5690: 23          inc  hl
5691: CB 46       bit  0,(hl)
5693: C8          ret  z
5694: 11 E1 FF    ld   de,$FFE1
5697: 19          add  hl,de
5698: BE          cp   (hl)
5699: 28 CA       jr   z,$5665
569B: C9          ret
569C: CB FE       set  7,(hl)
569E: FD 2B       dec  iy
56A0: FD 2B       dec  iy
56A2: FD 75 00    ld   (iy+$00),l
56A5: FD 74 01    ld   (iy+$01),h
56A8: 23          inc  hl
56A9: 3A 31 E4    ld   a,($E431)
56AC: 77          ld   (hl),a
56AD: 1A          ld   a,(de)
56AE: C9          ret
56AF: 0E 22       ld   c,$22
56B1: AF          xor  a
56B2: 11 04 00    ld   de,$0004
56B5: 21 01 90    ld   hl,$9001
56B8: 06 40       ld   b,$40
56BA: 77          ld   (hl),a
56BB: 19          add  hl,de
56BC: 10 FC       djnz $56BA
56BE: 0D          dec  c
56BF: 20 F4       jr   nz,$56B5
56C1: AF          xor  a
56C2: 32 00 F0    ld   ($F000),a
56C5: 32 00 F8    ld   ($F800),a
56C8: 3E 29       ld   a,$29
56CA: 08          ex   af,af'
56CB: 3E 09       ld   a,$09
56CD: 21 00 80    ld   hl,$8000
56D0: 0E 04       ld   c,$04
56D2: 06 04       ld   b,$04
56D4: 77          ld   (hl),a
56D5: 2C          inc  l
56D6: 20 FC       jr   nz,$56D4
56D8: 24          inc  h
56D9: 10 F9       djnz $56D4
56DB: 08          ex   af,af'
56DC: 0D          dec  c
56DD: 20 F3       jr   nz,$56D2
56DF: 3E 1B       ld   a,$1B
56E1: 32 90 8D    ld   ($8D90),a
56E4: 3E 18       ld   a,$18
56E6: 32 B0 8D    ld   ($8DB0),a
56E9: 3E 16       ld   a,$16
56EB: 32 D0 8D    ld   ($8DD0),a
56EE: 21 00 00    ld   hl,$0000
56F1: 11 00 00    ld   de,$0000
56F4: AF          xor  a
56F5: 06 20       ld   b,$20
56F7: 86          add  a,(hl)
56F8: 2C          inc  l
56F9: 20 FC       jr   nz,$56F7
56FB: 24          inc  h
56FC: 10 F9       djnz $56F7
56FE: BB          cp   e
56FF: 28 24       jr   z,$5725
5701: 16 FF       ld   d,$FF
5703: 47          ld   b,a
5704: E6 F0       and  $F0
5706: 0F          rrca
5707: 0F          rrca
5708: 0F          rrca
5709: 0F          rrca
570A: C6 00       add  a,$00
570C: 32 50 8E    ld   ($8E50),a
570F: 78          ld   a,b
5710: E6 0F       and  $0F
5712: C6 00       add  a,$00
5714: 32 70 8E    ld   ($8E70),a
5717: 7B          ld   a,e
5718: C6 01       add  a,$01
571A: 32 10 8E    ld   ($8E10),a
571D: 01 00 00    ld   bc,$0000
5720: 0B          dec  bc
5721: 78          ld   a,b
5722: B1          or   c
5723: 20 FB       jr   nz,$5720
5725: 1C          inc  e
5726: 7B          ld   a,e
5727: FE 04       cp   $04
5729: 38 C9       jr   c,$56F4
572B: CB 7A       bit  7,d
572D: C2 00 00    jp   nz,$0000
5730: 3E 18       ld   a,$18
5732: 32 30 8E    ld   ($8E30),a
5735: 3E 14       ld   a,$14
5737: 32 50 8E    ld   ($8E50),a
573A: 01 00 00    ld   bc,$0000
573D: 0B          dec  bc
573E: 78          ld   a,b
573F: B1          or   c
5740: 20 FB       jr   nz,$573D
5742: 3E 1B       ld   a,$1B
5744: 32 90 8D    ld   ($8D90),a
5747: 3E 0A       ld   a,$0A
5749: 32 B0 8D    ld   ($8DB0),a
574C: 3E 16       ld   a,$16
574E: 32 D0 8D    ld   ($8DD0),a
5751: 3E 29       ld   a,$29
5753: 32 30 8E    ld   ($8E30),a
5756: 32 50 8E    ld   ($8E50),a
5759: 06 00       ld   b,$00
575B: 78          ld   a,b
575C: D9          exx
575D: 67          ld   h,a
575E: 2E 00       ld   l,$00
5760: 11 00 E0    ld   de,$E000
5763: 01 00 10    ld   bc,$1000
5766: ED B0       ldir
5768: 11 00 80    ld   de,$8000
576B: 01 00 10    ld   bc,$1000
576E: ED B0       ldir
5770: D9          exx
5771: 78          ld   a,b
5772: D9          exx
5773: 57          ld   d,a
5774: 1E 00       ld   e,$00
5776: 21 00 E0    ld   hl,$E000
5779: 01 02 10    ld   bc,$1002
577C: 1A          ld   a,(de)
577D: BE          cp   (hl)
577E: 20 1C       jr   nz,$579C
5780: 13          inc  de
5781: 2C          inc  l
5782: 20 F8       jr   nz,$577C
5784: 24          inc  h
5785: 10 F5       djnz $577C
5787: 21 00 80    ld   hl,$8000
578A: 06 10       ld   b,$10
578C: 0D          dec  c
578D: 20 ED       jr   nz,$577C
578F: D9          exx
5790: 78          ld   a,b
5791: C6 01       add  a,$01
5793: 47          ld   b,a
5794: FE 61       cp   $61
5796: 38 C3       jr   c,$575B
5798: D9          exx
5799: 21 00 00    ld   hl,$0000
579C: D9          exx
579D: 3E 29       ld   a,$29
579F: 08          ex   af,af'
57A0: 3E 09       ld   a,$09
57A2: 21 00 80    ld   hl,$8000
57A5: 0E 04       ld   c,$04
57A7: 06 04       ld   b,$04
57A9: 77          ld   (hl),a
57AA: 2C          inc  l
57AB: 20 FC       jr   nz,$57A9
57AD: 24          inc  h
57AE: 10 F9       djnz $57A9
57B0: 08          ex   af,af'
57B1: 0D          dec  c
57B2: 20 F3       jr   nz,$57A7
57B4: 3E 1B       ld   a,$1B
57B6: 32 90 8D    ld   ($8D90),a
57B9: 3E 0A       ld   a,$0A
57BB: 32 B0 8D    ld   ($8DB0),a
57BE: 3E 16       ld   a,$16
57C0: 32 D0 8D    ld   ($8DD0),a
57C3: D9          exx
57C4: 7C          ld   a,h
57C5: B5          or   l
57C6: 20 0C       jr   nz,$57D4
57C8: 3E 18       ld   a,$18
57CA: 32 30 8E    ld   ($8E30),a
57CD: 3E 14       ld   a,$14
57CF: 32 50 8E    ld   ($8E50),a
57D2: 18 1E       jr   $57F2
57D4: 7C          ld   a,h
57D5: FE 88       cp   $88
57D7: 38 10       jr   c,$57E9
57D9: FE 90       cp   $90
57DB: 38 10       jr   c,$57ED
57DD: FE E8       cp   $E8
57DF: 30 04       jr   nc,$57E5
57E1: 3E 01       ld   a,$01
57E3: 18 0A       jr   $57EF
57E5: 3E 02       ld   a,$02
57E7: 18 06       jr   $57EF
57E9: 3E 03       ld   a,$03
57EB: 18 02       jr   $57EF
57ED: 3E 04       ld   a,$04
57EF: 32 30 8E    ld   ($8E30),a
57F2: 01 00 00    ld   bc,$0000
57F5: 0B          dec  bc
57F6: 78          ld   a,b
57F7: B1          or   c
57F8: 20 FB       jr   nz,$57F5
57FA: 7C          ld   a,h
57FB: B5          or   l
57FC: D9          exx
57FD: C2 00 00    jp   nz,$0000
5800: 31 80 EB    ld   sp,$EB80
5803: 21 29 58    ld   hl,$5829
5806: CD 03 04    call $0403
5809: 21 01 98    ld   hl,$9801
580C: 36 9F       ld   (hl),$9F
580E: 36 BF       ld   (hl),$BF
5810: 36 DF       ld   (hl),$DF
5812: 36 FF       ld   (hl),$FF
5814: 21 02 98    ld   hl,$9802
5817: 36 9F       ld   (hl),$9F
5819: 36 BF       ld   (hl),$BF
581B: 36 DF       ld   (hl),$DF
581D: 36 FF       ld   (hl),$FF
581F: 01 00 00    ld   bc,$0000
5822: 0B          dec  bc
5823: 78          ld   a,b
5824: B1          or   c
5825: 20 FB       jr   nz,$5822
5827: 18 0D       jr   $5836
5829: 70          ld   (hl),b
582A: 89          adc  a,c
582B: 09          add  hl,bc
582C: 09          add  hl,bc
582D: 1C          inc  e
582E: 18 1E       jr   $584E
5830: 17          rla
5831: 0D          dec  c
5832: 29          add  hl,hl
5833: 18 0F       jr   $5844
5835: 0F          rrca
5836: 21 98 58    ld   hl,$5898
5839: 06 13       ld   b,$13
583B: C5          push bc
583C: CD 03 04    call $0403
583F: C1          pop  bc
5840: 10 F9       djnz $583B
5842: 16 02       ld   d,$02
5844: 01 00 00    ld   bc,$0000
5847: C5          push bc
5848: D5          push de
5849: 21 B9 8E    ld   hl,$8EB9
584C: 3A 00 A0    ld   a,(port_1_a000)
584F: CD 77 58    call $5877
5852: 3A 01 A0    ld   a,(port_2_a001)
5855: CD 77 58    call $5877
5858: 21 07 8E    ld   hl,$8E07
585B: 3A 02 A0    ld   a,(dsw_1_a002)
585E: CD 86 58    call $5886
5861: 21 06 8E    ld   hl,$8E06
5864: 3A 03 A0    ld   a,(dsw_2_a003)
5867: CD 86 58    call $5886
586A: D1          pop  de
586B: C1          pop  bc
586C: 10 D9       djnz $5847
586E: 0D          dec  c
586F: 20 D6       jr   nz,$5847
5871: 15          dec  d
5872: 20 D3       jr   nz,$5847
5874: C3 46 59    jp   $5946
5877: 06 08       ld   b,$08
5879: 87          add  a,a
587A: 38 04       jr   c,$5880
587C: 36 00       ld   (hl),$00
587E: 18 02       jr   $5882
5880: 36 01       ld   (hl),$01
5882: 2B          dec  hl
5883: 10 F4       djnz $5879
5885: C9          ret
5886: 06 08       ld   b,$08
5888: 11 20 00    ld   de,$0020
588B: 87          add  a,a
588C: 38 04       jr   c,$5892
588E: 36 00       ld   (hl),$00
5890: 18 02       jr   $5894
5892: 36 01       ld   (hl),$01
5894: 19          add  hl,de
5895: 10 F4       djnz $588B
5897: C9          ret
5898: 70          ld   (hl),b
5899: 89          adc  a,c
589A: 09          add  hl,bc
589B: 09          add  hl,bc
589C: 29          add  hl,hl
589D: 29          add  hl,hl
589E: 29          add  hl,hl
589F: 29          add  hl,hl
58A0: 29          add  hl,hl
58A1: 29          add  hl,hl
58A2: 29          add  hl,hl
58A3: 29          add  hl,hl
58A4: 29          add  hl,hl
58A5: 59          ld   e,c
58A6: 89          adc  a,c
58A7: 09          add  hl,bc
58A8: 04          inc  b
58A9: 1D          dec  e
58AA: 12          ld   (de),a
58AB: 15          dec  d
58AC: 1D          dec  e
58AD: 58          ld   e,b
58AE: 89          adc  a,c
58AF: 09          add  hl,bc
58B0: 09          add  hl,bc
58B1: 1C          inc  e
58B2: 0E 15       ld   c,$15
58B4: 0E 0C       ld   c,$0C
58B6: 1D          dec  e
58B7: 29          add  hl,hl
58B8: 02          ld   (bc),a
58B9: 19          add  hl,de
58BA: 37          scf
58BB: 8A          adc  a,d
58BC: 09          add  hl,bc
58BD: 02          ld   (bc),a
58BE: 01 19 56    ld   bc,$5619
58C1: 89          adc  a,c
58C2: 09          add  hl,bc
58C3: 07          rlca
58C4: 01 19 29    ld   bc,$2919
58C7: 0F          rrca
58C8: 12          ld   (de),a
58C9: 1B          dec  de
58CA: 0E B5       ld   c,$B5
58CC: 89          adc  a,c
58CD: 09          add  hl,bc
58CE: 02          ld   (bc),a
58CF: 1E 19       ld   e,$19
58D1: B4          or   h
58D2: 89          adc  a,c
58D3: 09          add  hl,bc
58D4: 05          dec  b
58D5: 1B          dec  de
58D6: 12          ld   (de),a
58D7: 10 11       djnz $58EA
58D9: 1D          dec  e
58DA: B3          or   e
58DB: 89          adc  a,c
58DC: 09          add  hl,bc
58DD: 04          inc  b
58DE: 0D          dec  c
58DF: 18 20       jr   $5901
58E1: 17          rla
58E2: B2          or   d
58E3: 89          adc  a,c
58E4: 09          add  hl,bc
58E5: 04          inc  b
58E6: 15          dec  d
58E7: 0E 0F       ld   c,$0F
58E9: 1D          dec  e
58EA: 51          ld   d,c
58EB: 89          adc  a,c
58EC: 09          add  hl,bc
58ED: 0A          ld   a,(bc)
58EE: 0C          inc  c
58EF: 18 12       jr   $5903
58F1: 17          rla
58F2: 29          add  hl,hl
58F3: 1B          dec  de
58F4: 12          ld   (de),a
58F5: 10 11       djnz $5908
58F7: 1D          dec  e
58F8: F0          ret  p
58F9: 89          adc  a,c
58FA: 09          add  hl,bc
58FB: 04          inc  b
58FC: 15          dec  d
58FD: 0E 0F       ld   c,$0F
58FF: 1D          dec  e
5900: 4F          ld   c,a
5901: 89          adc  a,c
5902: 09          add  hl,bc
5903: 08          ex   af,af'
5904: 17          rla
5905: 18 1D       jr   $5924
5907: 29          add  hl,hl
5908: 1E 1C       ld   e,$1C
590A: 0E 0D       ld   c,$0D
590C: 4E          ld   c,(hl)
590D: 89          adc  a,c
590E: 09          add  hl,bc
590F: 07          rlca
5910: 02          ld   (bc),a
5911: 19          add  hl,de
5912: 29          add  hl,hl
5913: 0F          rrca
5914: 12          ld   (de),a
5915: 1B          dec  de
5916: 0E AD       ld   c,$AD
5918: 89          adc  a,c
5919: 09          add  hl,bc
591A: 02          ld   (bc),a
591B: 1E 19       ld   e,$19
591D: AC          xor  h
591E: 89          adc  a,c
591F: 09          add  hl,bc
5920: 05          dec  b
5921: 1B          dec  de
5922: 12          ld   (de),a
5923: 10 11       djnz $5936
5925: 1D          dec  e
5926: AB          xor  e
5927: 89          adc  a,c
5928: 09          add  hl,bc
5929: 04          inc  b
592A: 0D          dec  c
592B: 18 20       jr   $594D
592D: 17          rla
592E: AA          xor  d
592F: 89          adc  a,c
5930: 09          add  hl,bc
5931: 04          inc  b
5932: 15          dec  d
5933: 0E 0F       ld   c,$0F
5935: 1D          dec  e
5936: 07          rlca
5937: 89          adc  a,c
5938: 09          add  hl,bc
5939: 07          rlca
593A: 0D          dec  c
593B: 12          ld   (de),a
593C: 19          add  hl,de
593D: 1C          inc  e
593E: 20 29       jr   nz,$5969
5940: 0A          ld   a,(bc)
5941: C6 89       add  a,$89
5943: 09          add  hl,bc
5944: 01 0B 11    ld   bc,$110B
5947: 80          add  a,b
5948: 88          adc  a,b
5949: 01 18 20    ld   bc,$2018
594C: CD 6C 04    call $046C
594F: 3E F7       ld   a,$F7
5951: 32 80 84    ld   ($8480),a
5954: 3E F9       ld   a,$F9
5956: 32 9F 84    ld   ($849F),a
5959: 3E FD       ld   a,$FD
595B: 32 60 87    ld   ($8760),a
595E: 3E FF       ld   a,$FF
5960: 32 7F 87    ld   ($877F),a
5963: 3E F8       ld   a,$F8
5965: 21 81 84    ld   hl,$8481
5968: CD AC 59    call $59AC
596B: 3E FE       ld   a,$FE
596D: 21 61 87    ld   hl,$8761
5970: CD AC 59    call $59AC
5973: 3E FA       ld   a,$FA
5975: 21 A0 84    ld   hl,$84A0
5978: CD B3 59    call $59B3
597B: 3E FC       ld   a,$FC
597D: 21 BF 84    ld   hl,$84BF
5980: CD B3 59    call $59B3
5983: 3E FB       ld   a,$FB
5985: 0E 16       ld   c,$16
5987: 21 A1 84    ld   hl,$84A1
598A: CD AC 59    call $59AC
598D: 23          inc  hl
598E: 23          inc  hl
598F: 0D          dec  c
5990: 20 F8       jr   nz,$598A
5992: 3E 89       ld   a,$89
5994: 0E 18       ld   c,$18
5996: 21 80 80    ld   hl,$8080
5999: 77          ld   (hl),a
599A: 23          inc  hl
599B: CD AC 59    call $59AC
599E: 77          ld   (hl),a
599F: 23          inc  hl
59A0: 0D          dec  c
59A1: 20 F6       jr   nz,$5999
59A3: AF          xor  a
59A4: 32 00 F0    ld   ($F000),a
59A7: 32 00 F8    ld   ($F800),a
59AA: 18 FE       jr   $59AA
59AC: 06 1E       ld   b,$1E
59AE: 77          ld   (hl),a
59AF: 23          inc  hl
59B0: 10 FC       djnz $59AE
59B2: C9          ret
59B3: 06 16       ld   b,$16
59B5: 11 20 00    ld   de,$0020
59B8: 77          ld   (hl),a
59B9: 19          add  hl,de
59BA: 10 FC       djnz $59B8
59BC: C9          ret
59BD: C4 FF FF    call nz,$FFFF
59C0: 21 C5 E1    ld   hl,$E1C5
59C3: CB 76       bit  6,(hl)
59C5: CA C4 50    jp   z,$50C4
59C8: C3 C0 50    jp   $50C0

5A80: 3E FF       ld   a,$FF
5A82: 32 26 EC    ld   ($EC26),a
5A85: AF          xor  a
5A86: 21 00 EC    ld   hl,$EC00
5A89: 06 26       ld   b,$26
5A8B: 77          ld   (hl),a
5A8C: 23          inc  hl
5A8D: 10 FC       djnz $5A8B
5A8F: C9          ret
5A90: DD 21 00 EC ld   ix,$EC00
5A94: 06 26       ld   b,$26
5A96: DD CB 00 56 bit  2,(ix+$00)
5A9A: C4 F6 5A    call nz,$5AF6
5A9D: DD CB 00 46 bit  0,(ix+$00)
5AA1: C4 1D 5B    call nz,$5B1D
5AA4: DD CB 00 4E bit  1,(ix+$00)
5AA8: C4 F6 5A    call nz,$5AF6
5AAB: DD 23       inc  ix
5AAD: 10 E7       djnz $5A96
5AAF: AF          xor  a
5AB0: 32 74 EC    ld   ($EC74),a
5AB3: 32 76 EC    ld   ($EC76),a
5AB6: 21 26 EC    ld   hl,$EC26
5AB9: 7E          ld   a,(hl)
5ABA: FE FF       cp   $FF
5ABC: 28 1F       jr   z,$5ADD
5ABE: E5          push hl
5ABF: 47          ld   b,a
5AC0: 87          add  a,a
5AC1: 87          add  a,a
5AC2: 80          add  a,b
5AC3: 4F          ld   c,a
5AC4: 06 00       ld   b,$00
5AC6: DD 21 00 60 ld   ix,$6000
5ACA: DD 09       add  ix,bc
5ACC: DD 5E 03    ld   e,(ix+$03)
5ACF: DD 56 04    ld   d,(ix+$04)
5AD2: D5          push de
5AD3: FD E1       pop  iy
5AD5: CD 98 5B    call $5B98
5AD8: E1          pop  hl
5AD9: 23          inc  hl
5ADA: 23          inc  hl
5ADB: 18 DC       jr   $5AB9
5ADD: 3A 74 EC    ld   a,($EC74)
5AE0: 47          ld   b,a
5AE1: 3E 9F       ld   a,$9F
5AE3: CB 00       rlc  b
5AE5: 38 03       jr   c,$5AEA
5AE7: 32 01 98    ld   ($9801),a
5AEA: CB 00       rlc  b
5AEC: 38 03       jr   c,$5AF1
5AEE: 32 02 98    ld   ($9802),a
5AF1: C6 20       add  a,$20
5AF3: 30 EE       jr   nc,$5AE3
5AF5: C9          ret
5AF6: DD 36 00 00 ld   (ix+$00),$00
5AFA: 3E 26       ld   a,$26
5AFC: 90          sub  b
5AFD: 4F          ld   c,a
5AFE: 21 26 EC    ld   hl,$EC26
5B01: 7E          ld   a,(hl)
5B02: FE FF       cp   $FF
5B04: C8          ret  z
5B05: B9          cp   c
5B06: 28 04       jr   z,$5B0C
5B08: 23          inc  hl
5B09: 23          inc  hl
5B0A: 18 F5       jr   $5B01
5B0C: 54          ld   d,h
5B0D: 5D          ld   e,l
5B0E: 23          inc  hl
5B0F: 23          inc  hl
5B10: 7E          ld   a,(hl)
5B11: 12          ld   (de),a
5B12: FE FF       cp   $FF
5B14: C8          ret  z
5B15: 13          inc  de
5B16: 23          inc  hl
5B17: 7E          ld   a,(hl)
5B18: 12          ld   (de),a
5B19: 13          inc  de
5B1A: 23          inc  hl
5B1B: 18 F3       jr   $5B10
5B1D: DD 7E 00    ld   a,(ix+$00)
5B20: E6 F0       and  $F0
5B22: DD 77 00    ld   (ix+$00),a
5B25: C5          push bc
5B26: 3E 26       ld   a,$26
5B28: 90          sub  b
5B29: 4F          ld   c,a
5B2A: 87          add  a,a
5B2B: 87          add  a,a
5B2C: 81          add  a,c
5B2D: 5F          ld   e,a
5B2E: 16 00       ld   d,$00
5B30: FD 21 00 60 ld   iy,$6000
5B34: FD 19       add  iy,de
5B36: 06 01       ld   b,$01
5B38: 21 26 EC    ld   hl,$EC26
5B3B: 7E          ld   a,(hl)
5B3C: 23          inc  hl
5B3D: FE FF       cp   $FF
5B3F: 28 1D       jr   z,$5B5E
5B41: B9          cp   c
5B42: 28 2E       jr   z,$5B72
5B44: 7E          ld   a,(hl)
5B45: 23          inc  hl
5B46: FD BE 00    cp   (iy+$00)
5B49: 38 F0       jr   c,$5B3B
5B4B: 04          inc  b
5B4C: 7E          ld   a,(hl)
5B4D: 23          inc  hl
5B4E: FE FF       cp   $FF
5B50: 28 0C       jr   z,$5B5E
5B52: 23          inc  hl
5B53: B9          cp   c
5B54: 20 F5       jr   nz,$5B4B
5B56: 2B          dec  hl
5B57: 54          ld   d,h
5B58: 5D          ld   e,l
5B59: 1B          dec  de
5B5A: 1B          dec  de
5B5B: 05          dec  b
5B5C: 18 04       jr   $5B62
5B5E: 54          ld   d,h
5B5F: 5D          ld   e,l
5B60: 23          inc  hl
5B61: 23          inc  hl
5B62: 1A          ld   a,(de)
5B63: 77          ld   (hl),a
5B64: 1B          dec  de
5B65: 2B          dec  hl
5B66: 1A          ld   a,(de)
5B67: 77          ld   (hl),a
5B68: 1B          dec  de
5B69: 2B          dec  hl
5B6A: 10 F6       djnz $5B62
5B6C: FD 7E 00    ld   a,(iy+$00)
5B6F: 77          ld   (hl),a
5B70: 2B          dec  hl
5B71: 71          ld   (hl),c
5B72: FD 6E 01    ld   l,(iy+$01)
5B75: FD 66 02    ld   h,(iy+$02)
5B78: FD 5E 03    ld   e,(iy+$03)
5B7B: FD 56 04    ld   d,(iy+$04)
5B7E: 79          ld   a,c
5B7F: 12          ld   (de),a
5B80: 13          inc  de
5B81: 7E          ld   a,(hl)
5B82: 12          ld   (de),a
5B83: 47          ld   b,a
5B84: 13          inc  de
5B85: 23          inc  hl
5B86: AF          xor  a
5B87: C5          push bc
5B88: 01 03 00    ld   bc,$0003
5B8B: ED B0       ldir
5B8D: 06 07       ld   b,$07
5B8F: 12          ld   (de),a
5B90: 13          inc  de
5B91: 10 FC       djnz $5B8F
5B93: C1          pop  bc
5B94: 10 F1       djnz $5B87
5B96: C1          pop  bc
5B97: C9          ret
5B98: FD 46 01    ld   b,(iy+$01)
5B9B: DD E5       push ix
5B9D: FD E5       push iy
5B9F: DD E1       pop  ix
5BA1: DD 23       inc  ix
5BA3: DD 23       inc  ix
5BA5: DD 7E 00    ld   a,(ix+$00)
5BA8: A7          and  a
5BA9: 20 07       jr   nz,$5BB2
5BAB: 11 0A 00    ld   de,$000A
5BAE: DD 19       add  ix,de
5BB0: 18 F3       jr   $5BA5
5BB2: C5          push bc
5BB3: CD 69 5C    call $5C69
5BB6: C1          pop  bc
5BB7: 11 0A 00    ld   de,$000A
5BBA: DD 19       add  ix,de
5BBC: 10 E7       djnz $5BA5
5BBE: DD E1       pop  ix
5BC0: FD 7E 01    ld   a,(iy+$01)
5BC3: A7          and  a
5BC4: CA 5D 5C    jp   z,$5C5D
5BC7: 3A 76 EC    ld   a,($EC76)
5BCA: FE 04       cp   $04
5BCC: D0          ret  nc
5BCD: A7          and  a
5BCE: 28 14       jr   z,$5BE4
5BD0: DD 4E 00    ld   c,(ix+$00)
5BD3: 47          ld   b,a
5BD4: 21 77 EC    ld   hl,$EC77
5BD7: 7E          ld   a,(hl)
5BD8: A9          xor  c
5BD9: 57          ld   d,a
5BDA: E6 C0       and  $C0
5BDC: C0          ret  nz
5BDD: 7A          ld   a,d
5BDE: E6 03       and  $03
5BE0: C8          ret  z
5BE1: 23          inc  hl
5BE2: 10 F3       djnz $5BD7
5BE4: CD 10 5E    call $5E10
5BE7: D0          ret  nc
5BE8: 21 76 EC    ld   hl,$EC76
5BEB: 34          inc  (hl)
5BEC: 5E          ld   e,(hl)
5BED: 16 00       ld   d,$00
5BEF: 19          add  hl,de
5BF0: DD 7E 00    ld   a,(ix+$00)
5BF3: 77          ld   (hl),a
5BF4: 3A 75 EC    ld   a,($EC75)
5BF7: 32 74 EC    ld   ($EC74),a
5BFA: FD 46 01    ld   b,(iy+$01)
5BFD: FD 23       inc  iy
5BFF: FD 23       inc  iy
5C01: FD 7E 00    ld   a,(iy+$00)
5C04: A7          and  a
5C05: 20 07       jr   nz,$5C0E
5C07: 11 0A 00    ld   de,$000A
5C0A: FD 19       add  iy,de
5C0C: 18 F3       jr   $5C01
5C0E: C5          push bc
5C0F: 01 01 98    ld   bc,$9801
5C12: CB 47       bit  0,a
5C14: 28 03       jr   z,$5C19
5C16: 01 02 98    ld   bc,$9802
5C19: E6 06       and  $06
5C1B: 87          add  a,a
5C1C: 87          add  a,a
5C1D: 87          add  a,a
5C1E: 87          add  a,a
5C1F: F6 80       or   $80
5C21: 57          ld   d,a
5C22: FD 7E 00    ld   a,(iy+$00)
5C25: E6 38       and  $38
5C27: FE 20       cp   $20
5C29: 38 04       jr   c,$5C2F
5C2B: FE 30       cp   $30
5C2D: 38 19       jr   c,$5C48
5C2F: FD 5E 09    ld   e,(iy+$09)
5C32: 7B          ld   a,e
5C33: E6 F0       and  $F0
5C35: 0F          rrca
5C36: 0F          rrca
5C37: 0F          rrca
5C38: 0F          rrca
5C39: B2          or   d
5C3A: 02          ld   (bc),a
5C3B: FD 7E 08    ld   a,(iy+$08)
5C3E: 02          ld   (bc),a
5C3F: 7B          ld   a,e
5C40: E6 0F       and  $0F
5C42: B2          or   d
5C43: F6 10       or   $10
5C45: 02          ld   (bc),a
5C46: 18 0C       jr   $5C54
5C48: 7A          ld   a,d
5C49: FD B6 08    or   (iy+$08)
5C4C: 02          ld   (bc),a
5C4D: 7A          ld   a,d
5C4E: FD B6 09    or   (iy+$09)
5C51: F6 10       or   $10
5C53: 02          ld   (bc),a
5C54: C1          pop  bc
5C55: 11 0A 00    ld   de,$000A
5C58: FD 19       add  iy,de
5C5A: 10 A5       djnz $5C01
5C5C: C9          ret
5C5D: FD 4E 00    ld   c,(iy+$00)
5C60: 06 00       ld   b,$00
5C62: 21 00 EC    ld   hl,$EC00
5C65: 09          add  hl,bc
5C66: CB CE       set  1,(hl)
5C68: C9          ret
5C69: DD 7E 03    ld   a,(ix+$03)
5C6C: A7          and  a
5C6D: 28 23       jr   z,$5C92
5C6F: DD 35 03    dec  (ix+$03)
5C72: C0          ret  nz
5C73: DD 7E 00    ld   a,(ix+$00)
5C76: E6 38       and  $38
5C78: FE 30       cp   $30
5C7A: 30 16       jr   nc,$5C92
5C7C: DD 6E 01    ld   l,(ix+$01)
5C7F: DD 66 02    ld   h,(ix+$02)
5C82: A7          and  a
5C83: 28 05       jr   z,$5C8A
5C85: FE 20       cp   $20
5C87: 30 01       jr   nc,$5C8A
5C89: 23          inc  hl
5C8A: 23          inc  hl
5C8B: 23          inc  hl
5C8C: DD 75 01    ld   (ix+$01),l
5C8F: DD 74 02    ld   (ix+$02),h
5C92: DD 6E 01    ld   l,(ix+$01)
5C95: DD 66 02    ld   h,(ix+$02)
5C98: 7E          ld   a,(hl)
5C99: FE FF       cp   $FF
5C9B: CA BB 5D    jp   z,$5DBB
5C9E: CB 7F       bit  7,a
5CA0: 28 57       jr   z,$5CF9
5CA2: CB 77       bit  6,a
5CA4: 28 1F       jr   z,$5CC5
5CA6: E6 07       and  $07
5CA8: 87          add  a,a
5CA9: 87          add  a,a
5CAA: 87          add  a,a
5CAB: 47          ld   b,a
5CAC: DD 7E 00    ld   a,(ix+$00)
5CAF: E6 C7       and  $C7
5CB1: B0          or   b
5CB2: DD 77 00    ld   (ix+$00),a
5CB5: 23          inc  hl
5CB6: DD 75 01    ld   (ix+$01),l
5CB9: DD 74 02    ld   (ix+$02),h
5CBC: AF          xor  a
5CBD: DD 77 08    ld   (ix+$08),a
5CC0: DD 77 09    ld   (ix+$09),a
5CC3: 18 CD       jr   $5C92
5CC5: EB          ex   de,hl
5CC6: E6 30       and  $30
5CC8: 0F          rrca
5CC9: 0F          rrca
5CCA: 0F          rrca
5CCB: 0F          rrca
5CCC: C6 04       add  a,$04
5CCE: 4F          ld   c,a
5CCF: 06 00       ld   b,$00
5CD1: DD E5       push ix
5CD3: E1          pop  hl
5CD4: 09          add  hl,bc
5CD5: EB          ex   de,hl
5CD6: 1A          ld   a,(de)
5CD7: A7          and  a
5CD8: 20 10       jr   nz,$5CEA
5CDA: 7E          ld   a,(hl)
5CDB: E6 0F       and  $0F
5CDD: 12          ld   (de),a
5CDE: 23          inc  hl
5CDF: 5E          ld   e,(hl)
5CE0: 23          inc  hl
5CE1: 56          ld   d,(hl)
5CE2: DD 73 01    ld   (ix+$01),e
5CE5: DD 72 02    ld   (ix+$02),d
5CE8: 18 A8       jr   $5C92
5CEA: 3D          dec  a
5CEB: 12          ld   (de),a
5CEC: 20 F0       jr   nz,$5CDE
5CEE: 23          inc  hl
5CEF: 23          inc  hl
5CF0: 23          inc  hl
5CF1: DD 75 01    ld   (ix+$01),l
5CF4: DD 74 02    ld   (ix+$02),h
5CF7: 18 99       jr   $5C92
5CF9: DD 7E 00    ld   a,(ix+$00)
5CFC: E6 38       and  $38
5CFE: 28 14       jr   z,$5D14
5D00: FE 10       cp   $10
5D02: 38 17       jr   c,$5D1B
5D04: 28 1D       jr   z,$5D23
5D06: FE 20       cp   $20
5D08: 38 20       jr   c,$5D2A
5D0A: 28 25       jr   z,$5D31
5D0C: FE 30       cp   $30
5D0E: 38 28       jr   c,$5D38
5D10: 28 2D       jr   z,$5D3F
5D12: 18 54       jr   $5D68
5D14: CD C3 5D    call $5DC3
5D17: CD FA 5D    call $5DFA
5D1A: C9          ret
5D1B: CD C3 5D    call $5DC3
5D1E: 23          inc  hl
5D1F: CD 08 5E    call $5E08
5D22: C9          ret
5D23: CD DD 5D    call $5DDD
5D26: CD FA 5D    call $5DFA
5D29: C9          ret
5D2A: CD DD 5D    call $5DDD
5D2D: CD 08 5E    call $5E08
5D30: C9          ret
5D31: CD E8 5D    call $5DE8
5D34: CD FA 5D    call $5DFA
5D37: C9          ret
5D38: CD E8 5D    call $5DE8
5D3B: CD 08 5E    call $5E08
5D3E: C9          ret
5D3F: DD 7E 08    ld   a,(ix+$08)
5D42: DD B6 09    or   (ix+$09)
5D45: 28 29       jr   z,$5D70
5D47: 23          inc  hl
5D48: 23          inc  hl
5D49: E5          push hl
5D4A: CD 08 5E    call $5E08
5D4D: E1          pop  hl
5D4E: 23          inc  hl
5D4F: 56          ld   d,(hl)
5D50: 23          inc  hl
5D51: 5E          ld   e,(hl)
5D52: 23          inc  hl
5D53: E5          push hl
5D54: DD 66 08    ld   h,(ix+$08)
5D57: DD 6E 09    ld   l,(ix+$09)
5D5A: 19          add  hl,de
5D5B: EB          ex   de,hl
5D5C: E1          pop  hl
5D5D: 7E          ld   a,(hl)
5D5E: 23          inc  hl
5D5F: 6E          ld   l,(hl)
5D60: 67          ld   h,a
5D61: A7          and  a
5D62: ED 52       sbc  hl,de
5D64: 30 34       jr   nc,$5D9A
5D66: 18 39       jr   $5DA1
5D68: DD 7E 08    ld   a,(ix+$08)
5D6B: DD B6 09    or   (ix+$09)
5D6E: 20 07       jr   nz,$5D77
5D70: CD DD 5D    call $5DDD
5D73: CD 08 5E    call $5E08
5D76: C9          ret
5D77: 23          inc  hl
5D78: 23          inc  hl
5D79: E5          push hl
5D7A: CD 08 5E    call $5E08
5D7D: E1          pop  hl
5D7E: 23          inc  hl
5D7F: 56          ld   d,(hl)
5D80: 23          inc  hl
5D81: 5E          ld   e,(hl)
5D82: 23          inc  hl
5D83: E5          push hl
5D84: DD 66 08    ld   h,(ix+$08)
5D87: DD 6E 09    ld   l,(ix+$09)
5D8A: A7          and  a
5D8B: ED 52       sbc  hl,de
5D8D: EB          ex   de,hl
5D8E: E1          pop  hl
5D8F: 7E          ld   a,(hl)
5D90: 23          inc  hl
5D91: 6E          ld   l,(hl)
5D92: 67          ld   h,a
5D93: A7          and  a
5D94: ED 52       sbc  hl,de
5D96: 28 02       jr   z,$5D9A
5D98: 30 07       jr   nc,$5DA1
5D9A: DD 72 08    ld   (ix+$08),d
5D9D: DD 73 09    ld   (ix+$09),e
5DA0: C9          ret
5DA1: DD 6E 01    ld   l,(ix+$01)
5DA4: DD 66 02    ld   h,(ix+$02)
5DA7: 11 07 00    ld   de,$0007
5DAA: 19          add  hl,de
5DAB: DD 75 01    ld   (ix+$01),l
5DAE: DD 74 02    ld   (ix+$02),h
5DB1: AF          xor  a
5DB2: DD 77 08    ld   (ix+$08),a
5DB5: DD 77 09    ld   (ix+$09),a
5DB8: C3 92 5C    jp   $5C92
5DBB: DD 36 00 00 ld   (ix+$00),$00
5DBF: FD 35 01    dec  (iy+$01)
5DC2: C9          ret
5DC3: 7E          ld   a,(hl)
5DC4: 87          add  a,a
5DC5: 5F          ld   e,a
5DC6: 16 00       ld   d,$00
5DC8: E5          push hl
5DC9: 21 14 5F    ld   hl,$5F14
5DCC: 19          add  hl,de
5DCD: 5E          ld   e,(hl)
5DCE: 23          inc  hl
5DCF: 56          ld   d,(hl)
5DD0: E1          pop  hl
5DD1: 23          inc  hl
5DD2: 7E          ld   a,(hl)
5DD3: E6 0F       and  $0F
5DD5: B3          or   e
5DD6: DD 72 08    ld   (ix+$08),d
5DD9: DD 77 09    ld   (ix+$09),a
5DDC: C9          ret
5DDD: 7E          ld   a,(hl)
5DDE: DD 77 08    ld   (ix+$08),a
5DE1: 23          inc  hl
5DE2: 7E          ld   a,(hl)
5DE3: DD 77 09    ld   (ix+$09),a
5DE6: 23          inc  hl
5DE7: C9          ret
5DE8: 7E          ld   a,(hl)
5DE9: E6 70       and  $70
5DEB: 0F          rrca
5DEC: 0F          rrca
5DED: 0F          rrca
5DEE: 0F          rrca
5DEF: DD 77 08    ld   (ix+$08),a
5DF2: 7E          ld   a,(hl)
5DF3: E6 0F       and  $0F
5DF5: DD 77 09    ld   (ix+$09),a
5DF8: 23          inc  hl
5DF9: C9          ret
5DFA: 7E          ld   a,(hl)
5DFB: E6 F0       and  $F0
5DFD: 0F          rrca
5DFE: 0F          rrca
5DFF: 0F          rrca
5E00: 0F          rrca
5E01: 5F          ld   e,a
5E02: 16 00       ld   d,$00
5E04: 21 04 5F    ld   hl,$5F04
5E07: 19          add  hl,de
5E08: 56          ld   d,(hl)
5E09: CD D4 5E    call $5ED4
5E0C: DD 72 03    ld   (ix+$03),d
5E0F: C9          ret
5E10: 3A 74 EC    ld   a,($EC74)
5E13: 32 75 EC    ld   ($EC75),a
5E16: FD E5       push iy
5E18: FD 46 01    ld   b,(iy+$01)
5E1B: FD 23       inc  iy
5E1D: FD 23       inc  iy
5E1F: FD 7E 00    ld   a,(iy+$00)
5E22: E6 F8       and  $F8
5E24: 20 07       jr   nz,$5E2D
5E26: 11 0A 00    ld   de,$000A
5E29: FD 19       add  iy,de
5E2B: 18 F2       jr   $5E1F
5E2D: 4F          ld   c,a
5E2E: E6 C0       and  $C0
5E30: FE C0       cp   $C0
5E32: 28 68       jr   z,$5E9C
5E34: FE 80       cp   $80
5E36: 28 22       jr   z,$5E5A
5E38: 3A 75 EC    ld   a,($EC75)
5E3B: 67          ld   h,a
5E3C: 11 00 80    ld   de,$8000
5E3F: 7C          ld   a,h
5E40: A2          and  d
5E41: 28 0B       jr   z,$5E4E
5E43: CB 3A       srl  d
5E45: 1C          inc  e
5E46: 7B          ld   a,e
5E47: FE 06       cp   $06
5E49: 38 F4       jr   c,$5E3F
5E4B: C3 D0 5E    jp   $5ED0
5E4E: 7C          ld   a,h
5E4F: B2          or   d
5E50: 32 75 EC    ld   ($EC75),a
5E53: 7B          ld   a,e
5E54: B1          or   c
5E55: FD 77 00    ld   (iy+$00),a
5E58: 18 69       jr   $5EC3
5E5A: E1          pop  hl
5E5B: E5          push hl
5E5C: 23          inc  hl
5E5D: 7E          ld   a,(hl)
5E5E: 90          sub  b
5E5F: 28 16       jr   z,$5E77
5E61: FD E5       push iy
5E63: E1          pop  hl
5E64: 11 F6 FF    ld   de,$FFF6
5E67: 19          add  hl,de
5E68: 7E          ld   a,(hl)
5E69: FE C0       cp   $C0
5E6B: 38 0A       jr   c,$5E77
5E6D: E6 07       and  $07
5E6F: C6 02       add  a,$02
5E71: B1          or   c
5E72: FD 77 00    ld   (iy+$00),a
5E75: 18 4C       jr   $5EC3
5E77: 3A 75 EC    ld   a,($EC75)
5E7A: CB 4F       bit  1,a
5E7C: 20 0D       jr   nz,$5E8B
5E7E: CB CF       set  1,a
5E80: 32 75 EC    ld   ($EC75),a
5E83: 79          ld   a,c
5E84: F6 06       or   $06
5E86: FD 77 00    ld   (iy+$00),a
5E89: 18 38       jr   $5EC3
5E8B: CB 47       bit  0,a
5E8D: 20 41       jr   nz,$5ED0
5E8F: CB C7       set  0,a
5E91: 32 75 EC    ld   ($EC75),a
5E94: 79          ld   a,c
5E95: F6 07       or   $07
5E97: FD 77 00    ld   (iy+$00),a
5E9A: 18 27       jr   $5EC3
5E9C: 3A 75 EC    ld   a,($EC75)
5E9F: 57          ld   d,a
5EA0: E6 0A       and  $0A
5EA2: 20 0E       jr   nz,$5EB2
5EA4: 7A          ld   a,d
5EA5: F6 0A       or   $0A
5EA7: 32 75 EC    ld   ($EC75),a
5EAA: 79          ld   a,c
5EAB: F6 04       or   $04
5EAD: FD 77 00    ld   (iy+$00),a
5EB0: 18 11       jr   $5EC3
5EB2: 7A          ld   a,d
5EB3: E6 05       and  $05
5EB5: 20 19       jr   nz,$5ED0
5EB7: 7A          ld   a,d
5EB8: F6 05       or   $05
5EBA: 32 75 EC    ld   ($EC75),a
5EBD: 79          ld   a,c
5EBE: F6 05       or   $05
5EC0: FD 77 00    ld   (iy+$00),a
5EC3: 11 0A 00    ld   de,$000A
5EC6: FD 19       add  iy,de
5EC8: 05          dec  b
5EC9: C2 1F 5E    jp   nz,$5E1F
5ECC: FD E1       pop  iy
5ECE: 37          scf
5ECF: C9          ret
5ED0: FD E1       pop  iy
5ED2: A7          and  a
5ED3: C9          ret
5ED4: FD 4E 00    ld   c,(iy+$00)
5ED7: 06 00       ld   b,$00
5ED9: 21 00 EC    ld   hl,$EC00
5EDC: 09          add  hl,bc
5EDD: 7E          ld   a,(hl)
5EDE: E6 F0       and  $F0
5EE0: C8          ret  z
5EE1: 6F          ld   l,a
5EE2: 26 00       ld   h,$00
5EE4: 29          add  hl,hl
5EE5: 7A          ld   a,d
5EE6: EB          ex   de,hl
5EE7: CD F5 5E    call $5EF5
5EEA: EB          ex   de,hl
5EEB: CB 7B       bit  7,e
5EED: 28 01       jr   z,$5EF0
5EEF: 14          inc  d
5EF0: 7A          ld   a,d
5EF1: A7          and  a
5EF2: C0          ret  nz
5EF3: 14          inc  d
5EF4: C9          ret
5EF5: 21 00 00    ld   hl,$0000
5EF8: 06 08       ld   b,$08
5EFA: 0F          rrca
5EFB: 30 01       jr   nc,$5EFE
5EFD: 19          add  hl,de
5EFE: EB          ex   de,hl
5EFF: 29          add  hl,hl
5F00: EB          ex   de,hl
5F01: 10 F7       djnz $5EFA
5F03: C9          ret

7004: FE 03       cp   $03
7006: 30 26       jr   nc,$702E
7008: FE 02       cp   $02
700A: 30 0F       jr   nc,$701B
700C: DD 7E 04    ld   a,(ix+$04)
700F: A7          and  a
7010: 20 09       jr   nz,$701B
7012: 11 B4 80    ld   de,$80B4
7015: 01 16 07    ld   bc,$0716
7018: CD 6C 04    call $046C
701B: DD 7E 04    ld   a,(ix+$04)
701E: 32 00 F8    ld   ($F800),a
7021: E6 07       and  $07
7023: CC 36 70    call z,$7036
7026: DD 35 04    dec  (ix+$04)
7029: C0          ret  nz
702A: DD 34 03    inc  (ix+$03)
702D: C9          ret
702E: DD 34 02    inc  (ix+$02)
7031: DD 36 03 00 ld   (ix+$03),$00
7035: C9          ret
7036: DD 7E 04    ld   a,(ix+$04)
7039: E6 F8       and  $F8
703B: D6 E8       sub  $E8
703D: 6F          ld   l,a
703E: 26 00       ld   h,$00
7040: 29          add  hl,hl
7041: 29          add  hl,hl
7042: 11 14 80    ld   de,$8014
7045: 19          add  hl,de
7046: EB          ex   de,hl
7047: E6 08       and  $08
7049: 0F          rrca
704A: 0F          rrca
704B: 4F          ld   c,a
704C: 06 00       ld   b,$00
704E: 21 6A 70    ld   hl,$706A
7051: 09          add  hl,bc
7052: 7E          ld   a,(hl)
7053: EB          ex   de,hl
7054: 01 01 07    ld   bc,$0701
7057: C5          push bc
7058: D5          push de
7059: E5          push hl
705A: CD 5C 04    call $045C
705D: E1          pop  hl
705E: D1          pop  de
705F: C1          pop  bc
7060: 13          inc  de
7061: 1A          ld   a,(de)
7062: 11 00 04    ld   de,$0400
7065: 19          add  hl,de
7066: CD 5C 04    call $045C
7069: C9          ret
706A: 5B          ld   e,e
706B: 26 66       ld   h,$66
706D: 27          daa
706E: 11 94 88    ld   de,$8894
7071: 01 18 07    ld   bc,$0718
7074: 3E 40       ld   a,$40
7076: CD 6D 04    call $046D
7079: 08          ex   af,af'
707A: 3E 10       ld   a,$10
707C: 08          ex   af,af'
707D: 3E 8E       ld   a,$8E
707F: 01 06 04    ld   bc,$0406
7082: 11 D7 88    ld   de,$88D7
7085: CD 42 04    call $0442
7088: 01 07 07    ld   bc,$0707
708B: 11 94 89    ld   de,$8994
708E: CD 42 04    call $0442
7091: 01 04 05    ld   bc,$0504
7094: CD 42 04    call $0442
7097: 01 03 07    ld   bc,$0703
709A: CD 42 04    call $0442
709D: 21 94 80    ld   hl,$8094
70A0: 01 18 07    ld   bc,$0718
70A3: 3E 40       ld   a,$40
70A5: CD 5C 04    call $045C
70A8: C9          ret
70A9: DD 7E 03    ld   a,(ix+$03)
70AC: A7          and  a
70AD: 20 68       jr   nz,$7117
70AF: DD 34 03    inc  (ix+$03)
70B2: DD 36 06 00 ld   (ix+$06),$00
70B6: DD 36 07 00 ld   (ix+$07),$00
70BA: FD 36 00 00 ld   (iy+$00),$00
70BE: FD 36 04 01 ld   (iy+$04),$01
70C2: FD 36 08 00 ld   (iy+$08),$00
70C6: FD 36 09 00 ld   (iy+$09),$00
70CA: FD 36 0A 02 ld   (iy+$0a),$02
70CE: FD 36 16 00 ld   (iy+$16),$00
70D2: FD 36 17 00 ld   (iy+$17),$00
70D6: FD 36 1A 00 ld   (iy+$1a),$00
70DA: CD 85 04    call $0485
70DD: CD 86 10    call $1086
70E0: 3A E6 06    ld   a,($06E6)
70E3: 01 12 0E    ld   bc,$0E12
70E6: 21 C3 80    ld   hl,$80C3
70E9: CD 5C 04    call $045C
70EC: 3A E7 06    ld   a,($06E7)
70EF: 01 12 0E    ld   bc,$0E12
70F2: 21 C3 84    ld   hl,$84C3
70F5: CD 5C 04    call $045C
70F8: 11 1E 71    ld   de,$711E
70FB: CD 34 07    call $0734
70FE: CD 6C 71    call $716C
7101: CD 6E 70    call $706E
7104: 21 A0 71    ld   hl,$71A0
7107: CD 03 04    call $0403
710A: DD 36 01 1E ld   (ix+$01),$1E
710E: 21 00 E0    ld   hl,$E000
7111: CB F6       set  6,(hl)
7113: 23          inc  hl
7114: CB B6       res  6,(hl)
7116: C9          ret
7117: CD AF 71    call $71AF
711A: CD 58 72    call $7258
711D: C9          ret

716C: FD E5       push iy
716E: E1          pop  hl
716F: 11 31 00    ld   de,$0031
7172: 19          add  hl,de
7173: E5          push hl
7174: 11 07 00    ld   de,$0007
7177: 06 0C       ld   b,$0C
7179: 36 00       ld   (hl),$00
717B: 19          add  hl,de
717C: 10 FB       djnz $7179
717E: D1          pop  de
717F: 21 92 71    ld   hl,$7192
7182: 01 07 00    ld   bc,$0007
7185: ED B0       ldir
7187: 01 07 00    ld   bc,$0007
718A: ED B0       ldir
718C: 3E 80       ld   a,$80
718E: 32 00 E3    ld   ($E300),a
7191: C9          ret

71AC: 12          ld   (de),a
71AD: 18 17       jr   $71C6
71AF: DD 7E 03    ld   a,(ix+$03)
71B2: FE 02       cp   $02
71B4: 30 4D       jr   nc,$7203
71B6: DD 34 03    inc  (ix+$03)
71B9: DD 36 04 FF ld   (ix+$04),$FF
71BD: DD 36 05 1E ld   (ix+$05),$1E
71C1: DD E5       push ix
71C3: DD 21 C5 E1 ld   ix,$E1C5
71C7: DD 36 00 C0 ld   (ix+$00),$C0
71CB: DD 36 01 48 ld   (ix+$01),$48
71CF: DD 36 02 00 ld   (ix+$02),$00
71D3: DD 36 03 70 ld   (ix+$03),$70
71D7: DD 36 04 00 ld   (ix+$04),$00
71DB: DD 36 05 00 ld   (ix+$05),$00
71DF: DD 36 07 80 ld   (ix+$07),$80
71E3: DD 36 08 00 ld   (ix+$08),$00
71E7: DD 36 0D 00 ld   (ix+$0d),$00
71EB: DD 36 10 00 ld   (ix+$10),$00
71EF: DD 36 11 00 ld   (ix+$11),$00
71F3: DD E1       pop  ix
71F5: FD 36 0C 00 ld   (iy+$0c),$00
71F9: FD 36 0D FF ld   (iy+$0d),$FF
71FD: 21 01 E0    ld   hl,$E001
7200: CB C6       set  0,(hl)
7202: C9          ret
7203: DD 35 05    dec  (ix+$05)
7206: C0          ret  nz
7207: DD 7E 03    ld   a,(ix+$03)
720A: FE 16       cp   $16
720C: 30 15       jr   nc,$7223
720E: 87          add  a,a
720F: 5F          ld   e,a
7210: 16 00       ld   d,$00
7212: 21 2C 72    ld   hl,$722C
7215: 19          add  hl,de
7216: 7E          ld   a,(hl)
7217: DD 77 04    ld   (ix+$04),a
721A: 23          inc  hl
721B: 7E          ld   a,(hl)
721C: DD 77 05    ld   (ix+$05),a
721F: DD 34 03    inc  (ix+$03)
7222: C9          ret
7223: DD 34 02    inc  (ix+$02)
7226: DD 36 03 00 ld   (ix+$03),$00
722A: 21 00 E0    ld   hl,$E000
722D: CB B6       res  6,(hl)
722F: C9          ret

7258: DD 7E 07    ld   a,(ix+$07)
725B: A7          and  a
725C: 28 04       jr   z,$7262
725E: DD 35 07    dec  (ix+$07)
7261: C9          ret
7262: DD 7E 06    ld   a,(ix+$06)
7265: FE 12       cp   $12
7267: D0          ret  nc
7268: FE 11       cp   $11
726A: D2 93 73    jp   nc,$7393
726D: FE 10       cp   $10
726F: D2 6F 73    jp   nc,$736F
7272: FE 07       cp   $07
7274: D2 31 73    jp   nc,$7331
7277: FE 06       cp   $06
7279: D2 29 73    jp   nc,$7329
727C: FE 01       cp   $01
727E: 30 44       jr   nc,$72C4
7280: DD E5       push ix
7282: DD 21 1A E2 ld   ix,$E21A
7286: DD 36 00 C1 ld   (ix+$00),$C1
728A: DD 36 01 A8 ld   (ix+$01),$A8
728E: DD 36 02 00 ld   (ix+$02),$00
7292: DD 36 03 70 ld   (ix+$03),$70
7296: DD 36 04 00 ld   (ix+$04),$00
729A: DD 36 05 40 ld   (ix+$05),$40
729E: DD 36 06 00 ld   (ix+$06),$00
72A2: DD 36 07 00 ld   (ix+$07),$00
72A6: DD 36 08 00 ld   (ix+$08),$00
72AA: DD 36 0D FF ld   (ix+$0d),$FF
72AE: DD 36 0E FF ld   (ix+$0e),$FF
72B2: DD 36 13 00 ld   (ix+$13),$00
72B6: DD 36 14 00 ld   (ix+$14),$00
72BA: DD E1       pop  ix
72BC: DD 34 06    inc  (ix+$06)
72BF: DD 36 07 B4 ld   (ix+$07),$B4
72C3: C9          ret
72C4: DD 7E 06    ld   a,(ix+$06)
72C7: 3D          dec  a
72C8: FD 77 17    ld   (iy+$17),a
72CB: DD E5       push ix
72CD: DD 21 C2 E2 ld   ix,$E2C2
72D1: DD 36 00 E1 ld   (ix+$00),$E1
72D5: DD 36 01 A8 ld   (ix+$01),$A8
72D9: DD 36 02 00 ld   (ix+$02),$00
72DD: DD 36 03 70 ld   (ix+$03),$70
72E1: DD 36 04 00 ld   (ix+$04),$00
72E5: DD 36 05 20 ld   (ix+$05),$20
72E9: DD 36 06 00 ld   (ix+$06),$00
72ED: DD 36 07 00 ld   (ix+$07),$00
72F1: DD 36 08 00 ld   (ix+$08),$00
72F5: DD 36 09 00 ld   (ix+$09),$00
72F9: DD 36 0A 00 ld   (ix+$0a),$00
72FD: DD 36 0B 00 ld   (ix+$0b),$00
7301: DD 36 0C 00 ld   (ix+$0c),$00
7305: DD 36 0D 00 ld   (ix+$0d),$00
7309: DD 36 0E 03 ld   (ix+$0e),$03
730D: DD 36 0F FF ld   (ix+$0f),$FF
7311: DD 36 10 FF ld   (ix+$10),$FF
7315: DD E1       pop  ix
7317: DD 36 07 B4 ld   (ix+$07),$B4
731B: DD 34 06    inc  (ix+$06)
731E: DD 7E 06    ld   a,(ix+$06)
7321: FE 06       cp   $06
7323: D8          ret  c
7324: DD 36 07 E6 ld   (ix+$07),$E6
7328: C9          ret
7329: DD 36 07 50 ld   (ix+$07),$50
732D: DD 34 06    inc  (ix+$06)
7330: C9          ret
7331: 3E 2E       ld   a,$2E
7333: 08          ex   af,af'
7334: 3E 09       ld   a,$09
7336: 01 02 02    ld   bc,$0202
7339: 11 29 8B    ld   de,$8B29
733C: CD 42 04    call $0442
733F: DD CB 06 46 bit  0,(ix+$06)
7343: 28 15       jr   z,$735A
7345: CD 4F 05    call $054F
7348: DD 34 06    inc  (ix+$06)
734B: DD 36 07 14 ld   (ix+$07),$14
734F: DD 7E 06    ld   a,(ix+$06)
7352: FE 0F       cp   $0F
7354: D8          ret  c
7355: DD 36 07 2A ld   (ix+$07),$2A
7359: C9          ret
735A: 01 0A 02    ld   bc,$020A
735D: 11 7D 89    ld   de,$897D
7360: CD 6C 04    call $046C
7363: DD 34 06    inc  (ix+$06)
7366: DD 36 07 08 ld   (ix+$07),$08
736A: AF          xor  a
736B: 32 C2 E2    ld   ($E2C2),a
736E: C9          ret
736F: DD E5       push ix
7371: DD 21 09 E3 ld   ix,$E309
7375: DD 36 00 80 ld   (ix+$00),$80
7379: DD 36 01 A8 ld   (ix+$01),$A8
737D: DD 36 02 00 ld   (ix+$02),$00
7381: DD 36 03 30 ld   (ix+$03),$30
7385: DD 36 04 00 ld   (ix+$04),$00
7389: DD E1       pop  ix
738B: DD 34 06    inc  (ix+$06)
738E: DD 36 07 46 ld   (ix+$07),$46
7392: C9          ret
7393: 3E 32       ld   a,$32
7395: 08          ex   af,af'
7396: 3E 4D       ld   a,$4D
7398: 01 02 02    ld   bc,$0202
739B: 11 25 8B    ld   de,$8B25
739E: CD 42 04    call $0442
73A1: DD 34 06    inc  (ix+$06)
73A4: C9          ret
73A5: DD 7E 02    ld   a,(ix+$02)
73A8: FE 04       cp   $04
73AA: D2 EF 74    jp   nc,$74EF
73AD: FE 03       cp   $03
73AF: 30 6E       jr   nc,$741F
73B1: FE 02       cp   $02
73B3: 30 3C       jr   nc,$73F1
73B5: FE 01       cp   $01
73B7: 30 16       jr   nc,$73CF
73B9: CD 85 04    call $0485
73BC: DD 36 01 04 ld   (ix+$01),$04
73C0: DD 34 02    inc  (ix+$02)
73C3: DD 36 03 00 ld   (ix+$03),$00
73C7: 3E 1D       ld   a,$1D
73C9: 06 00       ld   b,$00
73CB: CD D9 02    call $02D9
73CE: C9          ret
73CF: DD 7E 03    ld   a,(ix+$03)
73D2: 21 FB 74    ld   hl,$74FB
73D5: CD 25 04    call $0425
73D8: DD 36 01 04 ld   (ix+$01),$04
73DC: DD 34 03    inc  (ix+$03)
73DF: DD 7E 03    ld   a,(ix+$03)
73E2: FE 0F       cp   $0F
73E4: D8          ret  c
73E5: DD 36 01 08 ld   (ix+$01),$08
73E9: DD 34 02    inc  (ix+$02)
73EC: DD 36 03 00 ld   (ix+$03),$00
73F0: C9          ret
73F1: DD 7E 03    ld   a,(ix+$03)
73F4: 87          add  a,a
73F5: 5F          ld   e,a
73F6: 16 00       ld   d,$00
73F8: 21 0E 75    ld   hl,$750E
73FB: 19          add  hl,de
73FC: 5E          ld   e,(hl)
73FD: 23          inc  hl
73FE: 56          ld   d,(hl)
73FF: EB          ex   de,hl
7400: CD 03 04    call $0403
7403: DD 36 01 08 ld   (ix+$01),$08
7407: DD 34 03    inc  (ix+$03)
740A: DD 7E 03    ld   a,(ix+$03)
740D: FE 06       cp   $06
740F: D8          ret  c
7410: DD 34 02    inc  (ix+$02)
7413: DD 36 01 0C ld   (ix+$01),$0C
7417: DD 36 03 48 ld   (ix+$03),$48
741B: DD 36 04 00 ld   (ix+$04),$00
741F: DD 7E 03    ld   a,(ix+$03)
7422: FE 48       cp   $48
7424: 20 5C       jr   nz,$7482
7426: CD B4 7C    call $7CB4
7429: 3E B6       ld   a,$B6
742B: 08          ex   af,af'
742C: 3E BE       ld   a,$BE
742E: 01 12 04    ld   bc,$0412
7431: 11 E7 88    ld   de,$88E7
7434: CD 42 04    call $0442
7437: 21 4A 75    ld   hl,$754A
743A: CD 03 04    call $0403
743D: 3A 06 E0    ld   a,($E006)
7440: FE 0A       cp   $0A
7442: 38 02       jr   c,$7446
7444: 3E 09       ld   a,$09
7446: 32 65 8E    ld   ($8E65),a
7449: 3E 5E       ld   a,$5E
744B: 08          ex   af,af'
744C: 3E 9B       ld   a,$9B
744E: 01 04 03    ld   bc,$0304
7451: 11 AC 80    ld   de,$80AC
7454: CD 42 04    call $0442
7457: 3E 72       ld   a,$72
7459: 08          ex   af,af'
745A: 3E 91       ld   a,$91
745C: 01 03 0A    ld   bc,$0A03
745F: 11 CF 80    ld   de,$80CF
7462: CD 42 04    call $0442
7465: 3E 91       ld   a,$91
7467: 01 04 06    ld   bc,$0604
746A: 11 31 81    ld   de,$8131
746D: CD 42 04    call $0442
7470: 06 6D       ld   b,$6D
7472: 0E 0C       ld   c,$0C
7474: 11 90 D0    ld   de,$D090
7477: CD 9D 02    call $029D
747A: DD 36 05 D0 ld   (ix+$05),$D0
747E: DD 36 06 90 ld   (ix+$06),$90
7482: CD 56 75    call $7556
7485: DD 7E 03    ld   a,(ix+$03)
7488: CD B4 7C    call $7CB4
748B: A7          and  a
748C: 28 03       jr   z,$7491
748E: DD 34 03    inc  (ix+$03)
7491: DD 7E 03    ld   a,(ix+$03)
7494: A7          and  a
7495: 28 0C       jr   z,$74A3
7497: FE C8       cp   $C8
7499: 30 08       jr   nc,$74A3
749B: FE 94       cp   $94
749D: D8          ret  c
749E: DD 35 05    dec  (ix+$05)
74A1: 18 0A       jr   $74AD
74A3: DD 7E 06    ld   a,(ix+$06)
74A6: FE 2C       cp   $2C
74A8: 38 11       jr   c,$74BB
74AA: DD 35 06    dec  (ix+$06)
74AD: 06 6D       ld   b,$6D
74AF: 0E 0C       ld   c,$0C
74B1: DD 56 05    ld   d,(ix+$05)
74B4: DD 5E 06    ld   e,(ix+$06)
74B7: CD 9D 02    call $029D
74BA: C9          ret
74BB: 21 0B 77    ld   hl,$770B
74BE: 06 42       ld   b,$42
74C0: AF          xor  a
74C1: 86          add  a,(hl)
74C2: 23          inc  hl
74C3: 10 FC       djnz $74C1
74C5: FE DF       cp   $DF
74C7: 20 03       jr   nz,$74CC
74C9: 3A 06 E0    ld   a,($E006)
74CC: C6 01       add  a,$01
74CE: 27          daa
74CF: 32 06 E0    ld   ($E006),a
74D2: FE 0A       cp   $0A
74D4: 38 02       jr   c,$74D8
74D6: 3E 09       ld   a,$09
74D8: 32 65 8E    ld   ($8E65),a
74DB: 21 01 E0    ld   hl,$E001
74DE: CB FE       set  7,(hl)
74E0: 3E 14       ld   a,$14
74E2: 06 00       ld   b,$00
74E4: CD D9 02    call $02D9
74E7: DD 34 02    inc  (ix+$02)
74EA: DD 36 05 E0 ld   (ix+$05),$E0
74EE: C9          ret
74EF: CD 56 75    call $7556
74F2: DD 35 05    dec  (ix+$05)
74F5: C0          ret  nz
74F6: DD CB 00 AE res  5,(ix+$00)
74FA: C9          ret
74FB: 1A          ld   a,(de)
74FC: 89          adc  a,c
74FD: 3E 0F       ld   a,$0F
74FF: 0C          inc  c
7500: 18 17       jr   $7519
7502: 10 1B       djnz $751F
7504: 0A          ld   a,(bc)
7505: 1D          dec  e
7506: 1E 15       ld   e,$15
7508: 0A          ld   a,(bc)
7509: 1D          dec  e
750A: 12          ld   (de),a
750B: 18 17       jr   $7524
750D: 1C          inc  e
750E: 1A          ld   a,(de)
750F: 75          ld   (hl),l
7510: 21 75 28    ld   hl,$2875
7513: 75          ld   (hl),l
7514: 33          inc  sp
7515: 75          ld   (hl),l
7516: 3A 75 42    ld   a,($4275)
7519: 75          ld   (hl),l
751A: D5          push de
751B: 89          adc  a,c
751C: 0B          dec  bc
751D: 03          inc  bc
751E: 22 18 1E    ld   ($1E18),hl
7521: 55          ld   d,l
7522: 8A          adc  a,d
7523: 0B          dec  bc
7524: 03          inc  bc
7525: 20 12       jr   nz,$7539
7527: 17          rla
7528: 94          sub  h
7529: 8A          adc  a,d
752A: 2C          inc  l
752B: 07          rlca
752C: 1C          inc  e
752D: 19          add  hl,de
752E: 0E 0C       ld   c,$0C
7530: 12          ld   (de),a
7531: 0A          ld   a,(bc)
7532: 15          dec  d
7533: D2 89 0B    jp   nc,$0B89
7536: 03          inc  bc
7537: 18 17       jr   $7550
7539: 0E 52       ld   c,$52
753B: 8A          adc  a,d
753C: 0B          dec  bc
753D: 04          inc  b
753E: 16 18       ld   d,$18
7540: 1B          dec  de
7541: 0E 91       ld   c,$91
7543: 8A          adc  a,d
7544: 22 04 10    ld   ($1004),hl
7547: 0A          ld   a,(bc)
7548: 16 0E       ld   d,$0E
754A: 85          add  a,l
754B: 89          adc  a,c
754C: 0B          dec  bc
754D: 08          ex   af,af'
754E: 0C          inc  c
754F: 1B          dec  de
7550: 0E 0D       ld   c,$0D
7552: 12          ld   (de),a
7553: 1D          dec  e
7554: 29          add  hl,hl
7555: 29          add  hl,hl
7556: DD 34 04    inc  (ix+$04)
7559: DD 7E 04    ld   a,(ix+$04)
755C: FE 03       cp   $03
755E: 38 04       jr   c,$7564
7560: AF          xor  a
7561: DD 77 04    ld   (ix+$04),a
7564: 21 78 75    ld   hl,$7578
7567: A7          and  a
7568: 28 0A       jr   z,$7574
756A: 21 80 75    ld   hl,$7580
756D: FE 01       cp   $01
756F: 28 03       jr   z,$7574
7571: 21 88 75    ld   hl,$7588
7574: CD 03 04    call $0403
7577: C9          ret
7578: AE          xor  (hl)
7579: 80          add  a,b
757A: 9B          sbc  a,e
757B: 04          inc  b
757C: 60          ld   h,b
757D: 63          ld   h,e
757E: 66          ld   h,(hl)
757F: 69          ld   l,c
7580: AE          xor  (hl)
7581: 80          add  a,b
7582: 9B          sbc  a,e
7583: 04          inc  b
7584: 6A          ld   l,d
7585: 6B          ld   l,e
7586: 6C          ld   l,h
7587: 6D          ld   l,l
7588: AE          xor  (hl)
7589: 80          add  a,b
758A: 9B          sbc  a,e
758B: 04          inc  b
758C: 6E          ld   l,(hl)
758D: 6F          ld   l,a
758E: 70          ld   (hl),b
758F: 71          ld   (hl),c
7590: DD 7E 02    ld   a,(ix+$02)
7593: FE 04       cp   $04
7595: D2 0B 77    jp   nc,$770B
7598: FE 03       cp   $03
759A: D2 FD 76    jp   nc,$76FD
759D: FE 02       cp   $02
759F: D2 D6 76    jp   nc,$76D6
75A2: FE 01       cp   $01
75A4: D2 99 76    jp   nc,$7699
75A7: DD 34 02    inc  (ix+$02)
75AA: CD 85 04    call $0485
75AD: DD 36 03 00 ld   (ix+$03),$00
75B1: DD 36 04 C0 ld   (ix+$04),$C0
75B5: DD 36 05 00 ld   (ix+$05),$00
75B9: DD 36 06 00 ld   (ix+$06),$00
75BD: DD 7E 04    ld   a,(ix+$04)
75C0: CB 2F       sra  a
75C2: CD B4 7C    call $7CB4
75C5: 3E 51       ld   a,$51
75C7: 01 20 0A    ld   bc,$0A20
75CA: 21 03 80    ld   hl,$8003
75CD: CD 5C 04    call $045C
75D0: 3E 64       ld   a,$64
75D2: 01 20 0A    ld   bc,$0A20
75D5: 21 03 84    ld   hl,$8403
75D8: CD 5C 04    call $045C
75DB: 3E 09       ld   a,$09
75DD: 01 16 05    ld   bc,$0516
75E0: 21 0D 80    ld   hl,$800D
75E3: CD 5C 04    call $045C
75E6: 3E A5       ld   a,$A5
75E8: 01 16 05    ld   bc,$0516
75EB: 21 0D 84    ld   hl,$840D
75EE: CD 5C 04    call $045C
75F1: 3E 0B       ld   a,$0B
75F3: 01 20 0B    ld   bc,$0B20
75F6: 21 12 80    ld   hl,$8012
75F9: CD 5C 04    call $045C
75FC: 3E 2F       ld   a,$2F
75FE: 01 20 0B    ld   bc,$0B20
7601: 21 12 84    ld   hl,$8412
7604: CD 5C 04    call $045C
7607: 3E 2E       ld   a,$2E
7609: 08          ex   af,af'
760A: 3E 0B       ld   a,$0B
760C: 01 11 02    ld   bc,$0211
760F: 11 10 80    ld   de,$8010
7612: CD 42 04    call $0442
7615: 3E 6C       ld   a,$6C
7617: 01 04 03    ld   bc,$0304
761A: 11 2D 82    ld   de,$822D
761D: CD 42 04    call $0442
7620: 3E 2C       ld   a,$2C
7622: 01 04 02    ld   bc,$0204
7625: 11 30 82    ld   de,$8230
7628: CD 42 04    call $0442
762B: 3E 51       ld   a,$51
762D: 01 0A 05    ld   bc,$050A
7630: 11 A8 82    ld   de,$82A8
7633: CD 42 04    call $0442
7636: 3E 09       ld   a,$09
7638: 01 06 03    ld   bc,$0306
763B: 11 CD 82    ld   de,$82CD
763E: CD 42 04    call $0442
7641: 3E 0B       ld   a,$0B
7643: 01 04 04    ld   bc,$0404
7646: 11 B0 82    ld   de,$82B0
7649: CD 42 04    call $0442
764C: 3E 6C       ld   a,$6C
764E: 01 03 02    ld   bc,$0203
7651: 11 30 83    ld   de,$8330
7654: CD 42 04    call $0442
7657: 3E 0B       ld   a,$0B
7659: 01 03 02    ld   bc,$0203
765C: 11 32 83    ld   de,$8332
765F: CD 42 04    call $0442
7662: 3E 6C       ld   a,$6C
7664: 01 04 05    ld   bc,$0504
7667: 11 8D 83    ld   de,$838D
766A: CD 42 04    call $0442
766D: 3E 2C       ld   a,$2C
766F: 01 04 02    ld   bc,$0204
7672: 11 92 83    ld   de,$8392
7675: CD 42 04    call $0442
7678: 3E 82       ld   a,$82
767A: 08          ex   af,af'
767B: 3E 89       ld   a,$89
767D: 01 04 06    ld   bc,$0604
7680: 11 08 89    ld   de,$8908
7683: CD 42 04    call $0442
7686: 3E 89       ld   a,$89
7688: 01 02 01    ld   bc,$0102
768B: 21 2C 89    ld   hl,$892C
768E: CD 5C 04    call $045C
7691: 3E 1E       ld   a,$1E
7693: 06 00       ld   b,$00
7695: CD D9 02    call $02D9
7698: C9          ret
7699: DD 34 03    inc  (ix+$03)
769C: DD 7E 03    ld   a,(ix+$03)
769F: FE A4       cp   $A4
76A1: 30 0D       jr   nc,$76B0
76A3: CD 4D 77    call $774D
76A6: CD 85 77    call $7785
76A9: CD 91 78    call $7891
76AC: CD 52 79    call $7952
76AF: C9          ret
76B0: DD 34 02    inc  (ix+$02)
76B3: DD 36 03 00 ld   (ix+$03),$00
76B7: DD 36 06 DC ld   (ix+$06),$DC
76BB: 3E E0       ld   a,$E0
76BD: 08          ex   af,af'
76BE: 3E 51       ld   a,$51
76C0: 01 04 01    ld   bc,$0104
76C3: 11 AC 82    ld   de,$82AC
76C6: CD 42 04    call $0442
76C9: 3E 09       ld   a,$09
76CB: 01 04 02    ld   bc,$0204
76CE: 11 AD 82    ld   de,$82AD
76D1: CD 42 04    call $0442
76D4: 18 0A       jr   $76E0
76D6: DD 34 03    inc  (ix+$03)
76D9: DD 7E 03    ld   a,(ix+$03)
76DC: FE 90       cp   $90
76DE: 30 0A       jr   nc,$76EA
76E0: CD EA 77    call $77EA
76E3: CD 07 79    call $7907
76E6: CD 52 79    call $7952
76E9: C9          ret
76EA: FD 34 00    inc  (iy+$00)
76ED: CD AA 05    call $05AA
76F0: 21 01 E0    ld   hl,$E001
76F3: CB FE       set  7,(hl)
76F5: DD 34 02    inc  (ix+$02)
76F8: DD 36 03 00 ld   (ix+$03),$00
76FC: C9          ret
76FD: CD 07 79    call $7907
7700: CD 52 79    call $7952
7703: DD 34 03    inc  (ix+$03)
7706: C0          ret  nz
7707: DD 34 02    inc  (ix+$02)
770A: C9          ret
770B: CD 07 79    call $7907
770E: CD 52 79    call $7952
7711: DD 34 03    inc  (ix+$03)
7714: DD 7E 03    ld   a,(ix+$03)
7717: FE 24       cp   $24
7719: D8          ret  c
771A: 11 70 8C    ld   de,$8C70
771D: 3E A5       ld   a,$A5
771F: 12          ld   (de),a
7720: 13          inc  de
7721: 21 45 77    ld   hl,$7745
7724: 06 04       ld   b,$04
7726: 7E          ld   a,(hl)
7727: 12          ld   (de),a
7728: 23          inc  hl
7729: 3A 03 98    ld   a,(protection_byte_9803)
772C: E6 7E       and  $7E
772E: BE          cp   (hl)
772F: 20 0C       jr   nz,$773D
; protection passed
7731: 13          inc  de
7732: 23          inc  hl
7733: 10 F1       djnz $7726
7735: FD 34 1A    inc  (iy+$1a)
7738: FD 7E 16    ld   a,(iy+$16)
773B: E6 02       and  $02
773D: FD 77 16    ld   (iy+$16),a
7740: DD CB 00 9E res  3,(ix+$00)
7744: C9          ret
7745: A5          and  l
7746: 40          ld   b,b
7747: C2 4C 36    jp   nz,$364C
774A: 2A 6F 66    ld   hl,($666F)
774D: DD 7E 03    ld   a,(ix+$03)
7750: FE 10       cp   $10
7752: D8          ret  c
7753: FE 91       cp   $91
7755: D0          ret  nc
7756: DD 34 04    inc  (ix+$04)
7759: DD 7E 04    ld   a,(ix+$04)
775C: CB 2F       sra  a
775E: CD B4 7C    call $7CB4
7761: DD 7E 04    ld   a,(ix+$04)
7764: 3D          dec  a
7765: 47          ld   b,a
7766: E6 0F       and  $0F
7768: C0          ret  nz
7769: 21 77 77    ld   hl,$7777
776C: CB 60       bit  4,b
776E: 28 03       jr   z,$7773
7770: 21 7E 77    ld   hl,$777E
7773: CD 03 04    call $0403
7776: C9          ret

7785: DD 7E 03    ld   a,(ix+$03)
7788: FE 88       cp   $88
778A: D8          ret  c
778B: 20 2A       jr   nz,$77B7
778D: 3E 9D       ld   a,$9D
778F: 08          ex   af,af'
7790: 3E 89       ld   a,$89
7792: 01 02 03    ld   bc,$0302
7795: 11 49 89    ld   de,$8949
7798: CD 42 04    call $0442
779B: DD 36 07 05 ld   (ix+$07),$05
779F: DD 36 08 58 ld   (ix+$08),$58
77A3: DD 36 09 00 ld   (ix+$09),$00
77A7: DD 36 0A 60 ld   (ix+$0a),$60
77AB: DD 36 0B 00 ld   (ix+$0b),$00
77AF: DD 36 0C 00 ld   (ix+$0c),$00
77B3: DD 36 0D 00 ld   (ix+$0d),$00
77B7: DD 34 08    inc  (ix+$08)
77BA: DD 34 08    inc  (ix+$08)
77BD: DD CB 07 46 bit  0,(ix+$07)
77C1: 28 13       jr   z,$77D6
77C3: DD 35 0A    dec  (ix+$0a)
77C6: DD 35 0A    dec  (ix+$0a)
77C9: DD 7E 0A    ld   a,(ix+$0a)
77CC: FE 41       cp   $41
77CE: 30 0C       jr   nc,$77DC
77D0: DD CB 07 86 res  0,(ix+$07)
77D4: 18 06       jr   $77DC
77D6: DD 34 0A    inc  (ix+$0a)
77D9: DD 34 0A    inc  (ix+$0a)
77DC: 06 78       ld   b,$78
77DE: 0E 06       ld   c,$06
77E0: DD 56 08    ld   d,(ix+$08)
77E3: DD 5E 0A    ld   e,(ix+$0a)
77E6: CD 9D 02    call $029D
77E9: C9          ret
77EA: DD 7E 03    ld   a,(ix+$03)
77ED: FE 78       cp   $78
77EF: 30 60       jr   nc,$7851
77F1: FE 3C       cp   $3C
77F3: 28 19       jr   z,$780E
77F5: A7          and  a
77F6: 20 35       jr   nz,$782D
77F8: DD 36 07 04 ld   (ix+$07),$04
77FC: DD 36 08 26 ld   (ix+$08),$26
7800: DD 36 0A 18 ld   (ix+$0a),$18
7804: DD 36 0C 01 ld   (ix+$0c),$01
7808: DD 36 0D 10 ld   (ix+$0d),$10
780C: 18 1C       jr   $782A
780E: FD 7E 00    ld   a,(iy+$00)
7811: FE 06       cp   $06
7813: 38 02       jr   c,$7817
7815: 3E 05       ld   a,$05
7817: 87          add  a,a
7818: 87          add  a,a
7819: C6 0A       add  a,$0A
781B: DD 77 08    ld   (ix+$08),a
781E: DD 36 0A 0A ld   (ix+$0a),$0A
7822: DD 36 0C 01 ld   (ix+$0c),$01
7826: DD 36 0D 30 ld   (ix+$0d),$30
782A: CD B2 2C    call $2CB2
782D: DD E5       push ix
782F: DD 21 BD E1 ld   ix,$E1BD
7833: DD 34 07    inc  (ix+$07)
7836: DD 35 05    dec  (ix+$05)
7839: 20 0C       jr   nz,$7847
783B: DD 7E 06    ld   a,(ix+$06)
783E: E6 0F       and  $0F
7840: FE 0A       cp   $0A
7842: 30 03       jr   nc,$7847
7844: CD 5B 2C    call $2C5B
7847: FD E5       push iy
7849: CD 7C 2B    call $2B7C
784C: FD E1       pop  iy
784E: DD E1       pop  ix
7850: C9          ret
7851: DD 7E 03    ld   a,(ix+$03)
7854: FE 78       cp   $78
7856: 20 16       jr   nz,$786E
7858: DD CB 08 26 sla  (ix+$08)
785C: DD CB 08 26 sla  (ix+$08)
7860: DD CB 0A 26 sla  (ix+$0a)
7864: DD CB 0A 26 sla  (ix+$0a)
7868: DD 36 0C 00 ld   (ix+$0c),$00
786C: 18 06       jr   $7874
786E: DD 35 0A    dec  (ix+$0a)
7871: DD 34 0C    inc  (ix+$0c)
7874: DD 7E 0C    ld   a,(ix+$0c)
7877: E6 18       and  $18
7879: 0F          rrca
787A: 0F          rrca
787B: 0F          rrca
787C: FE 03       cp   $03
787E: 20 02       jr   nz,$7882
7880: 3E 01       ld   a,$01
7882: C6 06       add  a,$06
7884: 47          ld   b,a
7885: 0E 02       ld   c,$02
7887: DD 56 08    ld   d,(ix+$08)
788A: DD 5E 0A    ld   e,(ix+$0a)
788D: CD 9D 02    call $029D
7890: C9          ret
7891: DD 7E 03    ld   a,(ix+$03)
7894: FE 04       cp   $04
7896: D8          ret  c
7897: DD 7E 05    ld   a,(ix+$05)
789A: DD 34 05    inc  (ix+$05)
789D: FE 3C       cp   $3C
789F: 30 10       jr   nc,$78B1
78A1: 47          ld   b,a
78A2: E6 03       and  $03
78A4: C0          ret  nz
78A5: 78          ld   a,b
78A6: E6 3C       and  $3C
78A8: 0F          rrca
78A9: 0F          rrca
78AA: 21 CB 78    ld   hl,$78CB
78AD: CD 25 04    call $0425
78B0: C9          ret
78B1: 47          ld   b,a
78B2: E6 07       and  $07
78B4: C0          ret  nz
78B5: 78          ld   a,b
78B6: D6 40       sub  $40
78B8: E6 18       and  $18
78BA: 0F          rrca
78BB: 0F          rrca
78BC: 5F          ld   e,a
78BD: 16 00       ld   d,$00
78BF: 21 DE 78    ld   hl,$78DE
78C2: 19          add  hl,de
78C3: 5E          ld   e,(hl)
78C4: 23          inc  hl
78C5: 56          ld   d,(hl)
78C6: EB          ex   de,hl
78C7: CD 03 04    call $0403
78CA: C9          ret


7907: DD 34 06    inc  (ix+$06)
790A: DD 7E 02    ld   a,(ix+$02)
790D: FE 03       cp   $03
790F: 30 05       jr   nc,$7916
7911: DD CB 06 7E bit  7,(ix+$06)
7915: C0          ret  nz
7916: DD 7E 06    ld   a,(ix+$06)
7919: E6 0F       and  $0F
791B: C0          ret  nz
791C: DD CB 06 66 bit  4,(ix+$06)
7920: 20 18       jr   nz,$793A
7922: 3E A3       ld   a,$A3
7924: 08          ex   af,af'
7925: 3E D1       ld   a,$D1
7927: 01 03 03    ld   bc,$0303
792A: 11 EA 89    ld   de,$89EA
792D: CD 42 04    call $0442
7930: 01 03 02    ld   bc,$0203
7933: 11 E8 89    ld   de,$89E8
7936: CD 6C 04    call $046C
7939: C9          ret
793A: 3E AC       ld   a,$AC
793C: 08          ex   af,af'
793D: 3E D1       ld   a,$D1
793F: 01 03 03    ld   bc,$0303
7942: 11 E8 89    ld   de,$89E8
7945: CD 42 04    call $0442
7948: 01 03 02    ld   bc,$0203
794B: 11 EB 89    ld   de,$89EB
794E: CD 6C 04    call $046C
7951: C9          ret
7952: DD 7E 03    ld   a,(ix+$03)
7955: E6 1F       and  $1F
7957: 28 0D       jr   z,$7966
7959: FE 14       cp   $14
795B: C0          ret  nz
795C: 01 0A 02    ld   bc,$020A
795F: 11 7D 89    ld   de,$897D
7962: CD 6C 04    call $046C
7965: C9          ret
7966: CD 4F 05    call $054F
7969: C9          ret
796A: DD 7E 02    ld   a,(ix+$02)
796D: FE 05       cp   $05
796F: D2 51 7A    jp   nc,$7A51
7972: FE 04       cp   $04
7974: D2 04 7A    jp   nc,$7A04
7977: FE 03       cp   $03
7979: D2 F9 79    jp   nc,$79F9
797C: FE 02       cp   $02
797E: 30 5F       jr   nc,$79DF
7980: DD 34 02    inc  (ix+$02)
7983: DD 36 01 1E ld   (ix+$01),$1E
7987: DD 36 03 00 ld   (ix+$03),$00
798B: DD 36 05 00 ld   (ix+$05),$00
798F: CD 85 04    call $0485
7992: FD 35 04    dec  (iy+$04)
7995: FD 35 04    dec  (iy+$04)
7998: FD E5       push iy
799A: E1          pop  hl
799B: 11 1C 00    ld   de,$001C
799E: 19          add  hl,de
799F: 11 BA 88    ld   de,$88BA
79A2: CD 38 7C    call $7C38
79A5: FD 34 04    inc  (iy+$04)
79A8: 01 07 00    ld   bc,$0007
79AB: 09          add  hl,bc
79AC: 1B          dec  de
79AD: 1B          dec  de
79AE: CD 38 7C    call $7C38
79B1: FD 34 04    inc  (iy+$04)
79B4: 01 07 00    ld   bc,$0007
79B7: 09          add  hl,bc
79B8: 1B          dec  de
79B9: 1B          dec  de
79BA: CD 38 7C    call $7C38
79BD: 21 5D 7A    ld   hl,$7A5D
79C0: CD 03 04    call $0403
79C3: DD 7E 03    ld   a,(ix+$03)
79C6: CD B4 7C    call $7CB4
79C9: 3E A8       ld   a,$A8
79CB: 08          ex   af,af'
79CC: 3E 95       ld   a,$95
79CE: 01 04 04    ld   bc,$0404
79D1: 11 08 80    ld   de,$8008
79D4: CD 42 04    call $0442
79D7: 3E 1F       ld   a,$1F
79D9: 06 00       ld   b,$00
79DB: CD D9 02    call $02D9
79DE: C9          ret
79DF: DD 35 03    dec  (ix+$03)
79E2: DD 7E 03    ld   a,(ix+$03)
79E5: CD B4 7C    call $7CB4
79E8: CD 6C 7A    call $7A6C
79EB: DD 7E 03    ld   a,(ix+$03)
79EE: FE 98       cp   $98
79F0: C0          ret  nz
79F1: DD 34 02    inc  (ix+$02)
79F4: DD 36 04 3C ld   (ix+$04),$3C
79F8: C9          ret
79F9: CD 6C 7A    call $7A6C
79FC: DD 35 04    dec  (ix+$04)
79FF: C0          ret  nz
7A00: DD 34 02    inc  (ix+$02)
7A03: C9          ret
7A04: DD 7E 03    ld   a,(ix+$03)
7A07: FE 68       cp   $68
7A09: 28 14       jr   z,$7A1F
7A0B: FE 98       cp   $98
7A0D: 20 29       jr   nz,$7A38
7A0F: 3E B8       ld   a,$B8
7A11: 08          ex   af,af'
7A12: 3E 89       ld   a,$89
7A14: 01 04 04    ld   bc,$0404
7A17: 11 68 82    ld   de,$8268
7A1A: CD 42 04    call $0442
7A1D: 18 19       jr   $7A38
7A1F: 3E C8       ld   a,$C8
7A21: 08          ex   af,af'
7A22: 3E 91       ld   a,$91
7A24: 01 04 04    ld   bc,$0404
7A27: 11 A8 81    ld   de,$81A8
7A2A: CD 42 04    call $0442
7A2D: 3E 89       ld   a,$89
7A2F: 01 04 05    ld   bc,$0504
7A32: 11 28 81    ld   de,$8128
7A35: CD 42 04    call $0442
7A38: DD 35 03    dec  (ix+$03)
7A3B: DD 7E 03    ld   a,(ix+$03)
7A3E: CD B4 7C    call $7CB4
7A41: CD 6C 7A    call $7A6C
7A44: DD 7E 03    ld   a,(ix+$03)
7A47: A7          and  a
7A48: C0          ret  nz
7A49: DD 34 02    inc  (ix+$02)
7A4C: DD 36 04 4A ld   (ix+$04),$4A
7A50: C9          ret
7A51: CD 6C 7A    call $7A6C
7A54: DD 35 04    dec  (ix+$04)
7A57: C0          ret  nz
7A58: DD 36 02 00 ld   (ix+$02),$00
7A5C: C9          ret
7A5D: 51          ld   d,c
7A5E: 89          adc  a,c
7A5F: 2C          inc  l
7A60: 0B          dec  bc
7A61: 1F          rra
7A62: 0E 1B       ld   c,$1B
7A64: 22 29 10    ld   ($1029),hl
7A67: 18 18       jr   $7A81
7A69: 0D          dec  c
7A6A: 29          add  hl,hl
7A6B: 25          dec  h
7A6C: DD 34 05    inc  (ix+$05)
7A6F: DD 7E 05    ld   a,(ix+$05)
7A72: E6 0F       and  $0F
7A74: C0          ret  nz
7A75: DD CB 05 66 bit  4,(ix+$05)
7A79: 20 19       jr   nz,$7A94
7A7B: 21 AD 7A    ld   hl,$7AAD
7A7E: CD 03 04    call $0403
7A81: DD 7E 03    ld   a,(ix+$03)
7A84: FE 98       cp   $98
7A86: D0          ret  nc
7A87: CD D4 03    call $03D4
7A8A: DD 7E 03    ld   a,(ix+$03)
7A8D: FE 48       cp   $48
7A8F: D0          ret  nc
7A90: CD D4 03    call $03D4
7A93: C9          ret
7A94: 21 C7 7A    ld   hl,$7AC7
7A97: CD 03 04    call $0403
7A9A: DD 7E 03    ld   a,(ix+$03)
7A9D: FE 98       cp   $98
7A9F: D0          ret  nc
7AA0: CD D4 03    call $03D4
7AA3: DD 7E 03    ld   a,(ix+$03)
7AA6: FE 48       cp   $48
7AA8: D0          ret  nc
7AA9: CD D4 03    call $03D4
7AAC: C9          ret
7AAD: 08          ex   af,af'
7AAE: 80          add  a,b
7AAF: 95          sub  l
7AB0: 04          inc  b
7AB1: A8          xor  b
7AB2: AC          xor  h
7AB3: B0          or   b
7AB4: B4          or   h
7AB5: 88          adc  a,b
7AB6: 82          add  a,d
7AB7: 89          adc  a,c
7AB8: 03          inc  bc
7AB9: 02          ld   (bc),a
7ABA: BC          cp   h
7ABB: BD          cp   l
7ABC: C0          ret  nz
7ABD: C1          pop  bc
7ABE: C4 C5 28    call nz,$28C5
7AC1: 81          add  a,c
7AC2: 89          adc  a,c
7AC3: 01 02 D8    ld   bc,$D802
7AC6: D9          exx
7AC7: 08          ex   af,af'
7AC8: 80          add  a,b
7AC9: 15          dec  d
7ACA: 04          inc  b
7ACB: F9          ld   sp,hl
7ACC: FA FB FC    jp   m,$FCFB
7ACF: 88          adc  a,b
7AD0: 82          add  a,d
7AD1: 89          adc  a,c
7AD2: 03          inc  bc
7AD3: 02          ld   (bc),a
7AD4: EC ED EE    call pe,$EEED
7AD7: EF          rst  $28
7AD8: F0          ret  p
7AD9: F1          pop  af
7ADA: 28 81       jr   z,$7A5D
7ADC: 89          adc  a,c
7ADD: 01 02 F2    ld   bc,$F202
7AE0: F3          di
7AE1: DD 7E 02    ld   a,(ix+$02)
7AE4: FE 07       cp   $07
7AE6: D2 A7 7B    jp   nc,$7BA7
7AE9: CD 85 04    call $0485
7AEC: CD A1 06    call $06A1
7AEF: 3A 83 80    ld   a,($8083)
7AF2: 01 02 02    ld   bc,$0202
7AF5: 21 CF 81    ld   hl,$81CF
7AF8: CD 5C 04    call $045C
7AFB: 3A 83 84    ld   a,($8483)
7AFE: 01 02 02    ld   bc,$0202
7B01: 21 CF 85    ld   hl,$85CF
7B04: CD 5C 04    call $045C
7B07: 11 2A 81    ld   de,$812A
7B0A: 01 0D 03    ld   bc,$030D
7B0D: CD 6C 04    call $046C
7B10: 11 93 80    ld   de,$8093
7B13: 01 18 0A    ld   bc,$0A18
7B16: CD 6C 04    call $046C
7B19: FD E5       push iy
7B1B: E1          pop  hl
7B1C: 11 2A 00    ld   de,$002A
7B1F: 19          add  hl,de
7B20: 11 BA 88    ld   de,$88BA
7B23: CD 38 7C    call $7C38
7B26: 21 B0 7B    ld   hl,$7BB0
7B29: CD 03 04    call $0403
7B2C: CD 03 04    call $0403
7B2F: CD 03 04    call $0403
7B32: FD E5       push iy
7B34: E1          pop  hl
7B35: 23          inc  hl
7B36: 11 B7 89    ld   de,$89B7
7B39: 0E 2C       ld   c,$2C
7B3B: CD A1 03    call $03A1
7B3E: 23          inc  hl
7B3F: 0E 2C       ld   c,$2C
7B41: CD 90 7C    call $7C90
7B44: FD E5       push iy
7B46: E1          pop  hl
7B47: 23          inc  hl
7B48: 11 91 E0    ld   de,$E091
7B4B: 01 03 00    ld   bc,$0003
7B4E: ED B0       ldir
7B50: FD 46 04    ld   b,(iy+$04)
7B53: CD D3 7B    call $7BD3
7B56: 21 94 E0    ld   hl,$E094
7B59: 11 B5 89    ld   de,$89B5
7B5C: 0E 22       ld   c,$22
7B5E: CD A1 03    call $03A1
7B61: FD 56 05    ld   d,(iy+$05)
7B64: FD 5E 06    ld   e,(iy+$06)
7B67: CD 1E 7C    call $7C1E
7B6A: 21 91 E0    ld   hl,$E091
7B6D: 36 00       ld   (hl),$00
7B6F: 23          inc  hl
7B70: 72          ld   (hl),d
7B71: 23          inc  hl
7B72: 73          ld   (hl),e
7B73: FD 46 04    ld   b,(iy+$04)
7B76: CD D3 7B    call $7BD3
7B79: 21 94 E0    ld   hl,$E094
7B7C: 11 91 E0    ld   de,$E091
7B7F: 01 03 00    ld   bc,$0003
7B82: ED B0       ldir
7B84: 06 60       ld   b,$60
7B86: CD D3 7B    call $7BD3
7B89: 21 92 E0    ld   hl,$E092
7B8C: 3A 96 E0    ld   a,($E096)
7B8F: 77          ld   (hl),a
7B90: 11 75 8A    ld   de,$8A75
7B93: 0E 22       ld   c,$22
7B95: CD 90 7C    call $7C90
7B98: 3E 1F       ld   a,$1F
7B9A: 06 00       ld   b,$00
7B9C: CD D9 02    call $02D9
7B9F: DD 34 02    inc  (ix+$02)
7BA2: DD 36 01 F0 ld   (ix+$01),$F0
7BA6: C9          ret
7BA7: DD 36 02 00 ld   (ix+$02),$00
7BAB: DD 36 01 B4 ld   (ix+$01),$B4
7BAF: C9          ret
7BB0: B7          or   a
7BB1: 88          adc  a,b
7BB2: 2C          inc  l
7BB3: 05          dec  b
7BB4: 1D          dec  e
7BB5: 18 1D       jr   $7BD4
7BB7: 0A          ld   a,(bc)
7BB8: 15          dec  d
7BB9: B5          or   l
7BBA: 88          adc  a,b
7BBB: 22 07 0A    ld   ($0A07),hl
7BBE: 1F          rra
7BBF: 0E 1B       ld   c,$1B
7BC1: 0A          ld   a,(bc)
7BC2: 10 0E       djnz $7BD2
7BC4: 4B          ld   c,e
7BC5: 89          adc  a,c
7BC6: 3E 0B       ld   a,$0B
7BC8: 20 18       jr   nz,$7BE2
7BCA: 17          rla
7BCB: 0D          dec  c
7BCC: 0E 1B       ld   c,$1B
7BCE: 0F          rrca
7BCF: 1E 15       ld   e,$15
7BD1: 29          add  hl,hl
7BD2: 25          dec  h
7BD3: 21 93 E0    ld   hl,$E093
7BD6: 11 94 E0    ld   de,$E094
7BD9: AF          xor  a
7BDA: 12          ld   (de),a
7BDB: 13          inc  de
7BDC: 12          ld   (de),a
7BDD: 13          inc  de
7BDE: 12          ld   (de),a
7BDF: B8          cp   b
7BE0: 20 02       jr   nz,$7BE4
7BE2: 06 99       ld   b,$99
7BE4: 7E          ld   a,(hl)
7BE5: 90          sub  b
7BE6: 27          daa
7BE7: 77          ld   (hl),a
7BE8: 2B          dec  hl
7BE9: 7E          ld   a,(hl)
7BEA: DE 00       sbc  a,$00
7BEC: 27          daa
7BED: 77          ld   (hl),a
7BEE: 2B          dec  hl
7BEF: 7E          ld   a,(hl)
7BF0: DE 00       sbc  a,$00
7BF2: 27          daa
7BF3: 77          ld   (hl),a
7BF4: 23          inc  hl
7BF5: 23          inc  hl
7BF6: 38 15       jr   c,$7C0D
7BF8: 1A          ld   a,(de)
7BF9: C6 01       add  a,$01
7BFB: 27          daa
7BFC: 12          ld   (de),a
7BFD: 1B          dec  de
7BFE: 1A          ld   a,(de)
7BFF: CE 00       adc  a,$00
7C01: 27          daa
7C02: 12          ld   (de),a
7C03: 1B          dec  de
7C04: 1A          ld   a,(de)
7C05: CE 00       adc  a,$00
7C07: 27          daa
7C08: 12          ld   (de),a
7C09: 13          inc  de
7C0A: 13          inc  de
7C0B: 18 D7       jr   $7BE4
7C0D: 7E          ld   a,(hl)
7C0E: 80          add  a,b
7C0F: 27          daa
7C10: 77          ld   (hl),a
7C11: 2B          dec  hl
7C12: 7E          ld   a,(hl)
7C13: CE 00       adc  a,$00
7C15: 27          daa
7C16: 77          ld   (hl),a
7C17: 2B          dec  hl
7C18: 7E          ld   a,(hl)
7C19: CE 00       adc  a,$00
7C1B: 27          daa
7C1C: 77          ld   (hl),a
7C1D: C9          ret
7C1E: 06 3C       ld   b,$3C
7C20: 21 00 00    ld   hl,$0000
7C23: 7A          ld   a,d
7C24: CD 2F 7C    call $7C2F
7C27: 10 FA       djnz $7C23
7C29: 7B          ld   a,e
7C2A: CD 2F 7C    call $7C2F
7C2D: EB          ex   de,hl
7C2E: C9          ret
7C2F: 85          add  a,l
7C30: 27          daa
7C31: 6F          ld   l,a
7C32: 7C          ld   a,h
7C33: CE 00       adc  a,$00
7C35: 27          daa
7C36: 67          ld   h,a
7C37: C9          ret
7C38: D5          push de
7C39: E5          push hl
7C3A: 21 89 7C    ld   hl,$7C89
7C3D: CD 07 04    call $0407
7C40: 21 C0 00    ld   hl,$00C0
7C43: 19          add  hl,de
7C44: EB          ex   de,hl
7C45: FD E5       push iy
7C47: E1          pop  hl
7C48: 01 04 00    ld   bc,$0004
7C4B: 09          add  hl,bc
7C4C: AF          xor  a
7C4D: 06 02       ld   b,$02
7C4F: 0E 09       ld   c,$09
7C51: CD A4 03    call $03A4
7C54: E1          pop  hl
7C55: E5          push hl
7C56: 0E 09       ld   c,$09
7C58: CD A1 03    call $03A1
7C5B: 0E 09       ld   c,$09
7C5D: CD 90 7C    call $7C90
7C60: 23          inc  hl
7C61: 7B          ld   a,e
7C62: E6 1F       and  $1F
7C64: 87          add  a,a
7C65: 87          add  a,a
7C66: 87          add  a,a
7C67: C6 04       add  a,$04
7C69: 5F          ld   e,a
7C6A: 16 D0       ld   d,$D0
7C6C: 7E          ld   a,(hl)
7C6D: A7          and  a
7C6E: 28 0E       jr   z,$7C7E
7C70: 87          add  a,a
7C71: 4F          ld   c,a
7C72: 06 00       ld   b,$00
7C74: 21 7F 7C    ld   hl,$7C7F
7C77: 09          add  hl,bc
7C78: 46          ld   b,(hl)
7C79: 23          inc  hl
7C7A: 4E          ld   c,(hl)
7C7B: CD 9D 02    call $029D
7C7E: E1          pop  hl
7C7F: D1          pop  de
7C80: C9          ret
7C81: 2D          dec  l
7C82: 02          ld   (bc),a
7C83: 6E          ld   l,(hl)
7C84: 0D          dec  c
7C85: 69          ld   l,c
7C86: 07          rlca
7C87: 51          ld   d,c
7C88: 04          inc  b
7C89: 09          add  hl,bc
7C8A: 05          dec  b
7C8B: 1C          inc  e
7C8C: 0C          inc  c
7C8D: 0E 17       ld   c,$17
7C8F: 0E E5       ld   c,$E5
7C91: 21 20 00    ld   hl,$0020
7C94: 19          add  hl,de
7C95: EB          ex   de,hl
7C96: E1          pop  hl
7C97: AF          xor  a
7C98: 06 02       ld   b,$02
7C9A: CD A4 03    call $03A4
7C9D: 79          ld   a,c
7C9E: 12          ld   (de),a
7C9F: E5          push hl
7CA0: 21 00 04    ld   hl,$0400
7CA3: 19          add  hl,de
7CA4: 36 2D       ld   (hl),$2D
7CA6: 21 20 00    ld   hl,$0020
7CA9: 19          add  hl,de
7CAA: EB          ex   de,hl
7CAB: E1          pop  hl
7CAC: 3E 80       ld   a,$80
7CAE: 06 02       ld   b,$02
7CB0: CD A4 03    call $03A4
7CB3: C9          ret
7CB4: 21 00 E0    ld   hl,$E000
7CB7: CB 46       bit  0,(hl)
7CB9: 28 02       jr   z,$7CBD
7CBB: ED 44       neg
7CBD: 32 00 F8    ld   ($F800),a
7CC0: C9          ret
