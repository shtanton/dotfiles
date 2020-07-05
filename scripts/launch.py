#!/usr/bin/python3
import subprocess, config

FOREGROUND = "#EBDBB2"
BACKGROUND = "#282828"

def main():
    response = subprocess.run([
    	"bemenu", "-i", "-l", "10", "-p", "launch", "-m", "-1", "-P", "->",
    	"--tb", BACKGROUND, "--tf", FOREGROUND,
    	"--fb", BACKGROUND, "--ff", FOREGROUND,
    	"--nb", BACKGROUND, "--nf", FOREGROUND,
    	"--hb", BACKGROUND, "--hf", FOREGROUND,
    	"--sb", BACKGROUND, "--sf", FOREGROUND,
    ], input="\n".join(config.PROGRAMS), capture_output=True, encoding="utf-8")
    if response.returncode != 0:
        return
    config.PROGRAMS[response.stdout.strip()]()

main()
