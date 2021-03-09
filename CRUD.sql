declare @Size int = 3
declare @Type varchar(40) = 'Honey Wheat'
declare @Price decimal(18,2) = 2.50
declare @weightInOunces int =24
declare @sliced bit = 0

--Adding data is done via insert
Insert into Loaves(Size, [Type], Price, WeightInOunces, Sliced)
output inserted.* --output has access to the fully resolved inserted data
Values (@Size, @Type, @Price, @weightInOunces, @sliced) --order is important here, needs to match the insert column order

--safety measure, can undo changes inside of a transaction with a rollback
begin transaction
--updating data
Update Loaves
   Set WeightInOunces = 1100, --column name = value
       Size = 1,
	   Type = 'French Bread'
output inserted.*, deleted.* --inserted contains the new values, deleted contains the old values
Where  id = 1 --ALWAYS be specific

select * from Loaves
--MUST commit or rollback to end transaction
rollback --undoes the changes in the transaction
--commit --commits the changes in the transaction

--Deleting data
Delete
from Loaves
where id = 5


select * from Loaves
