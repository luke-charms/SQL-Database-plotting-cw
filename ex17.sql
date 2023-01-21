SELECT CoronavirusData.countriesAndTerritories,
       round(((CAST(SUM(CoronavirusData.cases) as real)) / (CAST(CountryInfo.popData2020 as real)) * 100), 2) as '% cases of population',
       round(((CAST(SUM(CoronavirusData.deaths) as real)) / (CAST(CountryInfo.popData2020 as real)) * 100), 2) as '% deaths of population'
FROM CoronavirusData LEFT JOIN CountryInfo ON CoronavirusData.countriesAndTerritories=CountryInfo.countriesAndTerritories
GROUP BY CoronavirusData.countriesAndTerritories;