with emp as
(select 1 as id,'Shimith' as name, 10 as deptno
union
select 2 as id,'Anjusha' as name, 10 as deptno
union
select 3 as id,'Tanvi' as name, 20 as deptno
union
select 4 as id,'Milan' as name, 30 as deptno)

select * from emp
