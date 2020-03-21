
import sys
import os
import shutil
from os import path
from shutil import copy
from datetime import datetime
# datetime object containing current date and time
now = datetime.now()
dt_string = now.strftime("%Y-%m-%d %H:%M:%S")
header_str = "###################################################\n#THIS IS A COMPUTER GENERATED FILE, DO NOT MODIFY.#\n#GENERATED: %s                   #\n###################################################\n" % (dt_string)
path = os.getcwd() + '/'
project_created = False
def main():
    os.mkdir(path + "sim")
    os.mkdir(path + "formal")
    fm_file = open(path + "formal/config.sby")
    fm_file.write(header_str)
    fm_file.write("[engines]\n")
    fm_file.write("smtbmc\n")
    fm_file.write("[tasks]\n")
    fm_file.write("prove\ncover\n")
    fm_file.write("[options]\n")
    fm_file.write("prove: mode prove\n")
    fm_file.write("prove: depth 128\n")
    fm_file.write("cover: mode cover\n")
    fm_file.write("cover: depth 128\n")
    fm_file.write("[files]\n")
    fm_file.write("[script]\n")


