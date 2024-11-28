-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2024 a las 01:44:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proy_change`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abarca`
--

CREATE TABLE `abarca` (
  `nroEnc` int(11) NOT NULL,
  `nombreTem` char(20) NOT NULL,
  `puestoInt` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliado`
--

CREATE TABLE `afiliado` (
  `correo` char(40) NOT NULL,
  `fechaN` date DEFAULT NULL,
  `firmaAnon` int(1) DEFAULT 0,
  `TFA` int(1) DEFAULT 0,
  `nombrePais` char(25) NOT NULL,
  `nombreProv` char(25) NOT NULL,
  `nombreLoc` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

CREATE TABLE `destino` (
  `nombreDest` char(30) NOT NULL,
  `descr` char(40) DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destino`
--

INSERT INTO `destino` (`nombreDest`, `descr`, `estado`) VALUES
('gobierno de san juan', '', 1),
('intendente de chimbas', '', 0),
('javier milei', 'presidente de la republica arg', 1),
('javueb maluco', '', 0),
('min de salud', 'enfermedades, salud publica, hospitales', 1),
('romina rosas', 'Intendente de caucete 2022-2026', 1),
('si funciono', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `nroEnc` int(11) NOT NULL,
  `fecha` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatuto`
--

CREATE TABLE `estatuto` (
  `correo` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firma`
--

CREATE TABLE `firma` (
  `idFirma` int(11) NOT NULL,
  `nroPet` int(11) NOT NULL,
  `correo` char(40) NOT NULL DEFAULT '',
  `ip` char(45) NOT NULL DEFAULT '0.0.0.0',
  `comentario` tinytext NOT NULL DEFAULT '',
  `anon` int(1) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `nroPet` int(11) NOT NULL,
  `nroImg` int(11) NOT NULL,
  `extension` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `informe`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `informe` (
`mes` varchar(7)
,`cantidadPeticiones` bigint(21)
,`cantidadBajas` bigint(21)
,`cantidadAdmitidas` bigint(21)
,`cantidadExitosas` bigint(21)
,`cantidadNoAdmitidas` bigint(21)
,`cantidadUsuariosNuevos` bigint(21)
,`cantidadFirmas` bigint(21)
,`cantidadRegistradas` bigint(21)
,`cantidadNoRegistradas` bigint(21)
,`cantidadPublicas` bigint(21)
,`cantidadAnonimas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interesa`
--

CREATE TABLE `interesa` (
  `correo` char(40) NOT NULL,
  `nombreTem` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipdir`
--

CREATE TABLE `ipdir` (
  `ip` char(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `nombrePais` char(25) NOT NULL,
  `nombreProv` char(25) NOT NULL,
  `nombreLoc` char(30) NOT NULL,
  `estado` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`nombrePais`, `nombreProv`, `nombreLoc`, `estado`) VALUES
('argentina', 'san juan', 'caucete', 1),
('argentina', 'san juan', 'difunta correa', 1),
('argentina', 'san juan', 'san juan', 1),
('argentina', 'san juan', 'vallecito', 0),
('argentina', 'san juan', 'villa krause', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `nombrePais` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`nombrePais`) VALUES
('argentina'),
('bolivia'),
('brasil'),
('chile'),
('colombia'),
('costa rica'),
('cuba'),
('dominicana'),
('ecuador'),
('el salvador'),
('guatemala'),
('honduras'),
('méxico'),
('nicaragua'),
('panamá'),
('paraguay'),
('perú'),
('puerto rico'),
('uruguay'),
('venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticion`
--

CREATE TABLE `peticion` (
  `nroPet` int(11) NOT NULL,
  `estado` int(1) NOT NULL DEFAULT 0,
  `objFirmas` int(11) NOT NULL DEFAULT 0,
  `titulo` char(100) DEFAULT NULL,
  `cuerpo` text DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `correo` char(40) NOT NULL,
  `nombreDest` char(30) DEFAULT NULL,
  `nombrePais` char(25) DEFAULT NULL,
  `nombreProv` char(25) DEFAULT NULL,
  `nombreLoc` char(30) DEFAULT NULL,
  `nroPet_multiple` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peticion`
--

INSERT INTO `peticion` (`nroPet`, `estado`, `objFirmas`, `titulo`, `cuerpo`, `fecha`, `correo`, `nombreDest`, `nombrePais`, `nombreProv`, `nombreLoc`, `nroPet_multiple`) VALUES
(2, -2, 100, 'desarrollador loco', 'soy el desarrollador loco, estoy medio loquito y me pican los cocos, esto es un lorem ipsum ultra caserito', '2024-07-15 00:00:00', 'santigimenez.20020817@gmail.com', 'gobierno de san juan', 'argentina', 'san juan', 'caucete', NULL),
(3, 1, 1000, 'desarrollador freelancer', 'asdasdde php::penepe', '2024-07-15 00:00:00', 'santigimenez.20020817@gmail.com', 'javier milei', 'argentina', 'san juan', 'caucete', NULL),
(4, 0, 300, 'Desarrollador 3 peiticionando', 'Esto es una peticion realizada en el dia de la fecha para probar el funcionamiento de la base de datos y el sistema en su etapa temprana', '2024-07-16 00:00:00', 'gsanti.sg17@gmail.com', NULL, NULL, NULL, NULL, NULL),
(5, 0, 500, 'Peticion con 2 imagenes', 'esta es una peticion creada para probar como se ve el post cuando cuenta con dos imagenes, posteriormente se creara uno que contenga tres imagenes', '2024-07-19 00:00:00', 'gsanti.sg2002@gmail.com', NULL, 'argentina', 'san juan', 'caucete', NULL),
(10, 0, 12500, 'penelopecrus soy', 'penelope crus estuvo aqui haciendo esta peticion', '2024-07-25 00:00:00', 'santigimenez.20020817@gmail.com', 'javier milei', 'argentina', 'san juan', 'caucete', NULL),
(27, 1, 150000, 'esta e sla lalalal peticion 1 ajkndlaksnmd', 'jamdsflkadñljnasdlan sdjlansdkjans dlkaj sdlka msldmasl dmasdkam fpwfjawoenf gfqwnsñdlkf d fdqknd odfi sdofn ajdfn ñJNF SADFN MWIFEJ MOAÑNF ', '2024-07-29 00:00:00', 'santigimenez.20020817@gmail.com', 'javier milei', NULL, NULL, NULL, NULL),
(28, -2, 101, 'Soy Juan Horacio Gonzalez', 'Hola! Esta es mi primera petición. Estoy muy contento de estar aquí y poder colaborar con todos ustedes. Espero poder contribuir con toda buena causa y ayudar al mundo a ser un lugar mejor', '2024-07-30 00:00:00', 'penelope@cruz.com', 'gobierno de san juan', NULL, NULL, NULL, NULL),
(29, 0, 5000, 'Mal gasto del dinero publico', 'La semana pasada se dio a conocer que el gobierno provincial brindará dinero publico a los municipios para la pavimentación de las calles, y la intendente del departamento de Caucete, en lugar de arreglar las calles céntricas, donde mas trafico hay, prefiere arreglar las calles de los barrios sin darle ninguna importancia a las calles céntricas, valga la redundancia', '2024-08-05 00:00:00', 'santigimenez.20020817@gmail.com', 'romina rosas', NULL, NULL, NULL, NULL),
(30, 0, 200, 'Calle de Aberastain rotas', 'Jsjsisisjbsbdbsjwjwbdbdjdkdksnsnsn ss nskzkxoslsnwns. Zksns snksosksbw wnskodkdbs qnskoxlwbs. Xkskosknsbbdksklsknbs noxknsb. Akdoplwnbjaiikdn bien fjkxlskksnwndndksisknq sndndkdkkb! Kei; si jejeje! Si jwjxuwbskdke! Sjwnfisyw? Ysbskfyb! Dndkskeknt hols bwisooakrn ffyd? Bnksklskqnenndllslskkkskskskskskskskskskskskdkjddjdjjddjjdjdbebevevevevevvevevevevevevevevvevvevevevvevevevevememememmemeememmememammamamamamamsmmrmrmrmrmrmrmrmrmrmisisiaiaiaiaiisajbwbfndnkfkknsn. Dnkdkfijdbsb f fndmkdksksjwjjd', '2024-08-09 00:00:00', 'mariangelesgmnz@gmail.com', NULL, NULL, NULL, NULL, NULL),
(31, 1, 850, 'estoy loquita sapeeeee', 'esta es una peticion donde declaro estar loquita saaape poruq elas locquitas como yo no pueden ser encerradas sape chupate una japi', '2024-08-19 00:00:00', 'santigimenez.20020817@gmail.com', 'romina rosas', NULL, NULL, NULL, NULL),
(33, -2, 1001, 'asdasdasdasd', 'asdasdasdasd asdasdasdasd asdasdasdasd.l.lll asdasdasdasd asdasdasdasd asdasdasdasdasdasda asdasdasd', '2024-08-19 20:05:04', 'mariangelesgmnz@gmail.com', 'gobierno de san juan', 'argentina', 'san juan', 'caucete', NULL),
(34, 0, 1001, 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 'asdasdasdasd asdasdasdasd asdasdasdasd.l.lll asdasdasdasd asdasdasdasd asdasdasdasdasdasda asdasdasd', '2024-08-19 20:06:03', 'mariangelesgmnz@gmail.com', 'gobierno de san juan', 'argentina', 'san juan', 'caucete', NULL),
(35, 0, 103, 'queeee peto que pasa tio como estas', 'iejejei pero que pasa cahvales todo bien todo correcto? y yo quw me alegro maderfakers. Como estais? yo bien no', '2024-08-19 21:16:05', 'sannntis1708@gmail.com', NULL, NULL, NULL, NULL, NULL),
(36, 0, 1200, 'Implementación de programas de reciclaje', 'Solicito que se implementen programas de reciclaje en nuestra comunidad para reducir el impacto ambiental.', '2024-08-20 15:38:27', 'usuario6@example.com', NULL, NULL, NULL, NULL, NULL),
(37, 0, 700, 'Ampliación de horarios en bibliotecas públicas', 'Pedimos que se amplíen los horarios de las bibliotecas públicas para estudiantes y trabajadores.', '2024-08-20 15:38:27', 'usuario7@example.com', NULL, NULL, NULL, NULL, NULL),
(38, 0, 400, 'Control de ruido en zonas residenciales', 'Exigimos la regulación del ruido en zonas residenciales debido al constante tráfico y construcciones.', '2024-08-20 15:38:27', 'usuario8@example.com', NULL, NULL, NULL, NULL, NULL),
(39, 0, 900, 'Iluminación pública en parques', 'Requerimos que se instale iluminación adecuada en los parques para mayor seguridad nocturna.', '2024-08-20 15:38:27', 'usuario9@example.com', NULL, NULL, NULL, NULL, NULL),
(40, 0, 600, 'Creación de ciclovías', 'Solicito la creación de ciclovías seguras para fomentar el uso de bicicletas como medio de transporte sostenible.', '2024-08-20 15:38:27', 'usuario10@example.com', NULL, NULL, NULL, NULL, NULL),
(41, 0, 1300, 'Prohibición del uso de plástico de un solo uso', 'Pedimos la prohibición del plástico de un solo uso en mercados y tiendas locales.', '2024-08-20 15:38:27', 'usuario11@example.com', NULL, NULL, NULL, NULL, NULL),
(42, 0, 1100, 'Mejora de servicios de atención al ciudadano', 'Solicito que se mejoren los servicios de atención al ciudadano en las oficinas gubernamentales.', '2024-08-20 15:38:27', 'usuario12@example.com', NULL, NULL, NULL, NULL, NULL),
(43, 0, 500, 'Restauración de monumentos históricos', 'Pedimos la restauración de los monumentos históricos que han sido descuidados en los últimos años.', '2024-08-20 15:38:27', 'usuario13@example.com', NULL, NULL, NULL, NULL, NULL),
(44, 0, 2500, 'Aumento de presupuesto para educación', 'Solicito un aumento en el presupuesto destinado a la educación para mejorar la infraestructura de las escuelas.', '2024-08-20 15:38:27', 'usuario14@example.com', NULL, NULL, NULL, NULL, NULL),
(45, 0, 1800, 'Accesibilidad en transporte público para personas con discapacidad', 'Exigimos que el transporte público sea más accesible para personas con discapacidad.', '2024-08-20 15:38:27', 'usuario15@example.com', NULL, NULL, NULL, NULL, NULL),
(46, 0, 1000, 'Mejora del servicio de transporte público', 'Solicito que se mejore el servicio de transporte público debido a constantes retrasos y mal estado de los vehículos.', '2024-08-20 15:38:36', 'usuario1@example.com', NULL, NULL, NULL, NULL, NULL),
(47, 0, 500, 'Protección de áreas verdes', 'Insto a las autoridades a preservar las áreas verdes en nuestro distrito, evitando proyectos que destruyan el medio ambiente.', '2024-08-20 15:38:36', 'usuario2@example.com', NULL, NULL, NULL, NULL, NULL),
(48, 0, 2000, 'Aumento de seguridad en las calles', 'Exigimos mayor presencia policial en nuestras calles debido al aumento de robos en las últimas semanas.', '2024-08-20 15:38:36', 'usuario3@example.com', NULL, NULL, NULL, NULL, NULL),
(49, 0, 1500, 'Mejora en la atención del hospital local', 'Pedimos una mejora en la calidad de atención en el hospital local, ya que los tiempos de espera son excesivos.', '2024-08-20 15:38:36', 'usuario4@example.com', NULL, NULL, NULL, NULL, NULL),
(50, 0, 800, 'Reparación urgente de las calles', 'Solicitamos la reparación inmediata de las calles principales que se encuentran en mal estado.', '2024-08-20 15:38:36', 'usuario5@example.com', NULL, NULL, NULL, NULL, NULL),
(51, 0, 1000, 'Implementación de más espacios deportivos', 'Solicitamos la creación de nuevos espacios deportivos para fomentar la actividad física en la comunidad.', '2024-08-20 15:39:57', 'usuario1@example.com', NULL, NULL, NULL, NULL, NULL),
(52, 0, 1600, 'Instalación de cámaras de seguridad', 'Pedimos la instalación de cámaras de seguridad en zonas vulnerables para reducir la criminalidad.', '2024-08-20 15:39:57', 'usuario2@example.com', NULL, NULL, NULL, NULL, NULL),
(53, 0, 2000, 'Reducción de tarifas de transporte público', 'Solicito una revisión y reducción de las tarifas del transporte público, ya que son demasiado altas.', '2024-08-20 15:39:57', 'usuario3@example.com', NULL, NULL, NULL, NULL, NULL),
(54, 0, 1200, 'Construcción de más parques infantiles', 'Exigimos la construcción de más parques infantiles para el desarrollo y recreación de los niños.', '2024-08-20 15:39:57', 'usuario4@example.com', NULL, NULL, NULL, NULL, NULL),
(55, -2, 900, 'Revisión de los impuestos municipales', 'Solicito una revisión de los impuestos municipales, ya que han aumentado sin una mejora en los servicios.', '2024-08-20 15:39:57', 'usuario5@example.com', NULL, NULL, NULL, NULL, NULL),
(56, -2, 1400, 'Prohibición de la tala indiscriminada', 'Solicito la prohibición inmediata de la tala de árboles en áreas protegidas.', '2024-08-20 15:39:57', 'usuario6@example.com', NULL, NULL, NULL, NULL, NULL),
(57, 0, 1500, 'Acceso a internet gratuito en áreas públicas', 'Pedimos que se ofrezca acceso gratuito a internet en plazas y parques públicos.', '2024-08-20 15:39:57', 'usuario7@example.com', NULL, NULL, NULL, NULL, NULL),
(58, 0, 1800, 'Aumento de fondos para la protección animal', 'Solicito que se aumenten los fondos destinados a la protección de animales callejeros.', '2024-08-20 15:39:57', 'usuario8@example.com', NULL, NULL, NULL, NULL, NULL),
(59, 0, 500, 'Regulación del uso de drones en zonas residenciales', 'Exigimos la regulación del uso de drones en zonas residenciales por motivos de privacidad.', '2024-08-20 15:39:57', 'usuario9@example.com', NULL, NULL, NULL, NULL, NULL),
(60, -2, 1000, 'Creación de centros comunitarios para jóvenes', 'Pedimos la creación de centros comunitarios para que los jóvenes puedan participar en actividades recreativas.', '2024-08-20 15:39:57', 'usuario10@example.com', NULL, NULL, NULL, NULL, NULL),
(61, 0, 1300, 'Ampliación de rutas de transporte nocturno', 'Solicito la ampliación de las rutas de transporte público nocturno para trabajadores y estudiantes.', '2024-08-20 15:39:57', 'usuario11@example.com', NULL, NULL, NULL, NULL, NULL),
(62, 0, 1700, 'Fomentar el uso de energías renovables', 'Solicitamos la promoción de proyectos de energía renovable en nuestra comunidad.', '2024-08-20 15:39:57', 'usuario12@example.com', NULL, NULL, NULL, NULL, NULL),
(63, 0, 1100, 'Aumento de servicios de salud mental', 'Pedimos un aumento en los servicios de salud mental disponibles en hospitales públicos.', '2024-08-20 15:39:57', 'usuario13@example.com', NULL, NULL, NULL, NULL, NULL),
(64, -2, 2000, 'Construcción de refugios para personas sin hogar', 'Solicito la construcción de refugios que brinden apoyo a personas sin hogar.', '2024-08-20 15:39:57', 'usuario14@example.com', NULL, NULL, NULL, NULL, NULL),
(65, 0, 1600, 'Mayor control en la emisión de licencias de construcción', 'Exigimos un control más estricto en la emisión de licencias de construcción en zonas residenciales.', '2024-08-20 15:39:57', 'usuario15@example.com', NULL, NULL, NULL, NULL, NULL),
(66, -1, 1030, 'en guanajuato hay gays', 'todos son gays en guanajuato me tienen cansadp desde juanguato', '2024-08-22 20:30:42', 'gsanti.sg17@gmail.com', NULL, NULL, NULL, NULL, NULL),
(67, -1, 1010, 'peticion para probar vistas', 'esta peticion quiere probar la vista de las peticiones nuevas, no eliminar ni aceptar', '2024-08-22 20:41:21', 'gsanti.sg17@gmail.com', 'gobierno de san juan', NULL, NULL, NULL, NULL),
(68, 0, 350, 'en caucete sib gays', 'todos los cauceteeros son gays y s emueven en cabras porque para el caballo no les alcanza', '2024-08-26 15:39:20', 'santigimenez.20020817@gmail.com', NULL, NULL, NULL, NULL, NULL),
(69, 1, 102, 'peticion para crear destino', 'esta peticion busca crear un destino a traves de la creacion de la peticion', '2024-08-26 17:45:59', 'santigimenez.20020817@gmail.com', 'si funciono', NULL, NULL, NULL, NULL),
(70, -1, 103, 'esta oeticion es igual que la anterior', 'quiero crear el destino = &#34;si funciono&#34; para combinar el destino de la peticion anterior', '2024-08-26 17:47:05', 'santigimenez.20020817@gmail.com', 'si funciono', NULL, NULL, NULL, NULL),
(71, 0, 104, 'peticion para eliminarle el destino', 'esta peticion crea el destino eliminar para testear la app', '2024-08-26 17:57:30', 'santigimenez.20020817@gmail.com', NULL, NULL, NULL, NULL, NULL),
(72, 0, 105, 'esta peticion 2 verifica que se pueda eliminar el destino', 'tambien verifica un bug encontrado en tematicas que aparecio con la peticion anterior', '2024-08-26 18:00:09', 'santigimenez.20020817@gmail.com', NULL, NULL, NULL, NULL, NULL),
(73, 0, 777, 'El ECO está muy caro', 'Las tarifas de ECO son demasiado caras e impagables', '2024-08-28 13:30:55', 'caballerolautarodev@gmail.com', 'Gobierno de San Juan', NULL, NULL, NULL, NULL),
(74, 1, 3, 'aaaaaaa aaaaaaaaaa', 'aaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa', '2024-08-28 13:40:02', 'santigimenez.20020817@gmail.com', NULL, NULL, NULL, NULL, NULL),
(75, -1, 101, 'aaaaaaaaaa aaaaaaaaaa', ' aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2024-08-28 13:54:25', 'santigimenez.20020817@gmail.com', NULL, NULL, NULL, NULL, NULL),
(76, 2, 5, 'aaaaaa aaaaaaaaaaa', 'aaaaaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa', '2024-08-29 16:06:40', 'santigimenez.20020817@gmail.com', 'javier milei', NULL, NULL, NULL, NULL),
(77, 0, 5000, 'precio caro cafe havana', 'quiero quejarme de los precios exagerados de la cafeteria havana en san juan', '2024-09-20 16:03:29', 'santigimenez.20020817@gmail.com', 'intendente de chimbas', NULL, NULL, NULL, NULL),
(78, 0, 5, 'caca pipi popo', 'cacaca lalalal lololo lelelele pepepe lilili lululu', '2024-10-11 00:19:37', 'santigimenez.20020817@gmail.com', 'javueb maluco', NULL, NULL, NULL, NULL),
(79, -1, 5, 'propiedad de bigdic', 'esra es la propiedad del bigdic facha', '2024-11-04 23:47:12', 'bigdic@gmail.com', NULL, 'argentina', 'san juan', 'caucete', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticionmultiple`
--

CREATE TABLE `peticionmultiple` (
  `nroPet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticionplus`
--

CREATE TABLE `peticionplus` (
  `nroPet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `peticion_objetivo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `peticion_objetivo` (
`numero` int(11)
,`estado` int(1)
,`objetivo` int(11)
,`firmas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `nombrePais` char(25) NOT NULL,
  `nombreProv` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`nombrePais`, `nombreProv`) VALUES
('argentina', 'buenos aires'),
('argentina', 'catamarca'),
('argentina', 'córdoba'),
('argentina', 'entre ríos'),
('argentina', 'la rioja'),
('argentina', 'mendoza'),
('argentina', 'san juan'),
('argentina', 'san luis'),
('argentina', 'santa fe'),
('argentina', 'tucumán'),
('bolivia', 'cochabamba'),
('bolivia', 'la paz'),
('bolivia', 'oruro'),
('bolivia', 'potosí'),
('bolivia', 'santa cruz'),
('brasil', 'bahia'),
('brasil', 'minas gerais'),
('brasil', 'paraná'),
('brasil', 'rio de janeiro'),
('brasil', 'são paulo'),
('chile', 'antofagasta'),
('chile', 'atacama'),
('chile', 'biobío'),
('chile', 'santiago'),
('chile', 'valparaíso'),
('colombia', 'antioquia'),
('colombia', 'bogotá'),
('colombia', 'cundinamarca'),
('colombia', 'santander'),
('colombia', 'valle del cauca'),
('costa rica', 'alajuela'),
('costa rica', 'cartago'),
('costa rica', 'heredia'),
('costa rica', 'puntarenas'),
('costa rica', 'san josé'),
('cuba', 'camagüey'),
('cuba', 'holguín'),
('cuba', 'la habana'),
('cuba', 'matanzas'),
('cuba', 'santiago de cuba'),
('dominicana', 'la vega'),
('dominicana', 'puerto plata'),
('dominicana', 'san cristóbal'),
('dominicana', 'santiago'),
('dominicana', 'santo domingo'),
('ecuador', 'azuay'),
('ecuador', 'esmeraldas'),
('ecuador', 'guayas'),
('ecuador', 'manabí'),
('ecuador', 'pichincha'),
('el salvador', 'la libertad'),
('el salvador', 'san salvador'),
('el salvador', 'santa ana'),
('el salvador', 'sonsonate'),
('el salvador', 'usulután'),
('guatemala', 'escuintla'),
('guatemala', 'guatemala'),
('guatemala', 'quetzaltenango'),
('guatemala', 'quiché'),
('guatemala', 'sacatepéquez'),
('honduras', 'atlántida'),
('honduras', 'choluteca'),
('honduras', 'cortés'),
('honduras', 'francisco morazán'),
('honduras', 'yoro'),
('méxico', 'ciudad de méxico'),
('méxico', 'jalisco'),
('méxico', 'nuevo león'),
('méxico', 'puebla'),
('méxico', 'veracruz'),
('nicaragua', 'chontales'),
('nicaragua', 'granada'),
('nicaragua', 'león'),
('nicaragua', 'managua'),
('nicaragua', 'matagalpa'),
('panamá', 'chiriquí'),
('panamá', 'coclé'),
('panamá', 'colón'),
('panamá', 'panamá'),
('panamá', 'veraguas'),
('paraguay', 'alto paraguay'),
('paraguay', 'asunción'),
('paraguay', 'central'),
('paraguay', 'cordillera'),
('paraguay', 'itapúa'),
('perú', 'arequipa'),
('perú', 'cusco'),
('perú', 'la libertad'),
('perú', 'lima'),
('perú', 'piura'),
('puerto rico', 'bayamón'),
('puerto rico', 'caguas'),
('puerto rico', 'mayagüez'),
('puerto rico', 'ponce'),
('puerto rico', 'san juan'),
('uruguay', 'canelones'),
('uruguay', 'colonia'),
('uruguay', 'maldonado'),
('uruguay', 'montevideo'),
('uruguay', 'salto'),
('venezuela', 'bolívar'),
('venezuela', 'caracas'),
('venezuela', 'lara'),
('venezuela', 'miranda'),
('venezuela', 'zulia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `nroRep` int(11) NOT NULL,
  `fechaDesde` date DEFAULT NULL,
  `fechaHasta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `nombreRol` char(10) NOT NULL,
  `privilegios` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`nombreRol`, `privilegios`) VALUES
('admin', 10),
('moderador', 5),
('user', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tematica`
--

CREATE TABLE `tematica` (
  `nombreTem` char(20) NOT NULL,
  `descr` char(60) DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tematica`
--

INSERT INTO `tematica` (`nombreTem`, `descr`, `estado`) VALUES
('economia', 'dolar, peso, inflacion', 1),
('impuestos', 'tarifas, boletas, iva', 1),
('inseguridad', 'robos, miedo, delincuentes', 1),
('medio ambiente', 'hojas, poda, riego, suciedad', 1),
('obras publicas', 'veredas, calles, alumbrado', 1),
('prueba', '', 0),
('religion', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trata`
--

CREATE TABLE `trata` (
  `nroPet` int(11) NOT NULL,
  `nombreTem` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` char(40) NOT NULL,
  `nombreUsuario` char(25) NOT NULL,
  `contrasena` char(60) NOT NULL,
  `fechaCreacion` date NOT NULL DEFAULT curdate(),
  `verificado` int(1) NOT NULL DEFAULT 0,
  `sancion` int(3) NOT NULL DEFAULT 0,
  `imagen` char(43) NOT NULL DEFAULT 'default.png',
  `valoracion` int(11) NOT NULL DEFAULT 0,
  `nombreRol` char(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura para la vista `informe`
--
DROP TABLE IF EXISTS `informe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `informe`  AS SELECT `mes`.`mes` AS `mes`, coalesce(`pets`.`cantidadPeticiones`,0) AS `cantidadPeticiones`, coalesce(`bajas`.`cantidadBajas`,0) AS `cantidadBajas`, coalesce(`admitidas`.`cantidadAdmitidas`,0) AS `cantidadAdmitidas`, coalesce(`exitosas`.`cantidadExitosas`,0) AS `cantidadExitosas`, coalesce(`noadmitidas`.`cantidadNoAdmitidas`,0) AS `cantidadNoAdmitidas`, coalesce(`usuarios`.`cantidadUsuariosNuevos`,0) AS `cantidadUsuariosNuevos`, coalesce(`firmas`.`cantidadFirmas`,0) AS `cantidadFirmas`, coalesce(`registradas`.`cantidadRegistradas`,0) AS `cantidadRegistradas`, coalesce(`noregistradas`.`cantidadNoRegistradas`,0) AS `cantidadNoRegistradas`, coalesce(`publicas`.`cantidadPublicas`,0) AS `cantidadPublicas`, coalesce(`anonimas`.`cantidadAnonimas`,0) AS `cantidadAnonimas` FROM ((((((((((((select distinct date_format(`peticion`.`fecha`,'%Y-%m') AS `mes` from `peticion` union select distinct date_format(`usuario`.`fechaCreacion`,'%Y-%m') AS `mes` from `usuario` union select distinct date_format(`firma`.`fecha`,'%Y-%m') AS `mes` from `firma`) `mes` left join (select date_format(`peticion`.`fecha`,'%Y-%m') AS `mes`,count(`peticion`.`nroPet`) AS `cantidadPeticiones` from `peticion` group by date_format(`peticion`.`fecha`,'%Y-%m')) `pets` on(`mes`.`mes` = `pets`.`mes`)) left join (select date_format(`peticion`.`fecha`,'%Y-%m') AS `mes`,count(`peticion`.`nroPet`) AS `cantidadBajas` from `peticion` where `peticion`.`estado` = -2 group by date_format(`peticion`.`fecha`,'%Y-%m')) `bajas` on(`mes`.`mes` = `bajas`.`mes`)) left join (select date_format(`peticion`.`fecha`,'%Y-%m') AS `mes`,count(`peticion`.`nroPet`) AS `cantidadAdmitidas` from `peticion` where `peticion`.`estado` >= 0 group by date_format(`peticion`.`fecha`,'%Y-%m')) `admitidas` on(`mes`.`mes` = `admitidas`.`mes`)) left join (select date_format(`peticion`.`fecha`,'%Y-%m') AS `mes`,count(`peticion`.`nroPet`) AS `cantidadNoAdmitidas` from `peticion` where `peticion`.`estado` = -1 group by date_format(`peticion`.`fecha`,'%Y-%m')) `noadmitidas` on(`mes`.`mes` = `noadmitidas`.`mes`)) left join (select date_format(`peticion`.`fecha`,'%Y-%m') AS `mes`,count(`peticion`.`nroPet`) AS `cantidadExitosas` from `peticion` where `peticion`.`estado` >= 1 group by date_format(`peticion`.`fecha`,'%Y-%m')) `exitosas` on(`mes`.`mes` = `exitosas`.`mes`)) left join (select date_format(`usuario`.`fechaCreacion`,'%Y-%m') AS `mes`,count(`usuario`.`correo`) AS `cantidadUsuariosNuevos` from `usuario` group by date_format(`usuario`.`fechaCreacion`,'%Y-%m')) `usuarios` on(`mes`.`mes` = `usuarios`.`mes`)) left join (select date_format(`firma`.`fecha`,'%Y-%m') AS `mes`,count(`firma`.`idFirma`) AS `cantidadFirmas` from `firma` group by date_format(`firma`.`fecha`,'%Y-%m')) `firmas` on(`mes`.`mes` = `firmas`.`mes`)) left join (select date_format(`firma`.`fecha`,'%Y-%m') AS `mes`,count(`firma`.`idFirma`) AS `cantidadRegistradas` from `firma` where `firma`.`correo` <> '' and `firma`.`ip` = '0.0.0.0' group by date_format(`firma`.`fecha`,'%Y-%m')) `registradas` on(`mes`.`mes` = `registradas`.`mes`)) left join (select date_format(`firma`.`fecha`,'%Y-%m') AS `mes`,count(`firma`.`idFirma`) AS `cantidadNoRegistradas` from `firma` where `firma`.`correo` = '' and `firma`.`ip` <> '0.0.0.0' group by date_format(`firma`.`fecha`,'%Y-%m')) `noregistradas` on(`mes`.`mes` = `noregistradas`.`mes`)) left join (select date_format(`firma`.`fecha`,'%Y-%m') AS `mes`,count(`firma`.`idFirma`) AS `cantidadPublicas` from `firma` where `firma`.`anon` = 0 group by date_format(`firma`.`fecha`,'%Y-%m')) `publicas` on(`mes`.`mes` = `publicas`.`mes`)) left join (select date_format(`firma`.`fecha`,'%Y-%m') AS `mes`,count(`firma`.`idFirma`) AS `cantidadAnonimas` from `firma` where `firma`.`anon` = 1 group by date_format(`firma`.`fecha`,'%Y-%m')) `anonimas` on(`mes`.`mes` = `anonimas`.`mes`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `peticion_objetivo`
--
DROP TABLE IF EXISTS `peticion_objetivo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `peticion_objetivo`  AS SELECT `p`.`nroPet` AS `numero`, `p`.`estado` AS `estado`, `p`.`objFirmas` AS `objetivo`, count(`f`.`nroPet`) AS `firmas` FROM (`peticion` `p` left join `firma` `f` on(`p`.`nroPet` = `f`.`nroPet`)) GROUP BY `p`.`nroPet`, `p`.`estado`, `p`.`objFirmas` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abarca`
--
ALTER TABLE `abarca`
  ADD PRIMARY KEY (`nroEnc`,`nombreTem`),
  ADD KEY `nombreTem` (`nombreTem`);

--
-- Indices de la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD PRIMARY KEY (`correo`),
  ADD KEY `afiliado_ibfk_2` (`nombrePais`,`nombreProv`,`nombreLoc`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`nombreDest`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`nroEnc`);

--
-- Indices de la tabla `estatuto`
--
ALTER TABLE `estatuto`
  ADD PRIMARY KEY (`correo`);

--
-- Indices de la tabla `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`idFirma`),
  ADD UNIQUE KEY `nroPet` (`nroPet`,`correo`,`ip`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`nroPet`,`nroImg`);

--
-- Indices de la tabla `interesa`
--
ALTER TABLE `interesa`
  ADD PRIMARY KEY (`correo`,`nombreTem`),
  ADD KEY `nombreTem` (`nombreTem`);

--
-- Indices de la tabla `ipdir`
--
ALTER TABLE `ipdir`
  ADD PRIMARY KEY (`ip`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`nombrePais`,`nombreProv`,`nombreLoc`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`nombrePais`);

--
-- Indices de la tabla `peticion`
--
ALTER TABLE `peticion`
  ADD PRIMARY KEY (`nroPet`),
  ADD KEY `correo` (`correo`),
  ADD KEY `nroPet_multiple` (`nroPet_multiple`),
  ADD KEY `peticion_ibfk_2` (`nombreDest`),
  ADD KEY `peticion_ibfk_3` (`nombrePais`,`nombreProv`,`nombreLoc`);

--
-- Indices de la tabla `peticionmultiple`
--
ALTER TABLE `peticionmultiple`
  ADD PRIMARY KEY (`nroPet`);

--
-- Indices de la tabla `peticionplus`
--
ALTER TABLE `peticionplus`
  ADD PRIMARY KEY (`nroPet`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`nombrePais`,`nombreProv`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`nroRep`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`nombreRol`);

--
-- Indices de la tabla `tematica`
--
ALTER TABLE `tematica`
  ADD PRIMARY KEY (`nombreTem`);

--
-- Indices de la tabla `trata`
--
ALTER TABLE `trata`
  ADD PRIMARY KEY (`nroPet`,`nombreTem`),
  ADD KEY `trata_ibfk_2` (`nombreTem`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`),
  ADD KEY `nombreRol` (`nombreRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `nroEnc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `firma`
--
ALTER TABLE `firma`
  MODIFY `idFirma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peticion`
--
ALTER TABLE `peticion`
  MODIFY `nroPet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `nroRep` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abarca`
--
ALTER TABLE `abarca`
  ADD CONSTRAINT `abarca_ibfk_1` FOREIGN KEY (`nroEnc`) REFERENCES `encuesta` (`nroEnc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `abarca_ibfk_2` FOREIGN KEY (`nombreTem`) REFERENCES `tematica` (`nombreTem`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD CONSTRAINT `afiliado_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `afiliado_ibfk_2` FOREIGN KEY (`nombrePais`,`nombreProv`,`nombreLoc`) REFERENCES `localidad` (`nombrePais`, `nombreProv`, `nombreLoc`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estatuto`
--
ALTER TABLE `estatuto`
  ADD CONSTRAINT `estatuto_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `firma`
--
ALTER TABLE `firma`
  ADD CONSTRAINT `firma_ibfk_1` FOREIGN KEY (`nroPet`) REFERENCES `peticion` (`nroPet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`nroPet`) REFERENCES `peticion` (`nroPet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `interesa`
--
ALTER TABLE `interesa`
  ADD CONSTRAINT `interesa_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `interesa_ibfk_2` FOREIGN KEY (`nombreTem`) REFERENCES `tematica` (`nombreTem`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`nombrePais`,`nombreProv`) REFERENCES `provincia` (`nombrePais`, `nombreProv`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `peticion`
--
ALTER TABLE `peticion`
  ADD CONSTRAINT `peticion_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `peticion_ibfk_2` FOREIGN KEY (`nombreDest`) REFERENCES `destino` (`nombreDest`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `peticion_ibfk_3` FOREIGN KEY (`nombrePais`,`nombreProv`,`nombreLoc`) REFERENCES `localidad` (`nombrePais`, `nombreProv`, `nombreLoc`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `peticion_ibfk_4` FOREIGN KEY (`nroPet_multiple`) REFERENCES `peticionmultiple` (`nroPet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `peticionmultiple`
--
ALTER TABLE `peticionmultiple`
  ADD CONSTRAINT `peticionmultiple_ibfk_1` FOREIGN KEY (`nroPet`) REFERENCES `peticion` (`nroPet`) ON DELETE CASCADE;

--
-- Filtros para la tabla `peticionplus`
--
ALTER TABLE `peticionplus`
  ADD CONSTRAINT `peticionplus_ibfk_1` FOREIGN KEY (`nroPet`) REFERENCES `peticion` (`nroPet`) ON DELETE CASCADE;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`nombrePais`) REFERENCES `pais` (`nombrePais`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trata`
--
ALTER TABLE `trata`
  ADD CONSTRAINT `trata_ibfk_1` FOREIGN KEY (`nroPet`) REFERENCES `peticion` (`nroPet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trata_ibfk_2` FOREIGN KEY (`nombreTem`) REFERENCES `tematica` (`nombreTem`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`nombreRol`) REFERENCES `rol` (`nombreRol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
