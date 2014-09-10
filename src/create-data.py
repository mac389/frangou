import sys,os,string,random

import numpy as np

from optparse import OptionParser

READ = 'rb'
WRITE = 'wb'
TAB='\t'

op = OptionParser()
op.add_option('--nvars', dest='nvars', type='int', help='Number of variables to generate correlations for')
op.print_help()

opts,args = op.parse_args()
if len(args) > 0:
	op.error('This script only takes arguments preceded by command line options.')
	sys.exit(1)

def gen_var_name(length=3):
	return ''.join(random.choice(string.ascii_letters) for _ in xrange(length))
    
data = 2*np.random.random(size=(opts.nvars,opts.nvars))-1
data += data.T
data /=2
savename ='../data/fake-data'

np.savetxt(savename+'.data',data,delimiter=TAB,fmt='%.04f')

print '%d by %d matrix of random numbers saved to %s'%(opts.nvars,opts.nvars,savename)

with open(savename+'.names',WRITE) as f:
    for _ in xrange(opts.nvars):
		print>>f,gen_var_name()
        
print '%d vars written to corresponding .names file'%opts.nvars