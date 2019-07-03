#!/usr/bin/python

"""
thought here is make it easy to break up the generated index.html from tic80
into something that is easier to deal with for js
no real reason
and the regex stuff is not working
"""

import re

"""
re explanation: (?: is a non capturing group '|\" will match single or double quotes
DOTALL to get newlines
"""
SCRIPT_PAT = re.compile("<script type=(?:'|\")text/javascript(?:'|\")>(.*?)</script>", re.DOTALL)

inf = open("golf.lua.html","r")
data = inf.read()
inf.close()

"""
exported carts APPEAR to have two js sections that we want to replace
the first one has double quotes in the type tag and the second
(THE CART) has single quotes for the type tag
"""

res = SCRIPT_PAT.findall(data)
print("len of res",len(res))
print(res[0])

