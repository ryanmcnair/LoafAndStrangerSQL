CREATE TABLE Loaves(
	Id int NOT NULL,
	Size int NOT NULL,
	Type varchar(40) NOT NULL,
	WeightInOunces int NOT NULL,
	Price decimal(18, 2) NOT NULL,
	Sliced bit NOT NULL,
	CreatedDate datetime NOT NULL DEFAULT getDate()
)
