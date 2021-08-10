SELECT ROW_NUMBER() OVER (ORDER BY name, typenum) num,
CASE 
WHEN ROW_NUMBER() OVER (PARTITION BY name ORDER BY typenum) =1 THEN name
ELSE '' 
END name, tel,
CASE 
WHEN ROW_NUMBER() OVER (PARTITION BY invoice ORDER BY typenum) =1 THEN invoice
ELSE ''
END invoice,
CASE 
WHEN ROW_NUMBER() OVER (PARTITION BY sum_paid ORDER BY typenum) =1 THEN sum_paid
ELSE ''
END sum_paid,
CASE 
WHEN ROW_NUMBER() OVER (PARTITION BY remain ORDER BY typenum) =1 THEN remain
ELSE ''
END remain,
CASE 
WHEN ROW_NUMBER() OVER (PARTITION BY last_paid ORDER BY typenum) =1 THEN last_paid
ELSE NULL
END last_paid
FROM ( SELECT DISTINCT c.cname as name, b.tel, sum (distinct i.inv) as invoice , sum (p.paid) as sum_paid,
sum (distinct i.inv) - sum (p.paid) as remain, max(p.tarix) as last_paid,
  CASE 
    WHEN 1 <  (Select count (a.tel) from dbo.Telefon a where a.cid =b.cid)  THEN 2
    ELSE 1 
END typenum 
FROM dbo.Client c
left JOIN
dbo.Telefon b 
ON c.cid = b.cid 
left JOIN
dbo.Invoice i
ON b.cid = i.cid 
left JOIN
dbo.Paid p 
ON i.iid = P.iid
group by b.cid, c.cname, b.tel, i.inv ) h
ORDER BY num