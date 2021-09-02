#!/bin/bash
# ===========================================================
# script generating map rendering test patterns
# Copyright (C) 2021 Christoph Hormann <chris_hormann@gmx.de>
# Licensed under GPL v3,
# generated test patterns may be used under CC0
# ===========================================================

VT_EXTENT=4096
DB=gis2

test -d "data" || mkdir "data"

echo "DROP TABLE IF EXISTS test_patterns;
CREATE TABLE test_patterns (
  id            BIGSERIAL PRIMARY KEY,
  type          integer
);
SELECT AddGeometryColumn('test_patterns', 'way', 3857, 'MULTIPOLYGON', 2);" | psql -d $DB

echo "

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Difference(
  ST_TileEnvelope(0, 0, 0),
  ST_Union(ARRAY[
    ST_Translate(ST_Buffer(ST_TileEnvelope(0, 0, 0), -2000000), -4000000, 0),
    ST_Translate(ST_Buffer(ST_TileEnvelope(0, 0, 0), -1000000), 4000000, 0),
    ST_Translate(ST_Buffer(ST_TileEnvelope(0, 0, 0), -1000000), 0, -4000000),
    ST_Translate(ST_Buffer(ST_TileEnvelope(0, 0, 0), -1000000), 0, 4000000)
  ])
)), 0);

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, -750000 12000000, 750000 12000000, 0 0))'), 5500), 0, 55000)), 1);

INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 2*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 3*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 4*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 5*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 6*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 7*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 8*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 9*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 10*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 11*pi()/12), 2 FROM test_patterns WHERE type = 1;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, 12*pi()/12), 2 FROM test_patterns WHERE type = 1;

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Difference(
  ST_GeomFromText('POLYGON ((1000000 0, 1000000 -8000000, 5500000 -8000000, 5500000 0, 1000000 0))'),
  ST_Union(ARRAY[
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 -1400000, 6000000 -1000000)'), 320000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 -2400000, 6000000 -2000000)'), 160000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 -3400000, 6000000 -3000000)'), 80000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 -4400000, 6000000 -4000000)'), 40000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 -5400000, 6000000 -5000000)'), 20000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 -6400000, 6000000 -6000000)'), 10000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 -7400000, 6000000 -7000000)'), 5000, 7)
  ])
)), 3);

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Union(
  ST_GeomFromText('POLYGON ((1000000 0, 1000000 8000000, 2000000 8000000, 2000000 0, 1000000 0))'),
  ST_Union(ARRAY[
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 1400000, 5500000 1000000)'), 320000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 2400000, 5500000 2000000)'), 160000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 3400000, 5500000 3000000)'), 80000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 4400000, 5500000 4000000)'), 40000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 5400000, 5500000 5000000)'), 20000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 6400000, 5500000 6000000)'), 10000, 7),
    ST_Buffer(ST_GeomFromText('LINESTRING (2000000 7400000, 5500000 7000000)'), 5000, 7)
  ])
)), 4);

INSERT INTO test_patterns (way, type) VALUES (
ST_Intersection(
  ST_Union(ARRAY[
    ST_Difference(
      ST_Buffer(ST_GeomFromText('POINT(0 0)'), 12050000, 32),
      ST_Buffer(ST_GeomFromText('POINT(0 0)'), 12000000, 32)
    ),
    ST_Difference(
      ST_Buffer(ST_GeomFromText('POINT(0 0)'), 11900000, 32),
      ST_Buffer(ST_GeomFromText('POINT(0 0)'), 11700000, 32)
    ),
    ST_Difference(
      ST_Buffer(ST_GeomFromText('POINT(0 0)'), 11650000, 32),
      ST_Buffer(ST_GeomFromText('POINT(0 0)'), 11400000, 32)
    )
  ]),
  ST_GeomFromText('POLYGON ((1000000 -14000000, 1000000 14000000, 14000000 14000000, 14000000 -14000000, 1000000 -14000000))')
), 5);

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, 0)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, 40000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, 80000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, 120000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, 160000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, 200000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, -40000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, -80000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, -120000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, -160000)), 6);
INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 0, -200000)), 6);

UPDATE test_patterns SET way = ST_Translate(way, 1000000, -9000000) WHERE type = 6;

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(
ST_Translate(
ST_Union(ARRAY[
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, 0),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, 60000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, 120000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, 180000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, 240000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, 300000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, -60000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, -120000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, -180000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, -240000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 10000), 0, -300000),
ST_GeomFromText('POLYGON ((3000000 -300000, 3000000 300000, 3020000 300000, 3020000 -300000, 3000000 -300000))')
]), 1000000, -10000000)
), 6);

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, -450000 3500000, 450000 3500000, 0 0))'), 6000), 0, 60000)), 7);

INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -2*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -3*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -4*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -5*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -6*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -7*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -8*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -9*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -10*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -11*pi()/12), 8 FROM test_patterns WHERE type = 7;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, -12*pi()/12), 8 FROM test_patterns WHERE type = 7;

UPDATE test_patterns SET way = ST_Translate(way, 7000000, 0) WHERE type IN (7, 8);

