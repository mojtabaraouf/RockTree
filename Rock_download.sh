#################Download and make the Rockstar halo finder##################################
################## Make sure the lib in Makefile for HDF5 is correct#########################
################## Make sure the INBASE direction for data of you SIMULATION is correct######

# Before any run the sh file please do the following,

# 1. Open rockstar.cfg and change the "INBASE" to the directory of your snapshots files and "fname = m100n1024_<snap>.hdf5"
# 2. Change the other inputs like NUM_WRITERS = FORK_PROCESSORS_PER_MACHINE = number of proccessors (default = 20)"
# 2. Check the HDF5 lib in the Makefile
# 3. run sh Rock_download.sh
# 4. cd rockstar-galaxies and run Rock.sh
# 5. cd consistent-trees and run (perl do_merger_tree.pl  <path/to/merger_tree.cfg>)
# 6. Email me if the run stop with the unknown reason or do not start.

# Change the parameter file before run (in progress)
# sname=$(echo "\"name_of_server"\")
# path=$(echo "'\/path\/to\/SIMBA\/'") # e.g. \/User\/name\/data\/
# path=$(echo "'\/media\/mraouf\/mraouf2\/SIMBA\/'")
# fname=$(echo "\"snap_m50n512_<snap>.hdf5"\") # snap_m50n512 or snap_m100n1024
# Nproc=$(echo "20")  #Number of processor same as  NUM_WRITERS
# -----------------------------------------------
# sed -i "s/\(PARALLEL_IO_SERVER_ADDRESS =\).*/\1\ $sname/" rockstar.cfg
# sed -i "s/\(INBASE =\).*/\1\ $path/" rockstar.cfg
# sed -i "s/\(FILENAME =\).*/\1\ $fname/" rockstar.cfg
# sed -i "s/\(NUM_WRITERS =\).*/\1\ $Nproc/" rockstar.cfg
# sed -i "s/\(FORK_PROCESSORS_PER_MACHIN =\).*/\1\ $Nproc/" rockstar.cfg
echo '$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Making rockstar $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
# Download Rochstar-galaxies from the bitbucket repository
if [ ! -d "rockstar-galaxies" ]; then
    # Start to clone the rockstar repository
    git clone https://bitbucket.org/pbehroozi/rockstar-galaxies.git

    # Make sure the Makefile in rockstar addressed the hdf5 lib, correctly
    mkdir rockstar-galaxies/output
    cp rockstar.cfg ./rockstar-galaxies
    cp Rock.sh rockstar-galaxies/
    cp Makefile rockstar-galaxies/
    make with_hdf5 -C  ./rockstar-galaxies/
fi
echo '$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Making consistent-trees $$$$$$$$$$$$$$$$$$$$$$$$$$$'
if [ ! -d  "consistent-trees" ]; then
  # Start to clone the rockstar repository
  git clone https://bitbucket.org/pbehroozi/consistent-trees.git
  make -C  ./consistent-trees/
fi
