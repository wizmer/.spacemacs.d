(defun imports ()
  "insert common imports"
  (interactive)
  (insert "import matplotlib.pyplot as plt\n")
  (insert "import numpy as np\n")
  (insert "import pandas as pd\n"))

(defun plt ()
  "insert matplotlib import"
  (interactive)
  (insert "import matplotlib.pyplot as plt\n"))

(defun np()
  "insert numpy import"
  (interactive)
  (insert "import numpy as np\n"))

(defun pd()
  "insert pandas import"
  (interactive)
  (insert "import pandas as pd\n"))

(defun walk()
  "insert a recursively walking alogirithm"
  (interactive)
  (insert
   "def walk(folder):
    import os
    for root, _, files in os.walk(folder):
        for file in files:
            yield os.path.join(root, file)"))
