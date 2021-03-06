USE [myconcept]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [find_Clients]

@cname nvarchar (50),
returns  
(
    @o_cname nvarchar (50) OUTPUT, 
	@o_tel char(10) OUTPUT,
	@o_Remain money OUTPUT
)
AS
SELECT      @o_cname =  dbo.Client.cname as cname, @o_tel = dbo.Telefon.tel as tel, @o_Remain = Sum(dbo.Invoice.inv)-Sum(dbo.Paid.paid) As Remain
FROM            dbo.Client 
				INNER JOIN
                dbo.Invoice ON dbo.Client.cid = dbo.Invoice.cid 
				INNER JOIN
                dbo.Paid ON dbo.Client.cid = dbo.Paid.cid 
			    INNER JOIN
                dbo.Telefon ON dbo.Client.cid = dbo.Telefon.cid
				Group by dbo.Client.cname, dbo.Telefon.tel
	having cname LIKE (@cname);

RETURN 
GO