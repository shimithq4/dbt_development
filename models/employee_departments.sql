with employees as (

    select id as employee_id,
        name as employee_name,
        Deptno as department_id
         from  {{ref('employee')}}

),

departments as (

    select Deptno as department_id,
        DeptName as department_name
        from  {{ref('department')}}

),

employee_department as (

    select
       'Its all Good' as title,
        employee_id,
        employee_name,
        department_name,
        'thats right' as end

    from employees e
    left join departments d
    on e.department_id = d.department--_id

)

select * from employee_department