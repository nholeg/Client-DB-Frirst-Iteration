USE [myconcept]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[newinvoice]
(
	@cid int,
	@inv money
)
AS

insert into dbo.InvoiInvoice(cid,inv) values (@cid, @inv);

return @cid