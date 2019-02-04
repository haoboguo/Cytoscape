# Cytoscape
 Cell family tree created by CytoScape

1. From the original data, select the trap you want to plot (here trap7, from 4261 to 4784, 525 entries)
2. The images with more than 2 cells will not be used in the tree; when there are more than 3 cells it will be less clear to track the mother cell against the daughter cells. Hence, only image numbers (IN) 25-132 will be selected. From the original csv file, use

$ cat traps.csv | sed 's/,/ /g' | awk '{print $3,$4,$5}' | sed 's/ /,/g' > filename.csv

Then only useful info will be kept including image number (IN), cell count (CC) and cell ID (ID).

3. Read the csv file, we will need the starting IN (a), the full length of mother cell (b+1); the starting IN of a daughter cell i (di), and the branch length of the di (bdi+1); then use the two scripts to get a sif file

$ ./sif.main.csh a b ##results in a file test.sif

$ ./sif.branch.csh di bdi #run for all i's  ## results in branch.sif

After that combine both sif files, and rename it

$ cat branch.sif >> test.sif

$ mv test.sif trap7.25-132.sif

4. Now the sif file can be loaded into CytoScape; using the circle layout will give the configuration shown in trap7.default.png; and it can be manually changed to a better config, e.g., trap7.25-132.png
