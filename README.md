# Hurricane Effects on Stream Chemistry

## EDS 214: Analytical Workflow and Scientific Reproducibility
This repository houses the final project for the MEDS program at UCSB for the EDS 214 course that focuses on automating, documenting, and organizing workflow, as well as collaboration with peers.

<center>
<img src="/images/road_map_to.png" alt="The Roadmap to Reproducibilty" width="500" height="500">
</center>

## Recreating a figure
<center>
<img src="/images/Schaefer_figure3.png" alt="Figure. 3. Concentrations in Bisley, Puerto Rico streams before and after Hurricane Hugo, 9-wk moving
averages. (a) potassium, (b) nitrate-N, (c) magnesium, (d) calcium and (e) ammonium-N. The vertical lines
mark the time of hurricane disturbance." width="500" height="500">
</center>

The final project reproduces figure 3 from the article titled, "Effects of hurricane disturbance on stream water concentrations and fluxes in eight tropical forest watersheds of the Luquillo Experimental Forest, Puerto Rico" by Schaefer (2000). The graph plots five chemical ions for each of the four observed sites over a 9 week average before and after the hurricane impact from the time period between 1985 to 1995.

## Data folder

The **data folder**, downloaded from Environmental Data Initiative (2024), are the following files:

- QuebradaCuenca1-Bisley.csv
- QuebradaCuenca2-Bisley.csv
- QuebradaCuenca3-Bisley.csv
- RioMameyesPuenteRoto.csv

The folders are organized as follows:

**R** contains the moving average function and other functions to data wrangle.

 **1_clean_data.R** contains data to inout into the moving average functiont after reading and binding the raw data, then pivoting longer with clean data.

**output** houses the clean_data.csv script named respectively.

**paper** contains the analysis on the process of reproducing a figure from outside, raw, unsorted data.

The scratch file inside the **scratch** was used as a jumpstart platform and should be ignored, unless curious.

Under **docs** the figure output is found inside paper-files titled, **figure-html**.

## Contributers and Peer Review

The author for this project on reproduction is Monique Hernandez.

Peer reviewed by a fellow MEDS student, Sarah Hinkley, where her github repo can be found here: https://github.com/sarahhinkley/sah214final.

Contribution by Kailani Latimer, moved code from Scratch.R to the 1_clean_data.R to shorthand the code into automation when the paper.qmd renders into an html website with a neat code chunk displayed. Her github can be found here: https://github.com/kailani-boop/kl214final

William H. McDowell and USDA Forest Service for the raw data and research.

Douglas Schaefer for the research article and the original figure that was reproduced.

Special thanks to the entire MEDS '27 cohort for working with me. Thank you Max and Ale for being there for troubleshooting and overall guidance during the making of this figure reproduction.

## References
McDowell, William H., and USDA Forest Service. International Institute Of Tropical Forestry (IITF). 2024. “Chemistry of Stream Water from the Luquillo Mountains.” Environmental Data Initiative. https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458. 

Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. https://doi.org/10.1017/s0266467400001358. 