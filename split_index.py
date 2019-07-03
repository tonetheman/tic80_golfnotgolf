#!/usr/bin/python

""""
thought here is make it easy to break up the generated index.html from tic80
into something that is easier to deal with for js
no real reason
and the regex stuff is not working
""""

import re

SCRIPT_PAT = re.compile("<script type=\"text/javascript\">", re.MULTILINE)

inf = open("index.html","r")
data = inf.read()
inf.close()

print("len of data",len(data))
res = SCRIPT_PAT.findall(data)
print(res)

