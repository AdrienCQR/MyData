# Stone content

## Subtract stone content in soil

#Code ayant servi pour découper le raster "stone content" sur l'emprise de Murewha
#Application de la formule de BackTransformation
# les chemins ne correspondent pas au DEPOT Git

# import du raster
stone <- rast("D:/Mes Donnees/THESE/SIG/SIG_indicators/01_DATABASE/04_SOIL/ISDA_AFRICA/Stone_content/sol_log.wpg2_m_30m_0..20cm_2001..2017_v0.13_wgs84.tif")
# découper selon l'emprise de Murewha
xmin <- 31.2858
xmax <- 32.3483
ymin <- -18.3153
ymax <- -17.3068

murewhaExtent <- ext(xmin, xmax, ymin, ymax)
stone_Murewha <- crop(stone, murewhaExtent)
plot(stone_Murewha)

stone_Murewha
# calculer la formule de back transformation pour avoir les valeurs décimales
backTransformedRaster <- lapp(stone_Murewha, fun = function(x) expm1(x / 10))

plot(backTransformedRaster)

# Save the resulting soil organic carbon raster to a new file
writeRaster(backTransformedRaster, filename = "D:/Mes Donnees/THESE/SIG/SIG_indicators/02_ANALYSIS/03_SOIL_HEALTH/stone_content_Murewha.tif", filetype = "GTiff", overwrite = TRUE)
writeRaster(backTransformedRaster, filename = "D:/Mes Donnees/THESE/DEPOTS/MyData/Murewha_Zim/Soil/Stone/stone_content_Murewha.tif", filetype = "GTiff", overwrite = TRUE)
