
--- Create Stored Procedure
CREATE PROCEDURE GetJobsByCountry
    @country_name VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Jobs
    WHERE country = @country_name;
END;

--- Test it 

EXEC GetJobsByCountry 'United States';



