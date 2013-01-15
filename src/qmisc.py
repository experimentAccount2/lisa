



import sys
sys.path.append("../extern/pycat/")
sys.path.append("../extern/pycat/extern/py3DSeedEditor/")

import numpy as np


import py3DSeedEditor
def manualcrop(data):

    pyed = py3DSeedEditor.py3DSeedEditor(data)
    pyed.show()
    nzs =  pyed.seeds.nonzero()
    crinfo = [
            [np.min(nzs[0]), np.max(nzs[0])],
            [np.min(nzs[1]), np.max(nzs[1])],
            [np.min(nzs[2]), np.max(nzs[2])],
            ]
    data = crop(data,crinfo)
    return data, crinfo


def crop(data, crinfo):
    return data[
            crinfo[0][0]:crinfo[0][1],
            crinfo[1][0]:crinfo[1][1],
            crinfo[2][0]:crinfo[2][1]
            ]
