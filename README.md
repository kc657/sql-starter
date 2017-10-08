<h1>Data Structure</h1>

** ALBUM ** <br/>
AlbumId INTEGER PRIMARY KEY<br/>
Title NVARCHAR(160)<br/>
ArtistId INTEGER FOREIGN KEY

** ARTIST ** <br/>
ArtistId INTEGER PRIMARY KEY <br/> Name NVARCHAR(120)<br/>

** CUSTOMER ** <br/>
CustomerId INTEGER PRIMARY KEY <br/> FirstName NVARCHAR(40) <br/> LastName NVARCHAR(20) <br/>
Company NVARCHAR(80) <br/>
Address NVARCHAR(70) <br/> City NVARCHAR(40) <br/>
State NVARCHAR(40) <br/> Country NVARCHAR(40) <br/> PostalCode NVARCHAR(10) <br/> Phone NVARCHAR(24) <br/>
Fax NVARCHAR(24) <br/> Email NVARCHAR(60)

** EMPLOYEE ** <br/>
EmployeeId INTEGER PRIMARY KEY <br/> LastName NVARCHAR(20)  <br/>
FirstName NVARCHAR(20) <br/>
Title NVARCHAR(30) <br/>
ReportsTo INTEGER FOREIGN KEY <br/> BirthDate DATETIME <br/>
HireDate DATETIME <br/>
Address NVARCHAR(70) <br/>
City NVARCHAR(40) <br/>
State NVARCHAR(40) <br/> Country NVARCHAR(40) <br/> PostalCode NVARCHAR(10) <br/> Phone NVARCHAR(24) <br/>
Fax NVARCHAR(24) <br/> Email NVARCHAR(60) <br/>

** GENRE ** <br/>
GenreId INTEGER PRIMARY KEY <br/> Name NVARCHAR(120) <br/>

** INVOICE **  <br/>
InvoiceId INTEGER PRIMARY KEY  <br/> CustomerId INTEGER FOREIGN KEY <br/> InvoiceDate DATETIME  <br/>BillingAddress NVARCHAR(70)  <br/>BillingCity NVARCHAR(40) <br/> BillingState NVARCHAR(40)  <br/>BillingCountry NVARCHAR(40)  <br/>BillingPostalCode NVARCHAR(10)  <br/>Total NUMERIC <br/>

** INVOICELINE ** <br/>
InvoiceLineId INTEGER PRIMARY KEY  <br/> InvoiceId INTEGER FOREIGN KEY  <br/>TrackId INTEGER FOREIGN KEY  <br/>UnitPrice NUMERIC <br/>
Quantity INTEGER <br/>

** MEDIATYPE ** <br/>
MediaTypeId INTEGER PRIMARY KEY Name   <br/> NVARCHAR(120)  <br/>

** PLAYLIST ** <br/>
PlaylistId INTEGER PRIMARY KEY Name <br/> NVARCHAR(120) <br/>

** PLAYLISTTRACK ** <br/>
PlaylistId INTEGER PRIMARY KEY  <br/> TrackId INTEGER FOREIGN KEY<br/>

** TRACK ** <br/>
TrackId INTEGER PRIMARY KEY <br/> Name NVARCHAR(200) <br/>
AlbumId INTEGER FOREIGN KEY <br/> MediaTypeId INTEGER FOREIGN KEY <br/> GenreId INTEGER FOREIGN KEY <br/> Composer NVARCHAR(220) <br/> Milliseconds INTEGER <br/>
Bytes INTEGER <br/> UnitPrice NUMERIC