INSERT INTO test_patterns (way, type) VALUES (
ST_Multi(
ST_Translate(
ST_Union(ARRAY[
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 0, 3000000 20000, 3000000 -20000, 0 0))'), 15000), 0, 0),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 40000, 3000000 20000, 3000000 -20000, 0 40000))'), 15000), 0, 80000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 80000, 3000000 20000, 3000000 -20000, 0 80000))'), 15000), 0, 160000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 120000, 3000000 20000, 3000000 -20000, 0 120000))'), 15000), 0, 240000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 160000, 3000000 20000, 3000000 -20000, 0 160000))'), 15000), 0, 320000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 200000, 3000000 20000, 3000000 -20000, 0 200000))'), 15000), 0, 400000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 -40000, 3000000 20000, 3000000 -20000, 0 -40000))'), 15000), 0, -80000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 -80000, 3000000 20000, 3000000 -20000, 0 -80000))'), 15000), 0, -160000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 -120000, 3000000 20000, 3000000 -20000, 0 -120000))'), 15000), 0, -240000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 -160000, 3000000 20000, 3000000 -20000, 0 -160000))'), 15000), 0, -320000),
ST_Translate(ST_Buffer(ST_GeomFromText('POLYGON ((0 -200000, 3000000 20000, 3000000 -20000, 0 -200000))'), 15000), 0, -400000),

ST_Buffer(ST_GeomFromText('LINESTRING (3000000 0, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 80000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 160000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 240000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 320000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 400000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 -80000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 -160000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 -240000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 -320000, 4000000 0)'), 10000),
ST_Buffer(ST_GeomFromText('LINESTRING (3000000 -400000, 4000000 0)'), 10000)
]), 1000000, 9000000)
), 9);

INSERT INTO test_patterns (way, type) VALUES (ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((-2000000 -1000000, -2000000 0, 0 0, 0 -1000000, -2000000 -1000000))'), 0, 14000000)), 10);
INSERT INTO test_patterns (way, type) VALUES (ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((2000000 -1000000, 2000000 0, 0 0, 0 -1000000, 2000000 -1000000))'), 0, 14000000)), 10);
INSERT INTO test_patterns (way, type) VALUES (ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((-2000000 1000000, -2000000 0, 0 0, 0 1000000, -2000000 1000000))'), 0, 14000000)), 10);
INSERT INTO test_patterns (way, type) VALUES (ST_Multi(ST_Translate(ST_GeomFromText('POLYGON ((2000000 1000000, 2000000 0, 0 0, 0 1000000, 2000000 1000000))'), 0, 14000000)), 10);

INSERT INTO test_patterns (way, type) SELECT ST_Rotate(ST_CollectionExtract(ST_Collect(way), 3), -pi()/3), 11 FROM test_patterns WHERE type = 10;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(way, pi()/7), 11 FROM test_patterns WHERE type = 10;
INSERT INTO test_patterns (way, type) SELECT ST_Rotate(ST_CollectionExtract(ST_Collect(way), 3), -pi()/7), 11 FROM test_patterns WHERE type = 10;

UPDATE test_patterns SET way = ST_Rotate(way, pi()/3) WHERE type = 10;

UPDATE test_patterns SET way = ST_Rotate(way, pi()/2) WHERE type IN (10, 11);

-- INSERT INTO test_patterns (way, type) SELECT ST_Translate(ST_Rotate(way, -pi()/10), 1500000, -8000000), 5 FROM test_patterns WHERE type = 3;
-- INSERT INTO test_patterns (way, type) SELECT ST_Translate(ST_Rotate(way, pi()/10), 1500000, 8000000), 6 FROM test_patterns WHERE type = 4;

" | psql -d $DB

echo "
WITH mvtgeom AS
(
  SELECT ST_AsMVTGeom(ST_Union(way), ST_TileEnvelope(0, 0, 0), extent => $VT_EXTENT) AS way
  FROM test_patterns
  WHERE way && ST_TileEnvelope(0, 0, 0)
)
SELECT encode(ST_AsMVT(mvtgeom.*, 'water', $VT_EXTENT, 'way', NULL), 'hex')
FROM mvtgeom;" | psql --quiet --tuples-only -d $DB | xxd -r -p > "data/0.mvt"

rm -f "data/test_patterns.geojson" "data/test_patterns_4326.geojson"

ogr2ogr -f GeoJSON "data/test_patterns.geojson" PG:"dbname='$DB'" "test_patterns"
ogr2ogr -t_srs EPSG:4326 -f GeoJSON "data/test_patterns_4326.geojson" PG:"dbname='$DB'" "test_patterns"

gdal_rasterize -ot BYTE -co COMPRESS=DEFLATE -ts 32768 32768 -te -20037508.342789244 -20037508.342789244 20037508.342789244 20037508.342789244 -init 255 -burn 0 -sql "SELECT * FROM test_patterns" PG:"dbname='$DB'" "data/supersampled_raw.tif"

convert -filter box -resize 512x512 "data/supersampled_raw.tif" "data/supersampled_fullres.png"
convert -filter Mitchell -resize 512x512 "data/supersampled_raw.tif" "data/supersampled_fullres_m.png"
rm -f "data/supersampled_raw.tif"
