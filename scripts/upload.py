#!/usr/bin/python3

import os
import base64
import requests
import pyperclip
import subprocess
from typing import List


API_KEY = "96bad31128eefd1426b9dca86317d847"
API_URL = "https://api.imgbb.com/1"
NIRLEP_POST_URL = "http://127.0.0.1:8000"


import argparse


parser = argparse.ArgumentParser(
    prog="File uploader",
    description="Upload any file to ImgBB",
)
parser.add_argument("-f", "--filename")
parser.add_argument("-t", "--time")


args = parser.parse_args()
img_data = b""
img_name = ""
img_time = int(args.time) if args.time is not None else 0

def notify(message: str) -> None:
    subprocess.Popen(["notify-send", message])

if args.filename is not None:
    try:
        with open(args.filename, "rb") as file:
            img_data = base64.b64encode(file.read())
            img_name = file.name.split("/")[-1]
    except OSError as e:
        print(f"ERROR: Unable to open file: {args.filename} because: {e}")
        exit(1)
else:
    files: List[os.DirEntry] = []
    with os.scandir("/home/nirlep/Screenshots/") as it:
        for entry in it:
            if entry.is_file():
                files.append(entry)

    files.sort(
        key=lambda file: file.stat().st_mtime,
        reverse=True
    )
    try:
        with open(files[0].path, "rb") as file:
            img_data = base64.b64encode(file.read())
            img_name = file.name.split("/")[-1]
    except OSError as e:
        print(f"ERROR: Unable to open file: {files[0].path} because: {e}")
        exit(1)


notify(f"Uploading {img_name}...")
# res = requests.post(
#     f"{API_URL}/upload?key={API_KEY}{('&expiration=' + str(img_time)) if img_time >= 60 else ''}", 
#     data={
#         "image": img_data
#     }
# )

res = requests.post(
    f"{NIRLEP_POST_URL}/upload",
    data={
        "image_data": img_data,
        "expiration": img_time
    }
)
print(res)

# data = res.json()
# if 'data' not in data:
#     print("ERROR: Unknown JSON received.")
#     exit(1)

# img_url = data['data']['url']
# pyperclip.copy(img_url)
# notify("Image uploaded, URL Copied!")

# if img_time >= 60:
#     notify(f"The URL will be expired after {img_time} seconds.")
