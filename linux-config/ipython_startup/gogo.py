try:
    from pathlib import Path
except:
    pass

try:
    import morphio as mio
except:
    pass
try:
    import pandas as pd
except:
    pass
try:
    import numpy as np
except:
    pass
try:
    import neurom as nm
except:
    pass
try:
    import matplotlib.pyplot as plt
    from matplotlib.pyplot import ion
    ion()
except:
    pass

try:
    from morph_tool.morphdb import MorphDB

    new = MorphDB.from_neurondb(Path('new/neuronDB.xml'), label='new')
    old = MorphDB.from_neurondb(Path('old/neuronDB.xml'), label='old')
    db = old + new
    df = db.df
except:
    pass
