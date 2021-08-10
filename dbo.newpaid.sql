USE [myconcept]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[newpaid]
(
	@cid int,
	@paid money
)
AS

insert into dbo.paid (cid,paid,tarix) values (@cid, @paid,CURRENT_TIMESTAMP);

return @cid