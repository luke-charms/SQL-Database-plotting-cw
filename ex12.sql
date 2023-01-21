INSERT or IGNORE INTO CoronavirusData SELECT dateRep,cases,deaths,countriesAndTerritories FROM dataset;
INSERT or IGNORE INTO Date SELECT DISTINCT dateRep,day,month,year FROM dataset;
INSERT or IGNORE INTO CountryInfo SELECT DISTINCT countriesAndTerritories,geoId,countryterritoryCode,popData2020,continentExp FROM dataset;