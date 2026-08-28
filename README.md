# Hurricane Effects on Stream Chemistry

## EDS 214: Analytical Workflow and Scientific Reproducibility
This repository houses the final project for the MEDS program at UCSB for the EDS 214 course that focuses on automating, documenting, and organizing workflow, as well as collaboration with peers. The main purpose of this repo is to contain all relevant and updated files that are associated with the creation off final proejct: a reproduced figure.

<center>
<img src="/images/road_map_to.png" alt="The Roadmap to Reproducibilty" width="500" height="500">
</center>

## Recreating a figure
<center>
<img src="/images/Schaefer_figure3.png" alt="Figure. 3. Concentrations in Bisley, Puerto Rico streams before and after Hurricane Hugo, 9-wk moving
averages. (a) potassium, (b) nitrate-N, (c) magnesium, (d) calcium and (e) ammonium-N. The vertical lines
mark the time of hurricane disturbance." width="500" height="500">
</center>

The final project is the reproduction of a graph, seen above, from the article by Douglas A. Schafer titled, "Effects of hurricane disturbance on stream water concentrations and fluxes in eight tropical forest watersheds of the Luquillo Experimental Forest, Puerto Rico". The final output is a graph with five chemical ions for each of the four observed sites over a 9 week average from the years between 1985 to 1995.

## Data folder 
The data folder hosts the data that was downloaded from the EDI portal, found here https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-luq.20.4923064, which contain multiple data packages based on the sites recorded and the respective chemical concentration levels after the hurricane.

The R data file inside the **R folder** defines the moving function inputting the values into a tibble after selecting columns and filtering through the time period, from 1988 to 1994.

The clean data titled **1_clean_data.R** contains the data for reading and finding the moving average from the raw data, binding the data, and pivoting longer.

The clean data can be found inside the **output folder** tited clean_data.csv.

The paper Quarto markdown inside the **paper folder** containing the 

The scratch file inside the **scratch folder** was used as a jumpstart platform and should be ignored, unless curious.

## Figure output
The figure output can be found in the folder inside figure_html which is in the docs folder inside the paper-files folder.

## Contributers and Peer Review
The author for this project on reproduction is Monique Hernandez.

This final project was peer reviewed by a fellow MEDS student, Sarah H, where her github repo can be found here: https://github.com/sarahhinkley/sah214final.
Kailani contributed to the 1_clean_data.R by creating the file and moving the code to the new file to automate it when rendering the Quarto markdown titled paper. Her github can be found here: https://github.com/sarahhinkley/sah214final.

William H. McDowell and USDA Forest Service for the raw data and research. Douglas Schaefer for the research article and the original figure that was reproduced.

## References
McDowell, William H., and USDA Forest Service. International Institute Of Tropical Forestry (IITF). 2024. “Chemistry of Stream Water from the Luquillo Mountains.” Environmental Data Initiative. https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458. 

Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. https://doi.org/10.1017/s0266467400001358. 