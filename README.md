
# Map rendering test patterns

This repository contains a script generating a set of test patterns to
evaluate tiled map renderers regarding the quality of their rendering of
plain color polygons.

See [this blog post](http://blog.imagico.de/testing-client-side-map-renderers-on-polygons/) for more details.

![rendered test pattern](https://raw.github.com/imagico/testpatterns/data/supersampled_fullres.png)

## Prerequisites

The Bash script generating the pattern uses:

* Postgresql/Postgis (a database `gis2` is expected to be set up and access configured)
* GDAL/OGR for ogr2ogr and gdal_rasterize
* ImageMagick convert for resampling

## License

The script is available under the GNU GPL version 3.

The patterns the script generates are licensed under CC0.

## Authors

Christoph Hormann, [Imagico.de Geovisualizations](http://services.imagico.de/)

