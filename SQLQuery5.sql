-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addnew]
	-- Add the parameters for the stored procedure here
	(
@cname nvarchar (50),
@tel nchar(10),
@inv money,
@paid money
)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

insert into dbo.Client (cname) values (@cname);
insert into dbo.Telefon (cid,tel) values ((select distinct cid from dbo.Client where cname = @cname), @tel);
insert into dbo.Invoice (cid,Inv) values ((select distinct cid from dbo.Client where cname = @cname),@inv);
insert into dbo.Paid(cid,paid, tarix) values ((select distinct cid from dbo.Client where cname = @cname),@paid, CURRENT_TIMESTAMP);

END
GO
