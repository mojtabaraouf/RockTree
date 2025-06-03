# RockTree: Rockstar and Consistent-Trees on SIMBA Simulations

This repository provides scripts to run the Rockstar halo finder and Consistent-Trees (Behroozi et al. 2013) on SIMBA meshless hydro-simulations.


## Requirements

Before running the scripts, ensure you have the following:

- A working installation of `hdf5` and `perl`.
- SIMBA simulation snapshots available in a specified directory.


## Installation and Usage

1. **Download and Setup:** Clone this repository and navigate to the `RockTree` directory.

2. **Configure Rockstar:**
   - Open `rockstar.cfg` and modify the `INBASE` parameter to point to the directory containing your SIMBA simulation snapshots.
   - Adjust other parameters in `rockstar.cfg` as needed (e.g., `NUM_WRITERS`, `FORK_PROCESSORS_PER_MACHINE`).  The default value for `FORK_PROCESSORS_PER_MACHINE` is 20.  Adjust this to match the number of processors available on your system.
   - Check the HDF5 library path in the `Makefile` to ensure it is correctly linked.

3. **Run the Download Script:** Execute the download and build script:

   ```bash
   sh Rock_download.sh
   ```

4. **Run Rockstar:** Navigate to the `rockstar-galaxies` directory and run:

   ```bash
   sh Rock.sh
   ```

5. **Run Consistent-Trees:**  Navigate to the `consistent-trees` directory.  You will need to create a `merger_tree.cfg` file specifying the input and output paths.  Then run:

   ```bash
   perl do_merger_tree.pl <path/to/merger_tree.cfg>
   ```

6. **Troubleshooting:** If you encounter any issues (e.g., Rockstar fails to start, or the run stops unexpectedly), please contact Mojtaba Raouf at mojtaba.raouf@gmail.com.  Provide details of the error message and your system configuration.



## References

- Behroozi, P. S., Wechsler, R. H., & Conroy, C. 2013, ApJ, 770, 57
