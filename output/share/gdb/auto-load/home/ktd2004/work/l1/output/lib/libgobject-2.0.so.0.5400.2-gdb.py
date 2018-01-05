import sys
import gdb

# Update module path.
dir_ = '/home/ktd2004/work/l1/output/share/glib-2.0/gdb'
if not dir_ in sys.path:
    sys.path.insert(0, dir_)

from gobject_gdb import register
register (gdb.current_objfile ())
