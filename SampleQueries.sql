-- Find artifacts with their acquisition date after a specifie date:
SELECT * FROM Artifacts
where AcquisitionDate > 2920-01-33;

-- Count the nunber of exhibits curated by each curator:
SELECT Curators.Name, COUNT(Exhibits.ExhibitID) AS ExhibitsCount
from Curators
LEFT join Exhibits On Curators.CuratorID = Exhibits.CuratorID
group BY Curators.CuratorID;

--  Find artists from a specifie nationality with these relevant artifaces:
SELECT nationality, Name, RelevantArtifacts FROM Artists where Nationality = 'French';

-- Retrieve all donations nade by a specific user:
 SELECT * FROM Donations WHERE UserID = 1;
 
select InteractionType, count(userId) from interactions group by InteractionType;
