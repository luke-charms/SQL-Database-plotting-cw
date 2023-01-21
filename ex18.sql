SELECT CoronavirusData.countriesAndTerritories,
       round(((CAST(SUM(CoronavirusData.deaths) as real)) / (CAST(SUM(CoronavirusData.cases) as real))) * 100, 2) as '$\%$ deaths of country cases'
FROM CoronavirusData LEFT JOIN CountryInfo ON CoronavirusData.countriesAndTerritories=CountryInfo.countriesAndTerritories
GROUP BY CoronavirusData.countriesAndTerritories ORDER BY 2 DESC
LIMIT 10;