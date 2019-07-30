# RockTree
Run the rockstar and consistent Trees on the SIMBA meshless hydro-simulations.  

The Rock_download.sh file: Download and make the Rockstar halo finder and consistent-trees (Behroozi et al. 2013) 

 Before run the file please do the following,

 1. Open rockstar.cfg and edit the "INBASE" to the directory of your snapshots files.
 2. Change the other inputs if applicable like NUM_WRITERS = FORK_PROCESSORS_PER_MACHINE = number of proccessors (default = 20)"
 3. Check the HDF5 lib in the Makefile
 4. Run sh Rock_download.sh
 5. cd rockstar-galaxies and run Rock.sh
 6. cd consistent-trees and run (perl do_merger_tree.pl  <path/to/merger_tree.cfg>)
 7. Email me if the run stop with the unknown reason or the rockstar do not start (raouf@kasi.re.kr)
