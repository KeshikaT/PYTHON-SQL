--1&2
--database
create database PetCare

--table
create table Shelters(
ShelterID int primary key,
Name varchar(50) not null unique,
Location varchar(50) not null
);

create table Pets(
PetID int primary key,
Name varchar(50) not null unique,
Age int not null,
Breed varchar(25) not null,
Type varchar(10) not null,
AvailableForAdoption varchar(10) check(AvailableForAdoption in ('Yes','No')),
ShelterID int foreign key references Shelters(ShelterID)
);

create table Donations(
DonationID int primary key,
DonorName varchar(50) not null,
DonationType varchar(10),
DonationAmount int,
DonationItem varchar(25),
DonationDate date,
ShelterID int foreign key references Shelters(ShelterID)
);

create table AdoptionEvents(
EventID int primary key, 
EventName varchar(50),
EventDate date, 
Location varchar(50)
);

create table Participants(
ParticipantID int primary key,
ParticipantName varchar(50),
ParticipantType varchar(50), 
EventID int foreign key references AdoptionEvents(EventID)
);

-- insert data into Shelters
insert into Shelters (ShelterID, Name, Location) values
(1, 'Happy Paws Shelter', 'Mumbai'),
(2, 'Furry Friends Home', 'Delhi'),
(3, 'Safe Haven for Pets', 'Chennai'),
(4, 'Paw Haven', 'Bangalore'),
(5, 'Loving Tails Shelter', 'Kolkata');

-- insert data into Pets
insert into Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption, ShelterID) values
(101, 'Buddy', 2, 'Labrador', 'Dog', 'Yes', 1),
(102, 'Whiskers', 1, 'Persian', 'Cat', 'Yes', 2),
(103, 'Max', 5, 'Beagle', 'Dog', 'No', 1),
(104, 'Daisy', 3, 'Golden Retriever', 'Dog', 'Yes', 3),
(105, 'Luna', 4, 'Siamese', 'Cat', 'Yes', 1),
(106, 'Charlie', 6, 'Poodle', 'Dog', 'No', 4),
(107, 'Bella', 2, 'Bulldog', 'Dog', 'Yes', 5),
(108, 'Milo', 1, 'Tabby', 'Cat', 'Yes', 3);

-- insert data into Donations
insert into Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem, DonationDate, ShelterID) values
(201, 'John Doe', 'Money', 5000, NULL, '2024-02-15', 1),
(202, 'Alice Smith', 'Food', NULL, 'Dog Food', '2024-03-10', 2),
(203, 'Bob Johnson', 'Money', 3000, NULL, '2024-04-05', 3),
(204, 'Emma Brown', 'Toys', NULL, 'Cat Toys', '2024-02-20', 1),
(205, 'Liam Wilson', 'Money', 7000, NULL, '2024-05-12', 4),
(206, 'Sophia Green', 'Food', NULL, 'Cat Food', '2024-06-18', 5);

-- insert data into AdoptionEvents
insert into AdoptionEvents (EventID, EventName, EventDate, Location) values
(301, 'Spring Adoption Drive', '2024-03-20', 'Mumbai'),
(302, 'Pet Love Fest', '2024-04-15', 'Delhi'),
(303, 'Furry Friends Fair', '2024-05-10', 'Chennai'),
(304, 'Rescue & Rehome', '2024-06-25', 'Bangalore'),
(305, 'Paws for a Cause', '2024-07-08', 'Kolkata');

-- insert data into Participants
insert into Participants (ParticipantID, ParticipantName, ParticipantType, EventID) values
(401, 'Jane Doe', 'Adopter', 301),
(402, 'Tom Hardy', 'Volunteer', 302),
(403, 'Sarah Lee', 'Donor', 303),
(404, 'Mike Ross', 'Adopter', 301),
(405, 'Olivia Adams', 'Adopter', 304),
(406, 'Ethan Carter', 'Volunteer', 305);

--3 Retrieve Available Pets:
select Name, Age, Breed, Type
from Pets where AvailableForAdoption='Yes'

--4 Retrieve Event Participants
select ParticipantName, ParticipantType 
from Participants
where EventID=301

