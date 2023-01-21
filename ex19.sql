SELECT
    dateRep,
    SUM(cases) OVER (
        ROWS BETWEEN
            UNBOUNDED PRECEDING AND
            current row
        ) AS 'Cumulative UK cases',
    SUM(deaths) OVER (
        ROWS BETWEEN
            unbounded preceding AND
            current row
        ) AS 'Cumulative UK deaths'
FROM CoronavirusData WHERE countriesAndTerritories='United_Kingdom';