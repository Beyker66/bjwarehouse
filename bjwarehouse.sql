/* DROP DATABASE IF EXISTS `warehouse`;

CREATE DATABASE `warehouse`;

USE `warehouse`; */

CREATE TABLE `roles`(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(15) NOT NULL UNIQUE
);

CREATE TABLE `empresas`
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    telefono varchar(15) NOT NULL,
    direccion varchar(150) NOT NULL
);

CREATE TABLE `usuarios`(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    username varchar(25) NOT NULL,
    password varchar(255) NOT NULL,
    empresa_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    FOREIGN KEY (empresa_id) REFERENCES `empresas`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES `roles`(`id`) ON DELETE CASCADE
);

CREATE TABLE `carpetas`
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    descripcion varchar(250),
    empresa_id INTEGER NOT NULL,
    FOREIGN KEY (empresa_id) REFERENCES `empresas`(`id`) ON DELETE CASCADE
);

CREATE TABLE `archivos` 
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    filepath varchar(50) NOT NULL,
    descripcion varchar(250),
    size DECIMAL (10,2) NOT NULL,
    carpeta_id INTEGER NOT NULL,
    empresa_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,
    FOREIGN KEY (carpeta_id) REFERENCES `carpetas`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (empresa_id) REFERENCES `empresas`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES `usuarios`(`id`) ON DELETE CASCADE
);

CREATE TABLE `etiquetas`
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    archivo_id INTEGER NOT NULL,
    FOREIGN KEY (archivo_id) REFERENCES `archivos`(`id`) ON DELETE CASCADE
);


INSERT INTO `roles` (nombre) VALUES
 ('Autor'), ('Editor'),('Admin'), ('Visor');


INSERT INTO `empresas` (nombre, telefono, direccion) VALUES
('Los Expertos Digitales','(849) 424-9437','Glorieta Borja Pina 84, La Romana, República Dominicana'),
('El Rincón Gourmet','(829) 445-5758','Ronda Lorenza Carrasco 9, San Cristóbal, República Dominicana'),
('Las Joyas de la Abuela','(849) 146-7614','Calle de Hugo Sanmiguel 7, La Vega, República Dominicana'),
('Aventuras en Globo','(829) 347-0405','Cuesta José Trillo 960 Apt. 04, La Romana, República Dominicana'),
('El Arte del Pan','(809) 966-7770','Via Nacio Raya 94, Punta Cana, República Dominicana'),
('Los Secretos del Vino','(829) 323-1248','Paseo Eustaquio Puente 97 Apt. 68, Santo Domingo, República Dominicana'),
('La Casa del Futuro','(809) 475-1680','Pasadizo Mirta Armengol 54, Santiago, República Dominicana'),
('El Mundo del Juguete','(809) 534-6595','Cuesta Flavio Comas 483 Piso 9, San Cristóbal, República Dominicana'),
('Las Delicias del Mar','(829) 396-6560','Avenida Adelia Llabrés 353 Puerta 3, Moca, República Dominicana'),
('El Jardín Mágico','(829) 927-2605','Acceso de Hermenegildo Garriga 33 Apt. 40, La Vega, República Dominicana'),
('La Esquina Tecnológica','(809) 990-0653','Cuesta Adán Guerrero 14 Apt. 81, La Romana, República Dominicana'),
('Taller de los Sueños','(829) 952-3648','Cañada de Jesús Bermúdez 16 Apt. 65, Santiago, República Dominicana');


