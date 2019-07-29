#################Run the halo finder and merger tree for SIMBA#################

#!/usr/bin/env bash
# re-Run from the last successful snaps if brocken or killed the first run (in progress)
# if [ -f "./rockstar-galaxies/output/restart.cfg" ]; then
#     a=$(echo "$a" | sed -n '/^RESTART_SNAP =/ {s///p;q;}' restart.cfg)
#     sed -i "s/\(RESTART_SNAP =\).*/\1\ $a/" rockstar.cfg
# # else
# #     cp ../rockstar.cfg ./
# fi

# Remove last log outputs from previous runs. See the state if run in this file.
if [ -f "test_output.dat" ]; then
    rm test_output.dat
fi
echo 'Check the test_output.dat'
if [ -f "rockstar.cfg" ]; then
# quick run first
    ./rockstar-galaxies -c rockstar.cfg >> test_output.dat 2>&1 & sleep 20
    # main run
    ./rockstar-galaxies -c output/auto-rockstar.cfg  >> test_output.dat 2>&1
else
    echo 'rockstar.cfg not exist in the main directory'
fi

# If your first run was unsuccessful, its need to copy again the configuration file 'rockstar.cfg'
# rm  rockstar.cfg
# cp ./rockstar-galaxies/rockstar.cfg ./


if [ -f "./output/out_151.list" ]; then
# run the consistewnt tree
    echo 'Run first part'
    perl ./scripts/gen_merger_cfg.pl rockstar.cfg
#consistent_trees/
    # Follow the instruction printed at the end of running for generating the Merger Tree files
    # To generate a merger tree, change to the consistent_trees directory and run
    # make (already done at the first run)
    # perl do_merger_tree.pl ./rockstar-galaxies/output/outputs/merger_tree.cfg
fi
