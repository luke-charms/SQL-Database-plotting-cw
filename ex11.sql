PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE CoronavirusData(
dateRep TEXT,
cases INTEGER,
deaths INTEGER,
countriesAndTerritories TEXT,
PRIMARY KEY(dateRep,countriesAndTerritories)
);
COMMIT;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Date(
dateRep TEXT,
day INTEGER,
month INTEGER,
year INTEGER,
PRIMARY KEY (dateRep)
);
COMMIT;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE CountryInfo(
countriesAndTerritories TEXT,
geoId TEXT,
countryterritoryCode TEXT,
popData2020 INTEGER,
continentExp TEXT,
PRIMARY KEY (countriesAndTerritories)
);
COMMIT;