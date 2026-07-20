import re,pathlib

gamename = "mrdo"

# game_specific: replace or remove I/O addresses
# if not done it will write in ROM here!!
input_dict = {
"flipscreen_9800" : "",
"sound_1_9801" : "",
"sound_2_9802" : "",
"protection_byte_9803" : "",
}

single_line_to_cc_protect = {0x27A,0x0287,0x053a,0x3f68,0x3f75,0x477c,0x47d5,0x3e45,0x7c11}
remove_error_in_next_line = {0x27B,0x0289,0x1657,0x166a,0x2b29,0x3de7,0x3f69,0X3e46,
0x3f76,0x477e,0x48d1,0x5cec,0x3f7b,0x3df6,0x3e04,0x3e12,0x3e5b,0x3e71,0x47d6,0x48bd,0x48e7,0x2ada,
0x5486,0x7bf6,0x2ae2,0x2aea,0x2af2}
remove_error_in_prev_line = {0,0x014D,0x0138,0x141,0x37A,0x2be0,0x3df5,0x3E02,0x3e10}
line_to_push_cc_protect = {0x037a,0x3e02,0x3e10,0x3e58,0x7bfc,0x7bf3,0x7c16} | single_line_to_cc_protect
line_to_pull_cc_protect = {0x7c01,0x7c1b} | single_line_to_cc_protect
line_to_pull_cc_prev_protect = {0X3e04,0X3e12,0x3e5b,0x7bf6}


store_to_video = re.compile("GET_ADDRESS\s+(0x8\w\w\w|video_ram_d)",flags=re.I)   # game_specific





def remove_continuing_lines(lines,i):
    for j in range(i+1,i+4):
        if "[...]" in lines[j]:
            lines[j] = ""
        else:
            break


def get_line_address(line):
    try:
        toks = line.split("|")
        address = toks[1].strip(" [$").split(":")[0]
        return int(address,16)
    except (ValueError,IndexError):
        return None

def remove_continuing_lines(lines,i):
    for j in range(i+1,i+4):
        if "[...]" in lines[j]:
            lines[j] = ""
        else:
            break


def change_instruction(code,lines,i,continuing_lines=True):
    line = lines[i]
    toks = line.split("|")
    if len(toks)==2:
        toks[0] = f"\t{code}"
        if continuing_lines:
            remove_continuing_lines(lines,i)
        return " | ".join(toks)
    return line

def remove_error(line,ignore=False):
    if "ERROR" in line:
        return ""
    elif not ignore:
        raise Exception(f"No ERROR to remove in {line}")
    else:
        return line
def remove_instruction(lines,i,continuing_lines=True):
    return change_instruction("",lines,i,continuing_lines=continuing_lines)

def remove_continuing_lines(lines,i):
    for j in range(i+1,i+4):
        if "[...]" in lines[j]:
            lines[j] = ""
        else:
            break



def process_jump_table(line):

    m = re.search("\[nb_entries=(\d+)",line)
    if m:
        nb_entries = m.group(1)
        line = f"""\t.ifndef\tRELEASE
\tmove.w\t#{nb_entries},d7
\t.endif
"""+line

    return line

def get_original_instruction(line):
    toks = line.split("| [")
    if len(toks)==1:
        return ""
    inst = toks[1][7:].split("]")[0]
    return inst


def remove_code(pattern,lines,i):
    if pattern in lines[i]:
        lines[i] = remove_instruction(lines,i)
        remove_continuing_lines(lines,i)
    return lines[i]

def rebuild_lines(lines):
    return "".join(lines).splitlines(True)

def swap_lines(lines,i,j):
    lines[i],lines[j] = lines[j].rstrip()+ "| swapped\n",lines[i].rstrip()+ "| swapped\n"
    return lines[i]

def kill_code(lines,start_line,end_address):
    while True:
        address = get_line_address(lines[start_line])
        lines[start_line] = remove_instruction(lines,start_line)
        if "|" not in lines[start_line]:
            lines[start_line] = ""
        if address == end_address:
            break
        start_line+=1

