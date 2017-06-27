  
"La science est infaillible ; mais les savants se trompent toujours" 
(Anatole France, 1889)   
  

  
The assessment of scientific
results is possible through the availability of methods and data used by scientists,
and reproducibility is a key element to validate studies.
  

  
    
  The main idea behind
reproducible research is to release studies along with data and computer code that
support scientific findings (Peng 2011).
  
  
    
  We argue that maps, as other graphics or statistical outputs,
are part of scientific studies and should, as much as possible, be reproducible.
  
    
  We argue that in the reproducible research framework, researchers
must use literate programming solutions that enable the full traceability of their
studies. A script that describes every step of the process, from raw data to com-
  prehensive vector thematic maps that includes all statistical and geometrical
transformations, is considered a full metadata document.
  
  
    
  * Open Source (GNU General Public License)
* Initially design for statistics But a large number of packages are dedicated to 
spatial information management. 
  
  
    
  10762 packages in the *Comprehensive R Archive Network* (CRAN) (6 juin 2017)  
  
  
    
  The three next maps are more complex. Their production involves
geo-processing operations, usually scattered across multiple steps and intermediate
files. cartography simplifies the process by wrapping all operations in its
functions.
  
    
  The “grid-cell” representation is a method that overcomes the arbitrariness and
irregularity of administrative divisions. It highlights the main spatial trends by
splitting the territory in regular blocks. Statistical values are distributed over a
regular grid. Cell values are calculated taking into account the share of intersected
areas between initial units and grid cells, and are eventually discretized and the grid
is displayed as a choropleth map.
In cartography, this process relies on three functions. getGridLayer
builds a regular grid (squares or hexagons) based on a spatial object and provides
the shares of intersected areas. getGridData computes data that matches the grid
layer. Finally, choroLayer displays the grid on a choropleth map.
  
  
  
  
    
  Discontinuity maps are based on the variation of a phenomenon in contiguous
administrative units. This kind of representation does not focus on homogeneous
regions, but rather on spatial breaks. Here, the thickness of the borders points out
discontinuities intensities.
The first step to build these maps is to extract borders from contiguous spatial
units. The second step is to compute a discontinuity measure (either a ratio or an
                                                              absolute difference). The third step consists in applying various values to borders’
thickness. Combining these discontinuities with a choropleth representation helps
understanding the discontinuity direction (which one of two regions records the
                                           higher value).
In cartography, getBorders is used to extract borders between spatial
units. discLayer function computes and
displays discontinuities. A line’s width reflects the discontinuity level between two
neighboring units. The discontinuities layer can be supplemented by a choropleth
layer.
  
  
  
  
  
    
  Unlike choropleth maps that imply a phenomenon is spatially discrete, isopleth
maps are based on the assumption that a phenomenon is spatially continuous. These
maps use a spatial interaction modeling approach aiming at computing indicators
based on stock values weighted by distances. This spatial representation is independent 
from the initial heterogeneity of the territorial division. The
result is easy to read and can be considered as a bypass of the Modifiable Areal Unit
Problem (MAUP).
In cartography the smoothLayer function, that heavily depends on
SpatialPosition, allows a quick computation
of these maps. The function takes a marked point layer and a set of parameters (a
                                                                                spatial interaction function and its parameters) as inputs and displays an isopleth
map layer.
  