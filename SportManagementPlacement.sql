SELECT *
FROM Sheet1$

--Gather data for mapping in Tableau - latitude, longitude, title or position, organization affiliated with, type of organization

SELECT Latitude, Longitude, Organization, Title, [Type of Organization]
FROM Sheet1$
WHERE Latitude IS NOT NULL

--Change nulls to blanks - reads better in labeling

UPDATE Sheet1$
SET Title = ' '
WHERE Title IS NULL

UPDATE Sheet1$
SET [Type of Organization] = ' '
WHERE [Type of Organization] IS NULL

--Filter data for info specifically related to Sports Management students and internships

SELECT Year, Major, Sports
FROM Sheet1$
WHERE Major = 'Sport Management'
AND Year > 2000
AND Sports != 'All'
AND Sports IS NOT NULL
ORDER BY Year

-- Get Rid of nulls

UPDATE Sheet1$
SET Sports = ' '
WHERE Sports IS NULL

UPDATE Sheet1$
SET Year = ' '
WHERE Year IS NULL

UPDATE Sheet1$
SET Major = ' '
WHERE Major IS NULL

SELECT Latitude, Longitude, Placement, Organization, Title
FROM Sheet1$
WHERE Placement = 'Job'
AND Latitude IS NOT NULL

SELECT Year, COUNT(*) as YearlyPlacements
FROM Sheet1$
WHERE Major = 'Sport Management'
AND Year > 2000
GROUP BY Year


SELECT Year, ([Type of Organization])
FROM Sheet1$
WHERE Major = 'Sport Management'
ORDER BY Year

SELECT [Type of Organization], COUNT([Type of Organization]) AS NumberOfPlacements, Year
FROM Sheet1$
GROUP BY Year, [Type of Organization], Major
HAVING Major = 'Sport Management'
ORDER BY Year