library(cartography)

# Load data
data(nuts2006)

# get the figure ratio
sizes <- getFigDim(spdf = nuts0.spdf, width = 600, mar = c(0, 0, 1.2, 0), res = 150)
sizes[1] <- sizes[1] * 2
sizes[2] <- sizes[2] * 2
8 * 1094 / 1200


# save the maps in png format
# png(filename = "img/4mapsx.png", width = sizes[1], height = sizes[2], res = 150)
setEPS()
postscript("fig03.eps", width = 8, height = 7.3)

# set margins
opar <- par(mar = c(0, 0, 1.2, 0), mfrow = c(2, 2))

# Plot a layer with the extent of the EU28 countries with only a background
# color
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")

# Plot non european space
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# plot countries
plot(nuts0.spdf, col = "#D1914D", border = "white", lwd = 0.5, add = TRUE)

# transform to thousand of inhabitants
nuts0.df$pop <- nuts0.df$pop2008/1000

# Plot the population
propSymbolsLayer(spdf = nuts0.spdf, df = nuts0.df, inches = 0.125, lwd = 0.5, 
                 var = "pop", legend.pos = "right", legend.values.rnd = 0, 
                 legend.title.txt = "Population, 2008\n(thousands of inh.)", 
                 legend.frame = F)
# Layout plot
layoutLayer(title = "propSymbolsLayer()", author = "", sources = "", frame = FALSE, 
            scale = NULL, theme = "wine.pal", north = TRUE)  # add a south arrow


# compute the GDP per inhabitants
nuts0.df$gdpinh <- nuts0.df$gdppps2008 * 1e+06/nuts0.df$pop2008

# Plot a layer with the extent of the EU28 countries with only a background
# color
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")

# Plot non european space
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# plot the gdp per inhabitant
choroLayer(spdf = nuts0.spdf, df = nuts0.df, var = "gdpinh", 
           col = carto.pal(pal1 = "green.pal", n1 = 4), 
           method = "quantile", nclass = 4, border = "white", lwd = 0.5, legend.pos = "right", 
           legend.title.txt = "GDP per inh., 2008\n(euros)", add = T)

layoutLayer(title = "choroLayer()", author = "", sources = "", frame = FALSE, 
            scale = NULL, theme = "green.pal", north = FALSE)



# Plot a layer with the extent of the EU28 countries with only a background
# color
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")

# Plot non european space
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# Plot the gdp per inhabitant
choroLayer(spdf = nuts0.spdf, df = nuts0.df, var = "gdpinh", col = carto.pal(pal1 = "sand.pal", 
                                                                             n1 = 4), method = "quantile", nclass = 4, border = "white", lwd = 0.5, legend.pos = "right", 
           legend.title.txt = "GDP per inh., 2008\n(euros)", add = T)

# Plot the population
propSymbolsLayer(spdf = nuts0.spdf, df = nuts0.df, inches = 0.125, lwd = 1.25, 
                 var = "pop", col = NA, border = "#940000", legend.pos = "topright", legend.values.rnd = 0, 
                 legend.title.txt = "Population, 2008\n(thousands of inh.)", legend.frame = F)

# layout
layoutLayer(title = "propSymbolsLayer() + choroLayer()", author = "Package cartography v1.4.1", 
            sources = "Source: Eurostat, 2011", frame = FALSE, scale = NULL, theme = "sand.pal", 
            north = FALSE)




# Plot a layer with the extent of the EU28 countries with only a background
# color
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")

# Plot non european space
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# plot countries
plot(nuts0.spdf, col = "#EAE797", border = "white", lwd = 0.5, add = TRUE)

# Plot symbols with choropleth coloration
propSymbolsChoroLayer(spdf = nuts0.spdf, df = nuts0.df, var = "pop", inches = 0.2, 
                      var2 = "gdpinh", col = carto.pal(pal1 = "blue.pal", n1 = 4), symbols = "square", 
                      method = "quantile", nclass = 4, border = "grey50", lwd = 0.5, legend.var.pos = "topright", 
                      legend.var.values.rnd = 0, legend.var.title.txt = "Population, 2008\n(thousands of inh.)", 
                      legend.var.style = "e", legend.var2.pos = "right", legend.var2.values.rnd = 0, 
                      legend.var2.title.txt = "GDP per inh., 2008\n(euros)")


# layout
layoutLayer(title = "propSymbolsChoroLayer()", author = "", sources = "", frame = FALSE, 
            theme = "blue.pal", scale = 500, north = FALSE)

dev.off()


#########
library(cartography)
# Load data
data(nuts2006)

# Create a grid layer
mygrid <- getGridLayer(spdf = nuts3.spdf, cellsize = 1e+05, type = "hexagonal")

# Compute data for the grid layer
df1 <- getGridData(x = mygrid, df = nuts3.df, var = "pop2008")
df2 <- getGridData(x = mygrid, df = nuts3.df, var = "pop1999")

# Compute the compound annual growth rate
df1$cagr <- (((df1$pop2008/df2$pop1999)^(1/9)) - 1) * 100
v <- getBreaks(v = df1$cagr, method = "quantile", nclass = 10)
v[5] <- 0

# set a color palette
cols <- c("#f18b61", "#f7b48c", "#f3d9b7", "#f1eccd", "#c0dec2", "#91caa4", 
          "#63b285", "#329966", "#26734d", "#1a4c33")

# get the figure ratio
sizes <- getFigDim(spdf = nuts0.spdf, width = 1200, mar = c(0, 0, 1.2, 0))


