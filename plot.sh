#!/bin/bash
mktemp -d testFolder
echo "SELECT
    dateRep,
    SUM(deaths) filter ( where countriesAndTerritories='United_Kingdom' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Italy' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='France' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Germany' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Poland' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Spain' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Romania' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Hungary' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Czechia' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row),
    SUM(deaths) filter ( where countriesAndTerritories='Bulgaria' ) OVER (
        ROWS BETWEEN unbounded preceding AND current row)
FROM CoronavirusData;" > testFolder/dataChooser.sql
sqlite3 coronavirus.db < testFolder/dataChooser.sql | sed 's/|/,/g' > testFolder/data.csv
echo "
set datafile separator ','
set xdata time
set timefmt '%d/%m/%Y'
set ylabel 'Cumulative Number of Deaths'
set xlabel 'Time'
set term png 
set output 'graph.png'
set terminal png size 1024,768
plot 'testFolder/data.csv' using 1:2 title 'United Kingdom' with lines, \
	'testFolder/data.csv' using 1:3 title 'Italy' with lines, \
	'testFolder/data.csv' using 1:4 title 'France' with lines, \
	'testFolder/data.csv' using 1:5  title 'Germany' with lines, \
	'testFolder/data.csv' using 1:6  title 'Poland' with lines, \
	'testFolder/data.csv' using 1:7 title 'Spain' with lines, \
	'testFolder/data.csv' using 1:8  title 'Romania' with lines, \
	'testFolder/data.csv' using 1:9  title 'Hungary' with lines, \
	'testFolder/data.csv' using 1:10  title 'Czechia' with lines, \
	'testFolder/data.csv' using 1:11  title 'Bulgaria' with lines
replot" > testFolder/dataPlotter.gnuplot
gnuplot testFolder/dataPlotter.gnuplot
rm -r testFolder