--5 Shelter Information 
create procedure UpdateShelterInfo
@p_ShelterID int,
@p_NewName varchar(50),
@p_NewLocation varchar(50)
as begin
update Shelters
set Name =@p_NewName, Location =@p_NewLocation
where ShelterID =@p_ShelterID;
end

--6 Shelter Donations
select s.Name, sum(d.DonationAmount) as Total_Donation
from Shelters s
join Donations d on s.ShelterID=d.ShelterID
group by s.Name

--7 Pets Without Owners
select PetID, Name, Age, Breed, Type
from Pets where ShelterID is null

--8 total donations per month and year.
select year(DonationDate) as year, month(DonationDate) as month, sum(DonationAmount) as TotalDonation
from Donations
group by year(DonationDate), month(DonationDate)
order by Year, Month

--9 distinct pet breeds where pets are aged between 1 and 3 years
--or older than 5 years
select distinct breed from Pets 
where age between 1 and 3 or Age>5

--10 all pets and their respective shelters 
--where pets are available for adoption
select p.Name,p.Age,p.Breed,p.Type,s.Name as ShelterName,s.Location
from Pets p
join Shelters s on p.ShelterID =s.ShelterID
where AvailableForAdoption='Yes'

--11 total number of participants in adoption events held in a specific city 
select count(ParticipantID) 
from Participants p
join AdoptionEvents ae on ae.EventID=p.EventID
where ae.Location='Mumbai'

--12 unique pet breeds for pets aged between 1 and 5 years
select distinct breed from Pets
where age between 1 and 5

--13 pets that have not been adopted
create table Adoptions(
AdoptionID int primary key,
PetID int unique foreign key references Pets(PetID),  
AdopterName varchar(100),
AdoptionDate date,
);

-- insert data into Adoptions
insert into Adoptions (AdoptionID, PetID, AdopterName, AdoptionDate) values
(501, 103, 'Emily White', '2024-06-10'),
(502, 106, 'Daniel Foster', '2024-07-12'),
(503, 107, 'Sophia Morgan', '2024-08-05'),
(504, 108, 'Liam Scott', '2024-09-15'),
(505, 102, 'Ava Robinson', '2024-10-01');

--13 pets that have not been adopted
select p.Name, p.Age, p.Breed, p.Type
from Pets p 
left join Adoptions a on p.PetID=a.PetID
where a.PetID is null

--14 names of adopted pets along with their adopter’s name
select p.Name,a.AdopterName
from Pets p
join Adoptions a on p.PetID=a.PetID

--15 all shelters along with the count of pets currently available for adoption 
select s.Name as Shelter_Name, count(p.PetID) as AvailablePets
from Shelters s
join Pets p on p.ShelterID=s.ShelterID
where AvailableForAdoption='Yes'
group by s.Name

--16 pets from the same shelter that have the same breed
SELECT p1.Name AS Pet1, p2.Name AS Pet2, p1.Breed, s.Name AS Shelter
FROM Pets p1
JOIN Pets p2 ON p1.ShelterID = p2.ShelterID 
AND p1.Breed = p2.Breed AND p1.PetID < p2.PetID
JOIN Shelters s ON p1.ShelterID = s.ShelterID;

--17 all possible combinations of shelters and adoption events.
select s.Name,ae.EventName
from Shelters s
cross join AdoptionEvents ae

--18 the shelter that has the highest number of adopted pets
select top 1 s.Name as ShelterName, count(a.PetID) as AdoptedPets
from Shelters s
join Pets p on s.ShelterID = p.ShelterID
join Adoptions a on p.PetID = a.PetID 
group by s.Name
order by AdoptedPets desc 

--19 database trigger that updates a pet’s AvailableForAdoption status when it is adopted
create trigger UpdateAdoptionStatus
on Adoptions  
after insert 
as begin
    update Pets
    set AvailableForAdoption = 'No'
    where PetID in (select PetID from inserted)
end

--20 a pet cannot be adopted twice using a constraint or validation trigger
create trigger PreventDoubleAdoption
on Adoptions
after insert
as begin
    if exists (
        select 1 from inserted i
        join Pets p on i.PetID = p.PetID
        where p.AvailableForAdoption = 'No'
    )
    begin
        throw 50001, 'Error: This pet has already been adopted!', 1;
    end
end