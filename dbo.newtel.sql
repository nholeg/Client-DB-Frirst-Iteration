USE [myconcept]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[newtel]
(
@ENTITYID int

@tel char(10)

)
AS

insert into dbo.Telefon (cid,tel) values (@ENTITYID, @tel);

return @ENTITYID
