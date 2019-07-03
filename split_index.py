#!/usr/bin/python

"""
thought here is make it easy to break up the generated index.html from tic80
into something that is easier to deal with for js
no real reason
and the regex stuff is not working
"""

import re

SCRIPT_PAT = re.compile("<script type=\"text/javascript\">(.*?)</script>", re.DOTALL)

inf = open("index.html","r")
data = inf.read()
inf.close()

print("len of data",len(data))
res = SCRIPT_PAT.findall(data)
print(len(res))
print("len of res[0]", len(res[0]))
print(res[0][0:80])

