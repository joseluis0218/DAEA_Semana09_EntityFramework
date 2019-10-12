/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO Course AS Target
USING (VALUES
	(1,'Economics',3),
	(2,'Literature',3),
	(3,'Chemistry',4)
)
AS Source(CourseID,Title,Credits)
ON Target.CourseID = Source.CourseID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Title,Credits)
VALUES (Title,Credits);

MERGE INTO Student AS Target
USING (VALUES
	(1,'Tibbetts','Donnie','2013-09-01'),
	(2,'Guzman','Liza','2012-01-13'),
	(3,'Catlett','Phil','2011-09-03')
)
AS Source(StudentID,LastName,FirstName,EnrrollmentDate)
ON Target.StudentID = Source.StudentID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (LastName,FirstName,EnrollmentDate)
VALUES (LastName,FirstName,EnrrollmentDate);


MERGE INTO Enrollment AS Target
USING (VALUES
	(1,2.00,1,1),
	(2,3.50,1,2),
	(3,4.00,2,3),
	(4,1.80,2,1),
	(5,3.20,3,1),
	(6,4.00,3,2)
)
AS Source(EnrollmentID,Grade,CourseID,StudentID)
ON Target.EnrollmentID = Source.EnrollmentID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Grade,CourseID,StudentID)
VALUES (Grade,CourseID,StudentID);