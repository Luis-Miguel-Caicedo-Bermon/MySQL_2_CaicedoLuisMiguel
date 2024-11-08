use universidad_t2;
-- Devuelve todos los datos del alumno más joven.
select * from alumno a order by a.fecha_nacimiento desc limit 1;

-- Devuelve un listado con los profesores que no están asociados a un departamento.
select * from profesor p where p.id_departamento is null;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.
select * from departamento d where d.id not in (select id_departamento from profesor);

-- Devuelve un listado con los profesores que tienen un departamento asociado
-- y que no imparten ninguna asignatura.
select p.* from profesor p left join asignatura a on p.id = a.id_profesor where a.id_profesor is null;

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select a.* from asignatura a where a.id_profesor is null;

-- Devuelve un listado con todos los departamentos
-- que no han impartido asignaturas en ningún curso escolar.
select d.* , a.nombre from departamento d 
inner join profesor p on d.id = p.id_departamento 
inner join asignatura a on p.id = a.id_profesor
where a.id not in (select id_asignatura from alumno_se_matricula_asignatura);

-- Devuelve un listado con el nombre de todos los departamentos
-- que tienen profesores que imparten alguna asignatura
-- en el Grado en Ingeniería Informática (Plan 2015).
select distinct d.* from departamento d 
inner join profesor p on d.id = p.id_departamento 
inner join asignatura a on p.id = a.id_profesor
inner join grado g on g.id = a.id_grado
where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- Devuelve un listado con los nombres de todos los profesores
-- y los departamentos que tienen vinculados.
-- El listado también debe mostrar aquellos profesores
-- que no tienen ningún departamento asociado.
-- El listado debe devolver cuatro columnas,
-- nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
-- El resultado estará ordenado alfabéticamente de menor a mayor
-- por el nombre del departamento, apellidos y el nombre.
select d.nombre as nombre_departamento , p.apellido1 , p.apellido2 , p.nombre from profesor p 
left join departamento d on p.id_departamento = d.id order by 1 , 2 , 3 , 4;

-- Devuelve un listado con los profesores que no imparten ninguna asignatura.
select p.* from profesor p left join asignatura a on p.id = a.id_profesor where a.id_profesor is null;

--


select * from alumno_se_matricula_asignatura;
select * from asignatura;
select * from grado;