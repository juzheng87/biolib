
import sys

sys.path += ['../example']
print sys.path

import biolib_python_example

result = biolib_python_example.my_mod(7,3)
print result
sys.exit(0)