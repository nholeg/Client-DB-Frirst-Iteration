USE [myconcept]
GO
/****** Object:  UserDefinedFunction [dbo].[Find_by_name]    Script Date: 19.02.2016 14:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [dbo].[Findbyname]
	(
	@cname varchar (50)
	) 
RETURNS  TABLE 
AS
BEGIN 

SELECT  @cname = RTRIM( @cname ) + '%';

	SELECT        dbo.Client.cname as cname, dbo.Telefon.tel as tel, Sum(dbo.Invoice.inv) as Invoice,Sum(dbo.Paid.paid) as Paid, Sum(dbo.Invoice.inv)-Sum(dbo.Paid.paid) As Remain
FROM            dbo.Client 
				INNER JOIN
                dbo.Invoice ON dbo.Client.cid = dbo.Invoice.cid 
				INNER JOIN
                dbo.Paid ON dbo.Client.cid = dbo.Paid.cid 
			    INNER JOIN
                dbo.Telefon ON dbo.Client.cid = dbo.Telefon.cid
				Group by dbo.Client.cname, dbo.Telefon.tel	
	having RTRIM(cname) LIKE @cname;
RETURN