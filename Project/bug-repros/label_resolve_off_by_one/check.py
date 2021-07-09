import sys
import itertools

filename = sys.argv[1]

f = open(filename)
lines = iter(f.readlines())
addr = 1024
jmp_addr = None
for l in lines:
    l1, l2 = l.strip(), next(lines).strip()
    line = l1+" "+l2
    if len(line.strip()) == 0:
        break
    print(f"{addr}: {line}")

    if line.startswith("JMP"):
        jmp_addr = int(line.split()[-1])

    if addr == jmp_addr:
        s = line.split()[-1]\
                .strip('"')
        if s == "OK":
            sys.exit(0)
        elif s == "FAIL":
            sys.exit(-1)
        else:
            print("Something went wrong :/")

    addr += 2
