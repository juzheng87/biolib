
require 'biolib/staden_io_lib'

# $top_builddir/progs/srf2fasta $outdir/proc.srf > $outdir/slx.fasta 

datadir = '../../../../test/data/trace'
procsrffn = datadir+'/abi3700-ztr/1dJ671C13-2a01.q1c.ztr'
raise 'Error' if !File.exist?(procsrffn)
p Biolib::Staden_io_lib::TT_ANY;

result = Biolib::Staden_io_lib.read_reading(procsrffn,Biolib::Staden_io_lib::TT_ANY)
p result.format
p result.NBases
p result.base

raise 'Test failed' if result.NBases != 766
exit 0