# get the figure ratio
sizes <- getFigDim(spdf = nuts0.spdf, width = 600, mar = c(0, 0, 1.2, 0), res = 150)
sizes[1] <- sizes[1] * 2
sizes[2] <- sizes[2] * 2
8 * 1040 / 1200


# save the maps in png format
# png(filename = "img/4mapsx.png", width = sizes[1], height = sizes[2], res = 150)
setEPS()
postscript("fig04.eps", width = 8, height = 6.9)






# save the map in png format
# png(filename = "img/RegularGrid.png", width = sizes[1], height = sizes[2], res = 150)

# set margins
opar <- par(mar = c(0, 0, 1.2, 0), mfrow = c(1, 1))

# Plot a layer with the extent of the EU28 countries with only a background
# color
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")

# Plot non european space
plot(world.spdf, col = "#CCCCCC", border = NA, add = TRUE)

# plot the choropleth grid
choroLayer(spdf = mygrid$spdf, df = df1, var = "cagr", add = TRUE, col = cols, 
           lwd = 0.3, border = "grey80", legend.pos = "right", breaks = v, legend.values.rnd = 2, 
           legend.title.txt = "Compound Annual\nGrowth Rate")

# plot countries boundaries
plot(nuts0.spdf, add = T, col = NA, border = "#56514c", lwd = 0.7)

# Plot a layout
layoutLayer(title = "Demographic Trends, 1999-2008", author = "Package cartography v1.4.0", 
            sources = "Source: Eurostat, 2011", frame = TRUE, scale = 500, north = TRUE, 
            theme = "taupe.pal")
dev.off()






library(cartography)
# Load data
data(nuts2006)

# Get a SpatialLinesDataFrame of countries borders
nuts2.contig <- getBorders(nuts2.spdf)
nuts2.df$gdpcap <- nuts2.df$gdppps2008/nuts2.df$pop2008 * 1e+06

# # set figure ratio
# sizes <- getFigDim(spdf = nuts0.spdf, width = 1200, mar = c(0, 0, 1.2, 0))
# 
# # save the map in png format
# png(filename = "img/Discontinuities.png", width = sizes[1], height = sizes[2], 
#     res = 150)

setEPS()
postscript("fig05.eps", width = 8, height = 6.9)

# set margins
opar <- par(mar = c(0, 0, 1.2, 0))

# Plot a layer with the extent of the EU28 countries with only a background
# color
plot(nuts2.spdf, border = NA, col = NA, bg = "#A6CAE0")
# Plot non european space
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# Plot GDP per capita with a choropleth layer
choroLayer(spdf = nuts2.spdf, df = nuts2.df, var = "gdpcap", border = "grey20", 
           lwd = 0.0001, col = carto.pal(pal1 = "green.pal", n1 = 3, "sand.pal", 3), method = "quantile", 
           nclass = 6, add = TRUE, legend.pos = "right", legend.values.rnd = -2, legend.title.txt = "GDP per Capita\n(in euros)")

# Plot discontinuities
discLayer(spdf = nuts2.contig, df = nuts2.df, var = "gdpcap", type = "rel", 
          method = "equal", nclass = 3, threshold = 0.4, sizemin = 0.7, sizemax = 6, 
          col = "red", legend.values.rnd = 1, legend.title.txt = "Discontinuities in \nGDP per Capita\n(relative)", 
          legend.pos = "topright", add = TRUE)

# Layout
layoutLayer(title = "Wealth Disparities in Europe, 2008", author = "Package cartography v1.4.0", 
            sources = "Source: Eurostat, 2011", frame = TRUE, scale = 500, theme = "grey.pal", north =FALSE)
dev.off()






library(cartography)
# Load data
data(nuts2006)

# Create a grid layer
mygrid <- getGridLayer(spdf = nuts3.spdf, cellsize = 50000, type = "regular")

# transform gdp in euros
nuts3.df$gdp <- nuts3.df$gdppps2008 * 1e+06

# Compute data for the grid layer
df1 <- getGridData(x = mygrid, df = nuts3.df, var = "pop2008")
df2 <- getGridData(x = mygrid, df = nuts3.df, var = "gdp")
df1$gdp <- df2$gdp

# list of breaks
v <- c(2920, 5000, 10000, 15000, 20000, 23500, 30000, 35000, 40000, 42720)

# figure ratio
setEPS()
postscript("fig06.eps", width = 8, height = 6.9)

# set margins
opar <- par(mar = c(0, 0, 1.2, 0))

# Plot a layer with the extent of the EU28 countries with only a background
# color
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")

# Plot non european space
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# set a color palette
cols <- c(rev(carto.pal("green.pal", 5)), carto.pal("orange.pal", 4))

# compute & display the potential map
smoothLayer(spdf = mygrid$spdf, df = df1, var = "gdp", var2 = "pop2008", breaks = v, 
            span = 1e+05, beta = 2, mask = nuts0.spdf, resolution = 49000, col = cols, 
            legend.title.txt = "Potential\nGDP per capita\n(in euros)", legend.values.rnd = -2, 
            border = "grey80", lwd = 0.5, add = T, legend.pos = "topright")

# plot Europe contour
plot(rgeos::gBuffer(nuts0.spdf, FALSE, 1), add = T, col = NA, border = "grey50")

# plot a layout
layoutLayer(title = "Wealth Inequalities in Europe, 2008", author = "Package cartography v1.4.0", 
            sources = "Source: Eurostat, 2011", frame = TRUE, scale = 500, north = FALSE, 
            theme = "sand.pal")

# plot a text on the map
text(x = 6271272, y = 3743765, labels = "Distance function:\n- type = exponential\n- beta = 2\n- span = 100 km", 
     cex = 0.8, adj = 0, font = 3)

dev.off()