INSERT INTO `usuarios` (nombre, username, password, empresa_id, role_id) VALUES
('Ignacio Tena Pinilla','rosendodelpujol','cec3be5e2ee40d3a7ebe3287e9ccb0edada0b07af7b1dbbcc7ce9be565a7c3ef',3,1),
('Rosendo del Pujol','ignaciotenapinilla','59385acd256d6cc96960a055d6fa28564911320d3bcf6a4a6490ebf4695d6a06',6,2),
('Lucas Nieto Pareja','lucasnietopareja','e64151764edbefd600e4a5cd2925b64b2f1034d94a7cf8ab310693c33ec1cb37',9,4),
('Olivia Mas Chico','oliviamaschico','a5da528f87aa4484027a1664d31894e7c5c73942d1b5bccb0110919c763284b5',2,2),
('Samuel Guardiola Pedrero','samuelguardiolapedrero','bbb2d476ec06912bddb0d26098c3bb0bc6495efbadda88e5f408dfcb39c48558',1,3),
('Renato Gálvez Higueras','renatogálvezhigueras','9cee2210b7ff25c23a6db63efc9e0a5c9e2865e393b6051ac5d2d15a873aeac0',4,1),
('Jose Mármol Hoyos','josemármolhoyos','ba4cfa0d84039303b0cb5e21403c0901a61e735d6a0adafdb20c6d6b29f0dd1d',8,4),
('Samuel de Falcó','samueldefalcó','9edae05c11926f75fd180d57f9db0e4f5cc76489786c6b136186546bbad6597a',4,2),
('Violeta Pelayo-Casado','violetapelayocasado','d83ec774d39bbe54b124f914e223322b0415b1c57c135a722806108517ff4234',5,3),
('Ulises Ledesma Canet','ulisesledesmacanet','d411000cc5c106270a77947387763f42f9935b43dd4c498470347d62cf819cca',3,2),
('Juan Luis Calderón Jordán','juanluiscalderónjordán','98607a09405f8249215c1ad6465c1586e072aefc525727d70ec5b05b3c724df1',7,4),
('Maribel Duarte','maribelduarte','95da5ad8da0afea76373e389ff9e2a292685c1eca7d63e8dcdae9ff1f9ab51d7',11,2),
('Santos Perales','santosperales','1cec81889277737704392674f2f86b94db108083bb5d860204a87c1776245077',10,2),
('Heliodoro Vilaplana Báez','heliodorovilaplanabáez','3fd12c3b7f8035f5cb561750fca28a0ca95a4befc58943e2e53e26449becc863',9,3),
('Javier Peña Santamaria','javierpeñasantamaria','98e373559a60e4103895c1e78e3b0672e1526808ec9a40e4a838a57fcac19ae0',2,3),
('Casandra Nieto Cervera','casandranietocervera','31e4c6634c640b5d5740624776abd3aa525ccb2fd9cf232f783e475d5ccaff33',8,3),
('Andrés Felipe Medina','andrésfelipemedina','bc5e2a63ffd2212c2a72d20a4d1412a95a5cf504d8185f92d33b506b5474d00c',12,4),
('Hugo Silva Cervera','hugosilvacervera','743e0bdf54c23279fc9f903bf77b23dfd8b8ea351830aa8f2919929d149e354d',3,2),
('Julia Julián','juliajulián','2c0d908ec2bbacbebadae3a10d5d5897b4649a4b7693d2f8c5caf62a4d81d409',6,2),
('Graciela Zabala Calatayud','gracielazabalacalatayud','394598e22b82c490c8fc7df406b02560756031276222c0481ef5bff02ecfe2c1',11,1);


INSERT INTO `carpetas` (nombre, descripcion, empresa_id) VALUES 
('Documentos Importantes','Contiene documentos críticos para la operación del negocio, como contratos, licencias y certificaciones.',2),
('Proyectos Actuales','Archivos relacionados con proyectos en curso, incluyendo planificaciones, bocetos y documentos de trabajo.',5),
('Facturas y Contabilidad','Facturas de proveedores, recibos, estados de cuenta y otros documentos contables.',7),
('Recursos Humanos',null,1),
('Planes de Trabajo','Estrategias y planes operativos, objetivos a corto y largo plazo de la empresa.',6),
('Informes Anuales','Reportes anuales de desempeño, finanzas y otros indicadores clave.',12),
('Archivos Multimedia','Imágenes, videos, audios y otros recursos multimedia utilizados en proyectos o marketing.',11),
('Plantillas y Formatos',null,8),
('Correspondencia Externa','Correspondencia con clientes, proveedores y otros socios externos.',10),
('Actas de Reuniones','Actas y resúmenes de reuniones internas, juntas directivas y otros encuentros corporativos.',7),
('Estrategias de Marketing','Estrategias y campañas de marketing, análisis de mercado y material promocional.',1),
('Base de Datos Clientes',null,3),
('Mantenimiento IT','Documentos relacionados con el mantenimiento y actualizaciones de sistemas informáticos.',5),
('Capacitaciones y Cursos','Material educativo, programas de capacitación y registros de cursos realizados por empleados.',10);