def subt(m):
    tn = m.group(1)
    rn = m.group(2)
    offset = tn.split("_")[-1]
    rval = f"""
\t.ifndef\tRELEASE
\tmove.w\t#0x{offset},d{rn}
\t.endif
\tlea\t{tn},a{rn}"""
    return rval

equates = []
global_symbols = []
equates_re = re.compile("(\w+)\s*=\s*(\$?\w+)")
this_dir = pathlib.Path(__file__).absolute().parent

source_dir = this_dir / "../src"

rest_of_jump_table_code = """    MAKE_DE_NO_AR
    add.w    d4,d4
    add.w    d4,d4
    move.l  (a4,d4.w),a4
    jmp     (a4)
"""

# various dirty but at least automatic patches applying on the converted code
with open(source_dir / "conv.s") as f:
    lines = list(f)

    for i,line in enumerate(lines):
        m = equates_re.match(line)
        if m:
            equates.append(line)
            line = ""


##        elif "review stray daa" in line:
##            line = """\tCLR_XC_FLAGS
##\tmove.b\t(a0),d6
##\tabcd\td6,d0
##"""
        address = get_line_address(line)


        if "[return]" in line:
            if "MAKE_" in line:
                line = ""
            else:
                line = change_instruction("rts",lines,i)

        elif "[nop]" in line:
            line = remove_instruction(lines,i)

        elif "[push_function]" in line:
            toks = line.split()
            line = remove_instruction(lines,i)
            pa = toks[1].strip("#")
            lines[i+1] = change_instruction(f"pea\t{pa}",lines,i+1)
        elif "[breakpoint]" in line and address:
            line = f'\tBREAKPOINT "{address:04x}"\n{line}'

        elif "[cc_ok]" in line:
            if "rts" in line and "ret]" not in line: # conditional return
                lines[i-1] = remove_error(lines[i-1],True)
            else:
                lines[i+1] = remove_error(lines[i+1],True)


        line = process_jump_table(line)


        # pre-add video_address tag if we find a store instruction to an explicit 3000-3FFF address
        m = store_to_video.search(line)
        if m:
            g = m.group(1)
            okay = True
            if g.startswith("0x"):
                target_address = int(g,16)  # not used
                if "ix," not in line and "iy," not in line:
                    line = line.rstrip() + " [video_address]\n"

        if "[video_address" in line or "[unchecked_address" in line:
            if (",a2" in line or ",a3" in line) and "GET_ADDRESS" not in line:
                    # using indexed ix/iy: parse code to insert the proper dirty macro
                    toks = line.split()
                    toks = toks[1].split(",")
                    destreg = toks[2].strip("()")
                    destz = "IX" if destreg=="a2" else "IY"
                    offset = toks[1].strip("()")
                    line += f"\tVIDEO_BYTE_DIRTY_{destz}\t{offset}\n"
            else:
                # give me the original instruction
                line = line.replace("_ADDRESS","_UNCHECKED_ADDRESS")
                if "MAKE" in line:
                    line = re.sub(r"(MAKE_AR)",r"\1_UNCHECKED",line)
                    line = re.sub(r"(MAKE_[HDB]\w)",r"\1_UNCHECKED",line)
                elif "MAKE" in lines[i-1] and "UNCHECKED" not in lines[i-1]:
                    lines[i-1] = re.sub(r"(MAKE_AR)",r"\1_UNCHECKED",lines[i-1])
                    lines[i-1] = re.sub(r"(MAKE_[HDB]\w)",r"\1_UNCHECKED",lines[i-1])

                if "ldir" in line:
                    line = line.replace("ldir","ldir_video" if "[video_address" in line else "ldir_unchecked")
                elif "[video_address" in line:
                    if ",(a0)" in line or ("(a0)" in line and "clr.b" in line):
                        line += "\tVIDEO_BYTE_DIRTY | [...]\n"
                    elif (",(a0)" in lines[i+1] or ("(a0)" in  lines[i+1]  and "clr.b" in lines[i+1] )):
                        lines[i+1]  += "\tVIDEO_BYTE_DIRTY | [...]\n"
        if "[pop_stack]" in line:
            line = change_instruction("addq\t#4,sp",lines,i)

        line = re.sub("#(i[xy][hl])",r"\1",line)

        ###############################################
        # game_specific

        if "replace by EXG_A_A_PRIME" in line:
            lines[i-1] = "* just swap A/A'\n"+change_instruction("EXG_A_A_PRIME",lines,i-1)
            line = remove_error(line)
