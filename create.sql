USE myconcept

Drop TABLE Client

CREATE TABLE Client
(
 cid int IDENTITY(1,1) not null,
 cname nvarchar (50) not null
);

Drop TABLE Telefon

CREATE TABLE Telefon
(
 tid int IDENTITY(1,1) not null,
 cid int not null,
 tel char(10) not null
);

Drop TABLE Invoice

CREATE TABLE Invoice
(
 iid int IDENTITY(1,1) not null,
 cid int not null,
 inv money not null
);

Drop TABLE Paid

CREATE TABLE Paid
(
 pid int IDENTITY(1,1) not null,
 iid int not null,
 cid int not null,
 paid money not null,
 tarix date not null
);