INSERT INTO `archivos` (nombre, filepath, descripcion, carpeta_id, empresa_id, usuario_id, size) VALUES
('Informe_Final_2023','https://short.url/05oyt','Resumen y conclusiones de las actividades y logros del año.',4,1,5,19.97),
('Plan_Estratégico_2024','https://short.url/y1amd','Estrategias y objetivos para el próximo año, con enfoque en crecimiento y desarrollo.',11,1,5,37.78),
('Presentación_Comercial_Q1','https://short.url/mqg58','Diapositivas para presentar a socios comerciales en el primer trimestre.',1,2,4,21.57),
('Resumen_Ejecutivo_2022','https://short.url/06utb','Resumen de las principales actividades y logros del año pasado.',1,2,15,19.41),
('Contrato_Servicios_Enero','https://short.url/o49kb','Documento detallando términos y condiciones de un nuevo contrato de servicios.',12,3,1,7.61),
('Análisis_Financiero_Febrero','https://short.url/oczs6','Análisis detallado de la situación financiera de un mes específico.',12,3,10,1.85),
('Proyecto_Innovación_Marzo','https://short.url/0l798','Propuesta de un nuevo proyecto centrado en la innovación y tecnología.',12,3,18,23.51),
('Evaluación_Desempeño_2023','https://short.url/28t30','Evaluación del rendimiento del personal y de la empresa en el año en curso.',2,5,9,26.03),
('Guía_Usuario_Sistema','https://short.url/jdc8j','Instrucciones detalladas para el uso de un sistema o software específico.',13,5,9,18.64),
('Calendario_Eventos_2023','https://short.url/fhsac','Calendario de eventos corporativos, ferias y conferencias para el año.',5,6,2,36.25),
('Protocolo_Seguridad_IT','https://short.url/wai7e','Directrices y procedimientos para mantener la seguridad de la información.',5,6,19,20.11),
('Manual_Procedimientos','https://short.url/cygtg','Manual detallado de los procesos y procedimientos de la empresa.',3,7,11,13.32),
('Documento_Técnico_Soporte','https://short.url/urq41','Guía técnica para el equipo de soporte técnico.',10,7,11,35.29),
('Reporte_Ventas_Abril','https://short.url/rfy4e','Informe sobre las ventas realizadas en un mes concreto.',8,8,7,26.58),
('Estrategia_Digital_2023','https://short.url/j8yhm','Estrategias para mejorar la presencia digital y online de la empresa.',8,8,16,1.66),
('Plan_Formación_Personal','https://short.url/0vtki','Planificación de actividades y cursos para el desarrollo del personal.',9,10,13,25.15),
('Presupuesto_Anual_2023','https://short.url/zdlri','null',14,10,13,1.04),
('Acuerdo_Colaboración_2024','https://short.url/gwbui','Acuerdo firmado con una entidad o empresa para colaboración mutua.',7,11,12,33.20),
('Análisis_Mercado_Mayo','https://short.url/lloqd','Estudio sobre tendencias y comportamientos del mercado en un mes específico.',7,11,20,25.37),
('Política_Interna_Empresa','https://short.url/6cbrd','Reglas y normativas internas de la empresa para empleados.',6,12,17,11.28),
('Registro_Asistencia_Junio','https://short.url/cu1xk','Registro de asistencia a un evento o reunión en un mes concreto.',4,1,5,36.80),
('Plan_Marketing_2023','https://short.url/fyp66','Estrategias y planes para las campañas de marketing del año.',11,1,5,23.52),
('Hoja_Cálculo_Inventario','https://short.url/ius99','Documento con datos detallados de inventario actual.',1,2,4,28.23),
('Propuesta_Proveedor_Julio','https://short.url/xpz9l','Propuesta enviada a un proveedor para negociar términos de servicio.',1,2,15,26.96),
('Minuta_Reunión_Agosto','https://short.url/terte','Resumen y puntos discutidos en una reunión reciente.',12,3,1,39.18),
('Diseño_Campaña_Septiembre','https://short.url/s8sgw','Concepto y diseño para una campaña publicitaria en un mes específico.',12,3,10,38.90),
('Balance_General_2023','https://short.url/qhegx','Informe financiero que detalla activos, pasivos y patrimonio.',12,3,18,9.12),
('Programa_Capacitación','https://short.url/orffy','null',2,5,9,24.83),
('Informe_Auditoría_2023','https://short.url/kp1u2','Resultados y recomendaciones de una auditoría interna o externa.',13,5,9,20.07),
('Cuestionario_Evaluación','https://short.url/j0shl','Cuestionario para evaluar un producto, servicio o evento.',5,6,2,35.52),
('Resumen_Ejecutivo_Octubre','https://short.url/rbaii','Resumen de actividades y decisiones tomadas en un mes específico.',5,6,19,14.43),
('Documentación_Legal_Noviembre','https://short.url/d4eg3','Documentación legal relevante para el mes en curso.',3,7,11,14.42),
('Presupuesto_Programa_Diciembre','https://short.url/h7ywg','Presupuesto asignado para un programa o proyecto para el mes.',10,7,11,23.12),
('Análisis_Competitivo_2023','https://short.url/eueuo','Comparativa del rendimiento de la empresa frente a sus competidores.',8,8,7,21.78),
('Hoja_Ruta_Proyecto','https://short.url/g6zd4','Plan detallado para un proyecto, incluyendo fases y responsables.',8,8,16,28.53),
('Informe_Impacto_Ambiental','https://short.url/atn99','Evaluación del impacto ambiental de la empresa o de un proyecto específico.',9,10,13,24.78),
('Base_Datos_Clientes','https://short.url/xhnqq','Base de datos actualizada con información de clientes.',14,10,13,4.44),
('Plan_Contingencia_IT','https://short.url/diium','Estrategias y planes para responder a emergencias tecnológicas.',7,11,12,10.34),
('Reporte_Anual_Sostenibilidad','https://short.url/aa88f','Resumen del compromiso y acciones de la empresa hacia la sostenibilidad.',7,11,20,15.89),
('Acta_Conformidad_Servicio','https://short.url/xq6z','Documento que certifica la conformidad o aprobación de un servicio realizado.',6,12,17,24.01);


INSERT INTO `etiquetas` (nombre, archivo_id) VALUES
('Pendiente de Revisión',4),
('Para Archivar',11),
('Confidencial',1),
('Urgente',1),
('En Proceso',12),
('Completado',21),
('Borrador',23),
('Finalizado',32),
('Información Importante',40),
('Para Aprobación',29),
('En Espera',34),
('Revisado',17),
('Por Confirmar',19),
('Temporal',38),
('Histórico',37),
('Documentación de Soporte',9),
('Interno',16),
('Externo',8),
('Para Seguimiento',36),
('Archivo Permanente',39);

SELECT a.id as 'Nº.', a.nombre AS Archivo, a.size as 'Tamaño', a.filepath as Ruta,
e.nombre as Empresa, e.telefono as 'Teléfono', u.nombre as Autor,
c.nombre as Carpeta, ANY_VALUE(et.nombre) as Etiqueta from archivos a
LEFT JOIN empresas e on a.empresa_id=e.id 
LEFT JOIN usuarios u ON a.usuario_id=u.id
LEFT JOIN carpetas c on a.carpeta_id=c.id
LEFT JOIN etiquetas et on et.archivo_id=a.id
GROUP BY a.id ORDER BY a.id ;
