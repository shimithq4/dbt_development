with employees as (

    select
        id as employee_id,
        name as employee_name,
        Deptno as department_id

    from DEV.dbt_schema.employee

),

departments as (

    select
        Deptno as department_id,
        DeptName as department_name

    from DEV.dbt_schema.department

),

employee_department as (

    select
        employee_id,
        employee_name,
        department_name

    from employees e
    left join departments d
    on e.department_id = d.department_id

)

select * from employee_department