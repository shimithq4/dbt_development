
with dept as 
(select 10 as deptno,'Parents' as Deptname
union
select 20 as deptno,'Girl' as Deptname
union
select 30 as deptno,'Boy' as Deptname)

select * from dept
