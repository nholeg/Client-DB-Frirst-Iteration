USE [myconcept]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[newclient]
(
@cname nvarchar (50)
)
AS
declare @ENTITYID int
insert into dbo.Client (cname) values (@cname);
SET @ENTITYID = @@IDENTITY
return @ENTITYID