##        if "review stray cmp before MAKE_HL_NO_AR" in line:
##            # remove the errors now that the result is CC protected
##            line = remove_error(line)

        if "unsupported instruction im" in line:
            line = remove_error(line)
##        if "unsupported instruction out" in line:
##            line = remove_error(line)

        if address in [0,0x014D]:
            line = remove_instruction(lines,i)
        elif address == 0x00d5:
            line = change_instruction("lea\ttable_0156,a4",lines,i)
        elif address == 0x00e9:
            line = """
    move.l    (a4)+,d4                             | [$00e9: ld   e,(hl)] get parameter
    lea    (a6,d4.l),a2 |  [$00ee: pop  ix] now IX is the parameter
    move.l    (a4)+,a0                  | now a4 is the function
    addq      #4,d6
    MAKE_H
    btst.b    #7,(a2)                        | [$00f4: bit  7,(ix+$00)]
    jeq    l_0108                                 | [$00f8: jr   z,$0108]
    MAKE_BC_NO_AR                              | [$00fa: push bc]
    move.w    d2,-(a7)                            | [...]
    MAKE_HL_NO_AR                              | [$00fb: push hl]
    move.w    d6,-(a7)                            | [...]
    move.l    a3,-(a7)                            | [$00fc: push iy]
    pea    return_0104(pc)   | return address
    jmp       (a0)
"""

            kill_code(lines,i,0x0103)
        elif address == 0x0374:
            line = change_instruction("moveq\t#3-1,d1",lines,i)
        elif address == 0x037d:
            line = "\tPOP_SR\n"+change_instruction("dbf\td1,l_0377",lines,i)
        elif address == 0x0378:
            line = change_instruction("abcd\td7,d0",lines,i)
        elif address == 0x164f:
            line = """\tMAKE_HL    a0
\tbtst.b    #1,(3,a0)
"""
            kill_code(lines,i,0x1656)
        elif address == 0x1664:
            line = """\tMAKE_HL    a0
\tbtst.b    #0,(2,a0)
"""
            kill_code(lines,i,0x1669)

        elif address in {0x170a,0x2936,0x2961}:
            line += "\tscs\td7\n"
        elif address in {0x170f,0x293a,0x2965}:
            line = "\ttst.b\td7\n"+change_instruction("jeq\tl_1713",lines,i)
            lines[i+1] = remove_error(lines[i+1])
        elif address == 0x32f7:
            line = "\tlea    jump_table_3300,a4 |  [$32f7: ld   hl,jump_table_3300]\n"+rest_of_jump_table_code
            kill_code(lines,i,0x32FF)
        elif address == 0x3de5:
            line = """    MAKE_HL    a0
    exg    d3,d5                                  | [$3de6: ex   de,hl]
    exg    d4,d6                                  | [...]
    cmp.b    (a0),d0                                  | [$3de5: cp   (hl)]
"""
            kill_code(lines,i,0x3de6)
        elif address == 0x4e3b:
            line = "\tlea    jump_table_4e4c,a4 | [$4e3b: ld   hl,jump_table_4e4c]\n"+rest_of_jump_table_code
            kill_code(lines,i,0x4e43)
        elif address == 0x48C8:
            line = """    MAKE_HL\ta0
    move.b\t(2,a0),d0                                     | [$48c8: dec  hl]
    btst.b\t#5,(3,a0)
"""
            kill_code(lines,i,0x48d0)
        elif address == 0x4efe:
            line = "\tSET_C_FROM_X\n"+line
            lines[i+1] = remove_error(lines[i+1])
        elif address == 0x57F2:
            kill_code(lines,i,0x5800)
        elif address == 0x74ce:
            lines[i+2] = remove_error(lines[i+2])
        elif address == 0x2bdc:
            line = swap_lines(lines,i,i-1)
        elif address == 0x3f74:
            line += "\tsne\td7\n"
        elif address == 0x3f7a:
            line += "\ttst.b\td7\n"
        elif address in {0x53b6,0x53cc,0x53c1,0x53dc,0x53f5,0x4168,
        0x5159,0x5180}:
            line = line.replace("move.w","movem.w") + "\tPUSH_SR\n"
            lines[i+1] += "\tPOP_SR\n"
            lines[i+3] = remove_error(lines[i+3])
        elif address in {0x022e,0x7be7,0x7bed,0x7bf3,0x7bfc,0X7c02,0x7c08,0x7c16,0x7c1c}:
            lines[i-2] = remove_error(lines[i-2])
        elif address in {0x47d4,0x0138,0x0141}:
            # optim changed tst into CLR_XC_FLAGS because not followed by branch
            # anyway, flags are already okay because of previous move
            line = remove_instruction(lines,i)
        elif address == 0x049A:
            # remove protection test
            line = remove_instruction(lines,i)
        if "[data]" in line:
            line = line.replace("l_","0x")
        ###############################################
        if address in remove_error_in_prev_line:
            lines[i-1] = remove_error(lines[i-1].strip()+f" ({address:04x})")
        if address in remove_error_in_next_line:
            lines[i+1] = remove_error(lines[i+1].strip()+f" ({address:04x})")
        if address in line_to_pull_cc_protect:
            # protect the sub instructions if any
            for j in range(i+1,len(lines)):
                if not "[...]" in lines[j]:
                    break

            lines[j-1] += "\tPOP_SR\n"
            if j-1==i:
                line = lines[i]

        if address in line_to_push_cc_protect:
            # protect the sub instructions
            line = "\tPUSH_SR\n"+line
        if address in line_to_pull_cc_prev_protect:
            # protect the sub instructions
            line = "\tPOP_SR\n"+line

        if "GET_ADDRESS" in line:
            val = line.split()[1].split(",")[0]
            osd_call = input_dict.get(val)
            if osd_call is not None:

                if osd_call:
                    if isinstance(osd_call,list):
                        # choose depending on read/write
                        if "a,(" in line:
                            osd_call = osd_call[1]
                        else:
                            osd_call = osd_call[0]
                    if osd_call:
                        line = change_instruction(f"jbsr\tosd_{osd_call}",lines,i)
                    else:
                        line = remove_instruction(lines,i)
                else:
                    line = remove_instruction(lines,i)
                lines[i+1] = remove_instruction(lines,i+1)

        if "[global]" in line:
            label = line.split(":")[0]
            global_symbols.append(label)

        lines[i] = line

    # remove duplicate VIDEO_BYTE_DIRTY
    lines = rebuild_lines(lines)
    new_lines = []
    prev_line = ""
    for line in lines:
        if "VIDEO_BYTE_DIRTY" in line and "VIDEO_BYTE_DIRTY" in prev_line:
            pass
        else:
            new_lines.append(line)
        prev_line = line

with open(source_dir / "data.inc","w") as fw:
    fw.writelines(equates)

with open(source_dir / f"{gamename}.68k","w") as fw:

    fw.write(f"""\t.include "data.inc"
""")
    for g in global_symbols:
        fw.write(f"\t.global\t{g}\n")

    fw.writelines(new_lines)
