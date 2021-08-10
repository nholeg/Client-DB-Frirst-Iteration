 Declare @cname nvarchar (50)

	SELECT        dbo.Client.cname as cname, dbo.Telefon.tel as tel, Sum(dbo.Invoice.inv)-Sum(dbo.Paid.paid) As Remain
FROM            dbo.Client 
				INNER JOIN
                dbo.Invoice ON dbo.Client.cid = dbo.Invoice.cid 
				INNER JOIN
                dbo.Paid ON dbo.Client.cid = dbo.Paid.cid 
			    INNER JOIN
                dbo.Telefon ON dbo.Client.cid = dbo.Telefon.cid
				Group by dbo.Client.cname, dbo.Telefon.tel	
				having cname LIKE (@cname)