SELECT CoronavirusData.countriesAndTerritories, CoronavirusData.dateRep, CoronavirusData.cases, CoronavirusData.deaths
FROM CoronavirusData
	LEFT JOIN Date ON CoronavirusData.dateRep=Date.dateRep
ORDER BY year,month,day ASC;