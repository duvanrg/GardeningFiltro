

--
-- Base de datos: `gardening`
--

DROP DATABASE IF EXISTS gardeningFiltro;

CREATE DATABASE gardeningFiltro CHARACTER SET utf8mb4;

USE gardeningFiltro;

DROP TABLE IF EXISTS payment_detail;

DROP TABLE IF EXISTS method_payment;

DROP TABLE IF EXISTS order_detail;

DROP TABLE IF EXISTS product;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS status;

DROP TABLE IF EXISTS client;

DROP TABLE IF EXISTS product_line;

DROP TABLE IF EXISTS employee;

DROP TABLE IF EXISTS office;

DROP TABLE IF EXISTS supplier;

DROP TABLE IF EXISTS person;

DROP TABLE IF EXISTS person_type;

DROP TABLE IF EXISTS postal_code;

DROP TABLE IF EXISTS city;

DROP TABLE IF EXISTS state;

DROP TABLE IF EXISTS country;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `Id` int(11) NOT NULL,
  `CityName` varchar(50) NOT NULL,
  `StateId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`Id`, `CityName`, `StateId`) VALUES
(1, 'San Francisco', 8),
(2, 'Miami', 14),
(3, 'New York', 5),
(4, 'Fuenlabrada', 6),
(5, 'Madrid', 6),
(6, 'San Lorenzo del Escorial', 6),
(7, 'Montornes del valles', 3),
(8, 'Santa cruz de Tenerife', 15),
(9, 'Barcelona', 12),
(10, 'Canarias', 13),
(11, 'Sotogrande', 16),
(12, 'Humanes', 6),
(13, 'Getafe', 6),
(14, 'Boston', 4),
(15, 'Londres', 18),
(16, 'Paris', 2),
(17, 'Sydney', 17),
(18, 'Talavera de la Reina', 10),
(19, 'Tokyo', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `Id` int(11) NOT NULL,
  `ClientName` varchar(50) DEFAULT NULL,
  `PersonId` int(11) NOT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `LineAddress` varchar(100) DEFAULT NULL,
  `LineAddress2` varchar(100) DEFAULT NULL,
  `PostalCodeId` int(11) NOT NULL,
  `CodEmployee` int(11) DEFAULT NULL,
  `CreditLimit` decimal(65,30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`Id`, `ClientName`, `PersonId`, `Phone`, `Fax`, `LineAddress`, `LineAddress2`, `PostalCodeId`, `CodEmployee`, `CreditLimit`) VALUES
(1, 'GoldFish Garden', 32, '5556901745', '5556901746', 'False Street 52 2 A', NULL, 1, 19, '3000.000000000000000000000000000000'),
(2, 'Gardening Associates', 33, '5557410345', '5557410346', 'Wall-e Avenue', NULL, 2, 19, '6000.000000000000000000000000000000'),
(3, 'Gerudo Valley', 34, '5552323129', '5552323128', 'Oaks Avenue nº22', NULL, 3, 22, '12000.000000000000000000000000000000'),
(4, 'Tendo Garden', 35, '55591233210', '55591233211', 'Null Street nº69', NULL, 4, 22, '600000.000000000000000000000000000000'),
(5, 'Lasas S.A.', 36, '34916540145', '34914851312', 'C/Leganes 15', NULL, 5, 8, '154310.000000000000000000000000000000'),
(6, 'Beragua', 37, '654987321', '916549872', 'C/pintor segundo', 'Getafe', 6, 11, '20000.000000000000000000000000000000'),
(7, 'Club Golf Puerta del hierro', 38, '62456810', '919535678', 'C/sinesio delgado', 'Madrid', 7, 11, '40000.000000000000000000000000000000'),
(8, 'Naturagua', 39, '689234750', '916428956', 'C/majadahonda', 'Boadilla', 8, 11, '32000.000000000000000000000000000000'),
(9, 'DaraDistribuciones', 40, '675598001', '916421756', 'C/azores', 'Fuenlabrada', 9, 11, '50000.000000000000000000000000000000'),
(10, 'Madrileña de riegos', 41, '655983045', '916689215', 'C/Lagañas', 'Fuenlabrada', 10, 11, '20000.000000000000000000000000000000'),
(11, 'Lasas S.A.', 42, '34916540145', '34914851312', 'C/Leganes 15', NULL, 5, 8, '154310.000000000000000000000000000000'),
(12, 'Camunas Jardines S.L.', 43, '34914873241', '34914871541', 'C/Virgenes 45', 'C/Princesas 2 1ºB', 11, 8, '16481.000000000000000000000000000000'),
(13, 'Dardena S.A', 44, '34912453217', '34912484764', 'C/Nueva York 74', NULL, 12, 8, '321000.000000000000000000000000000000'),
(14, 'Jardin de Flores', 45, '654865643', '914538776', 'C/ Oña 34', NULL, 13, 30, '40000.000000000000000000000000000000'),
(15, 'Flores Marivi', 46, '666555444', '912458657', 'C/Leganes24', NULL, 5, 5, '1500.000000000000000000000000000000'),
(16, 'Flowers, S.A', 47, '698754159', '978453216', 'C/Luis Salquillo4', NULL, 14, 5, '3500.000000000000000000000000000000'),
(17, 'Naturajardin', 48, '612343529', '916548735', 'Plaza Magallón 15', NULL, 15, 30, '5050.000000000000000000000000000000'),
(18, 'Golf S.A.', 49, '916458762', '912354475', 'C/Estancado', NULL, 16, 12, '30000.000000000000000000000000000000'),
(19, 'Americh Golf Management SL', 50, '964493072', '964493063', 'C/Letardo', NULL, 17, 12, '20000.000000000000000000000000000000'),
(20, 'Aloha', 51, '916485852', '914489898', 'C/Roman 3', NULL, 18, 12, '50000.000000000000000000000000000000'),
(21, 'El Prat', 52, '916882323', '916493211', 'Avenida Tibidabo', NULL, 17, 12, '30000.000000000000000000000000000000'),
(22, 'Sotogrande', 53, '915576622', '914825645', 'C/Paseo del Parque', NULL, 19, 12, '60000.000000000000000000000000000000'),
(23, 'Vivero Humanes', 54, '654987690', '916040875', 'C/Miguel Echegaray 54', NULL, 20, 30, '7430.000000000000000000000000000000'),
(24, 'Fuenla City', 55, '675842139', '915483754', 'C/Callo 52', NULL, 21, 5, '4500.000000000000000000000000000000'),
(25, 'Jardines y Mansiones Cactus SL', 56, '916877445', '914477777', 'Polígono Industrial Maspalomas, Nº52', 'Móstoles', 26, 9, '76000.000000000000000000000000000000'),
(26, 'Jardinerías Matías SL', 57, '916544147', '917897474', 'C/Francisco Arce, Nº44', 'Bustarviejo', 23, 9, '100500.000000000000000000000000000000'),
(27, 'Agrojardin', 58, '675432926', '916549264', 'C/Mar Caspio 43', NULL, 24, 30, '8040.000000000000000000000000000000'),
(28, 'Top Campo', 59, '685746512', '974315924', 'C/Ibiza 32', NULL, 21, 5, '5500.000000000000000000000000000000'),
(29, 'Jardineria Sara', 60, '675124537', '912475843', 'C/Lima 1', NULL, 25, 5, '7500.000000000000000000000000000000'),
(30, 'Campohermoso', 61, '645925376', '916159116', 'C/Peru 78', NULL, 5, 30, '3250.000000000000000000000000000000'),
(31, 'france telecom', 62, '(33)5120578961', '(33)5120578961', '6 place d Alleray 15Ã¨me', NULL, 35, 16, '10000.000000000000000000000000000000'),
(32, 'Musée du Louvre', 63, '(33)0140205050', '(33)0140205442', 'Quai du Louvre', NULL, 36, 16, '30000.000000000000000000000000000000'),
(33, 'Tutifruti S.A', 64, '2 9261-2433', '2 9283-1695', 'level 24, St. Martins Tower.-31 Market St.', NULL, 37, 31, '10000.000000000000000000000000000000'),
(34, 'Flores S.L.', 65, '654352981', '685249700', 'Avenida España', NULL, 38, 18, '6000.000000000000000000000000000000'),
(35, 'The Magic Garden', 66, '926523468', '9364875882', 'Lihgting Park', NULL, 39, 18, '10000.000000000000000000000000000000'),
(36, 'El Jardin Viviente S.L', 67, '2 8005-7161', '2 8005-7162', '176 Cumberland Street The rocks', NULL, 40, 31, '8000.000000000000000000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `Id` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`Id`, `CountryName`) VALUES
(1, 'USA'),
(2, 'España'),
(3, 'Inglaterra'),
(4, 'Francia'),
(5, 'Australia'),
(6, 'Japón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `Id` int(11) NOT NULL,
  `PersonId` int(11) NOT NULL,
  `Extention` varchar(50) DEFAULT NULL,
  `OfficeCode` varchar(255) DEFAULT NULL,
  `ManagerCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`Id`, `PersonId`, `Extention`, `OfficeCode`, `ManagerCode`) VALUES
(1, 1, '3897', 'TAL-ES', NULL),
(2, 2, '2899', 'TAL-ES', 1),
(3, 3, '2837', 'TAL-ES', 2),
(4, 4, '2847', 'TAL-ES', 2),
(5, 5, '2844', 'TAL-ES', 3),
(6, 6, '2845', 'TAL-ES', 3),
(7, 7, '2444', 'MAD-ES', 3),
(8, 8, '2442', 'MAD-ES', 7),
(9, 9, '2442', 'MAD-ES', 7),
(10, 10, '2444', 'MAD-ES', 7),
(11, 11, '2518', 'BCN-ES', 3),
(12, 12, '2519', 'BCN-ES', 11),
(13, 13, '2519', 'BCN-ES', 11),
(14, 14, '2519', 'BCN-ES', 11),
(15, 15, '9981', 'PAR-FR', 3),
(16, 16, '9982', 'PAR-FR', 15),
(17, 17, '9982', 'PAR-FR', 15),
(18, 18, '7454', 'SFC-USA', 3),
(19, 19, '7454', 'SFC-USA', 18),
(20, 20, '7565', 'BOS-USA', 3),
(21, 21, '7565', 'BOS-USA', 20),
(22, 22, '7665', 'BOS-USA', 20),
(23, 23, '8734', 'TOK-JP', 3),
(24, 24, '8734', 'TOK-JP', 23),
(25, 25, '8735', 'TOK-JP', 23),
(26, 26, '3321', 'LON-UK', 3),
(27, 27, '3322', 'LON-UK', 26),
(28, 28, '3322', 'LON-UK', 26),
(29, 29, '3210', 'SYD-AU', 3),
(30, 30, '3211', 'SYD-AU', 29),
(31, 31, '3211', 'SYD-AU', 29),
(33, 68, '6546', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `methodpayments`
--

CREATE TABLE `methodpayments` (
  `Id` int(11) NOT NULL,
  `MethodPayment1` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `methodpayments`
--

INSERT INTO `methodpayments` (`Id`, `MethodPayment1`) VALUES
(1, 'PayPal'),
(2, 'Transferencia'),
(3, 'Cheque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offices`
--

CREATE TABLE `offices` (
  `Id` varchar(255) NOT NULL,
  `PostalCodeId` int(11) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `AddressLine1` varchar(50) NOT NULL,
  `AddressLine2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `offices`
--

INSERT INTO `offices` (`Id`, `PostalCodeId`, `Phone`, `AddressLine1`, `AddressLine2`) VALUES
('BCN-ES', 26, '+34 93 3561182', 'Avenida Diagonal, 38', '3A escalera Derecha'),
('BOS-USA', 27, '+1 215 837 0825', '1550 Court Place', 'Suite 102'),
('LON-UK', 28, '+44 20 78772041', '52 Old Broad Street', 'Ground Floor'),
('MAD-ES', 29, '+34 91 7514487', 'Bulevar Indalecio Prieto, 32', ''),
('PAR-FR', 30, '+33 14 723 4404', '29 Rue Jouffroy d\'abbans', ''),
('SFC-USA', 31, '+1 650 219 4782', '100 Market Street', 'Suite 300'),
('SYD-AU', 32, '+61 2 9264 2451', '5-11 Wentworth Avenue', 'Floor #2'),
('TAL-ES', 33, '+34 925 867231', 'Francisco Aguirre, 32', '5º piso (exterior)'),
('TOK-JP', 34, '+81 33 224 5000', '4-1 Kioicho', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderdetails`
--

CREATE TABLE `orderdetails` (
  `Id` int(11) NOT NULL,
  `ProductCode` varchar(255) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `LineNumber` smallint(6) NOT NULL,
  `OrderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orderdetails`
--

INSERT INTO `orderdetails` (`Id`, `ProductCode`, `Quantity`, `UnitPrice`, `LineNumber`, `OrderId`) VALUES
(1, 'FR-67', 10, 70, 3, 1),
(2, 'OR-127', 40, 4, 1, 1),
(3, 'OR-141', 25, 4, 2, 1),
(4, 'OR-241', 15, 19, 4, 1),
(5, 'OR-99', 23, 14, 5, 1),
(6, 'FR-4', 3, 29, 6, 2),
(7, 'FR-40', 7, 8, 7, 2),
(8, 'OR-140', 50, 4, 3, 2),
(9, 'OR-141', 20, 5, 2, 2),
(10, 'OR-159', 12, 6, 5, 2),
(11, 'OR-227', 67, 64, 1, 2),
(12, 'OR-247', 5, 462, 4, 2),
(13, 'FR-48', 120, 9, 6, 3),
(14, 'OR-122', 32, 5, 4, 3),
(15, 'OR-123', 11, 5, 5, 3),
(16, 'OR-213', 30, 266, 1, 3),
(17, 'OR-217', 15, 65, 2, 3),
(18, 'OR-218', 24, 25, 3, 3),
(19, 'FR-31', 12, 8, 7, 4),
(20, 'FR-34', 42, 8, 6, 4),
(21, 'FR-40', 42, 9, 8, 4),
(22, 'OR-152', 3, 6, 5, 4),
(23, 'OR-155', 4, 6, 3, 4),
(24, 'OR-156', 17, 9, 4, 4),
(25, 'OR-157', 38, 10, 2, 4),
(26, 'OR-222', 21, 59, 1, 4),
(27, 'FR-106', 3, 11, 1, 8),
(28, 'FR-108', 1, 32, 2, 8),
(29, 'FR-11', 10, 100, 3, 8),
(30, 'AR-001', 80, 1, 3, 9),
(31, 'AR-008', 450, 1, 2, 9),
(32, 'FR-106', 80, 8, 1, 9),
(33, 'FR-69', 15, 91, 2, 9),
(34, 'FR-82', 5, 70, 2, 10),
(35, 'FR-91', 30, 75, 1, 10),
(36, 'OR-234', 5, 64, 3, 10),
(37, 'AR-006', 180, 1, 3, 11),
(38, 'OR-247', 80, 8, 1, 11),
(39, 'AR-009', 290, 1, 1, 12),
(40, '11679', 5, 14, 1, 13),
(41, '21636', 12, 14, 2, 13),
(42, 'FR-11', 5, 100, 3, 13),
(43, 'FR-100', 8, 11, 2, 14),
(44, 'FR-13', 13, 57, 1, 14),
(45, 'FR-84', 4, 13, 3, 15),
(46, 'OR-101', 2, 6, 2, 15),
(47, 'OR-156', 6, 10, 1, 15),
(48, 'OR-203', 9, 10, 4, 15),
(49, '30310', 12, 12, 1, 16),
(50, 'FR-36', 10, 9, 2, 16),
(51, '11679', 5, 14, 1, 17),
(52, '22225', 5, 12, 3, 17),
(53, 'FR-37', 5, 9, 2, 17),
(54, 'FR-64', 5, 22, 4, 17),
(55, 'OR-136', 5, 18, 5, 17),
(56, '22225', 4, 12, 2, 18),
(57, 'FR-22', 2, 4, 1, 18),
(58, 'OR-159', 10, 6, 3, 18),
(59, '30310', 9, 12, 5, 19),
(60, 'FR-23', 6, 8, 4, 19),
(61, 'FR-75', 1, 32, 2, 19),
(62, 'FR-84', 5, 13, 1, 19),
(63, 'OR-208', 20, 4, 3, 19),
(64, '11679', 14, 14, 1, 20),
(65, '30310', 8, 12, 2, 20),
(66, '21636', 5, 14, 3, 21),
(67, 'FR-18', 22, 4, 1, 21),
(68, 'FR-53', 3, 8, 2, 21),
(69, 'OR-240', 1, 6, 1, 22),
(70, 'AR-002', 110, 1, 4, 23),
(71, 'FR-107', 50, 22, 3, 23),
(72, 'FR-85', 4, 70, 2, 23),
(73, 'OR-249', 30, 5, 1, 23),
(74, '22225', 3, 15, 1, 24),
(75, 'FR-1', 4, 7, 4, 24),
(76, 'FR-23', 2, 7, 2, 24),
(77, 'OR-241', 10, 20, 3, 24),
(78, 'FR-77', 15, 69, 1, 25),
(79, 'FR-9', 4, 30, 3, 25),
(80, 'FR-94', 10, 30, 2, 25),
(81, 'FR-15', 9, 25, 3, 26),
(82, 'OR-188', 4, 25, 1, 26),
(83, 'OR-218', 14, 25, 2, 26),
(84, 'OR-101', 22, 6, 2, 27),
(85, 'OR-102', 22, 6, 3, 27),
(86, 'OR-186', 40, 6, 1, 27),
(87, 'FR-11', 8, 99, 3, 28),
(88, 'OR-213', 3, 266, 2, 28),
(89, 'OR-247', 1, 462, 1, 28),
(90, 'FR-82', 4, 70, 4, 29),
(91, 'FR-9', 4, 28, 1, 29),
(92, 'FR-94', 20, 31, 5, 29),
(93, 'OR-129', 2, 111, 2, 29),
(94, 'OR-160', 10, 9, 3, 29),
(95, 'AR-004', 10, 1, 6, 30),
(96, 'FR-108', 2, 32, 2, 30),
(97, 'FR-12', 2, 19, 3, 30),
(98, 'FR-72', 4, 31, 5, 30),
(99, 'FR-89', 10, 45, 1, 30),
(100, 'OR-120', 5, 5, 4, 30),
(101, 'AR-009', 25, 2, 3, 31),
(102, 'FR-102', 1, 20, 1, 31),
(103, 'FR-4', 6, 29, 2, 31),
(104, '11679', 1, 14, 4, 32),
(105, '21636', 4, 15, 5, 32),
(106, '22225', 1, 15, 3, 32),
(107, 'OR-128', 29, 100, 2, 32),
(108, 'OR-193', 5, 20, 1, 32),
(109, 'FR-17', 423, 2, 4, 33),
(110, 'FR-29', 120, 8, 3, 33),
(111, 'OR-214', 212, 10, 2, 33),
(112, 'OR-247', 150, 462, 1, 33),
(113, 'FR-3', 56, 7, 4, 34),
(114, 'FR-7', 12, 29, 3, 34),
(115, 'OR-172', 20, 18, 1, 34),
(116, 'OR-174', 24, 18, 2, 34),
(117, '21636', 12, 14, 4, 35),
(118, 'FR-47', 55, 8, 3, 35),
(119, 'OR-165', 3, 10, 2, 35),
(120, 'OR-181', 36, 10, 1, 35),
(121, 'OR-225', 72, 10, 5, 35),
(122, '30310', 4, 12, 2, 36),
(123, 'FR-1', 2, 7, 3, 36),
(124, 'OR-147', 6, 7, 4, 36),
(125, 'OR-203', 1, 12, 5, 36),
(126, 'OR-99', 15, 13, 1, 36),
(127, 'FR-105', 4, 70, 1, 37),
(128, 'FR-57', 203, 8, 2, 37),
(129, 'OR-176', 38, 10, 3, 37),
(130, '11679', 5, 14, 1, 38),
(131, '21636', 2, 14, 2, 38),
(132, '22225', 3, 12, 1, 39),
(133, '30310', 6, 12, 2, 39),
(134, 'AR-001', 4, 1, 1, 40),
(135, 'AR-002', 8, 1, 2, 40),
(136, 'AR-003', 5, 1, 1, 41),
(137, 'AR-004', 5, 1, 2, 41),
(138, 'AR-005', 3, 1, 1, 42),
(139, 'AR-006', 1, 1, 2, 42),
(140, 'AR-007', 9, 1, 1, 43),
(141, 'AR-008', 5, 1, 1, 44),
(142, 'AR-009', 6, 1, 1, 45),
(143, 'AR-010', 4, 1, 2, 45),
(144, 'FR-1', 4, 7, 1, 46),
(145, 'FR-10', 8, 7, 2, 46),
(146, 'FR-100', 9, 11, 1, 47),
(147, 'FR-101', 5, 13, 2, 47),
(148, 'FR-102', 1, 18, 1, 48),
(149, 'FR-103', 1, 25, 2, 48),
(150, 'OR-234', 50, 64, 1, 48),
(151, 'OR-236', 45, 49, 2, 48),
(152, 'OR-237', 50, 19, 3, 48),
(153, 'OR-204', 50, 10, 1, 49),
(154, 'OR-205', 10, 10, 2, 49),
(155, 'OR-206', 5, 5, 3, 49),
(156, 'OR-225', 12, 10, 1, 50),
(157, 'OR-226', 15, 38, 2, 50),
(158, 'OR-227', 44, 64, 3, 50),
(159, 'OR-209', 50, 10, 1, 51),
(160, 'OR-210', 80, 39, 2, 51),
(161, 'OR-211', 70, 59, 3, 51),
(162, 'FR-67', 10, 70, 1, 52),
(163, 'FR-2', 1, 7, 1, 53),
(164, 'FR-85', 1, 70, 3, 53),
(165, 'FR-86', 2, 11, 2, 53),
(166, 'OR-116', 6, 7, 4, 53),
(167, '11679', 3, 14, 3, 54),
(168, 'FR-100', 45, 10, 2, 54),
(169, 'FR-18', 5, 4, 1, 54),
(170, 'FR-79', 3, 22, 4, 54),
(171, 'OR-116', 8, 7, 6, 54),
(172, 'OR-123', 3, 5, 5, 54),
(173, 'OR-168', 2, 10, 7, 54),
(174, 'OR-115', 9, 7, 1, 55),
(175, 'OR-213', 2, 266, 2, 55),
(176, 'OR-227', 6, 64, 5, 55),
(177, 'OR-243', 2, 64, 4, 55),
(178, 'OR-247', 1, 462, 3, 55),
(179, 'OR-129', 1, 115, 5, 56),
(180, 'OR-130', 10, 18, 6, 56),
(181, 'OR-179', 1, 6, 3, 56),
(182, 'OR-196', 3, 10, 4, 56),
(183, 'OR-207', 4, 4, 2, 56),
(184, 'OR-250', 3, 10, 1, 56),
(185, 'FR-69', 6, 91, 4, 57),
(186, 'FR-81', 3, 49, 3, 57),
(187, 'FR-84', 2, 13, 1, 57),
(188, 'FR-94', 6, 9, 2, 57),
(189, 'OR-102', 65, 18, 3, 58),
(190, 'OR-139', 80, 4, 1, 58),
(191, 'OR-172', 69, 15, 2, 58),
(192, 'OR-177', 150, 15, 4, 58),
(193, 'FR-67', 10, 70, 1, 59),
(194, 'FR-67', 10, 70, 1, 60),
(195, 'FR-67', 10, 70, 1, 61),
(196, 'FR-67', 10, 70, 1, 62),
(197, 'FR-67', 10, 70, 1, 63),
(198, 'FR-67', 10, 70, 1, 64),
(199, 'FR-67', 10, 70, 1, 65),
(200, 'FR-67', 10, 70, 1, 66),
(201, 'FR-67', 10, 70, 1, 67),
(202, 'FR-67', 10, 70, 1, 68),
(203, 'FR-67', 15, 70, 1, 74),
(204, 'OR-227', 34, 64, 2, 74),
(205, 'OR-247', 42, 8, 3, 74),
(206, 'AR-006', 60, 1, 2, 75),
(207, 'FR-87', 24, 22, 3, 75),
(208, 'OR-157', 46, 10, 1, 75),
(209, 'AR-009', 250, 1, 5, 76),
(210, 'FR-79', 40, 22, 3, 76),
(211, 'FR-87', 24, 22, 4, 76),
(212, 'FR-94', 35, 9, 1, 76),
(213, 'OR-196', 25, 10, 2, 76),
(214, '22225', 34, 12, 2, 77),
(215, '30310', 15, 12, 1, 77),
(216, 'FR-53', 25, 8, 2, 78),
(217, 'FR-85', 56, 70, 3, 78),
(218, 'OR-157', 42, 10, 4, 78),
(219, 'OR-208', 30, 4, 1, 78),
(220, 'OR-240', 50, 6, 1, 79),
(221, 'FR-11', 40, 100, 3, 80),
(222, 'FR-36', 47, 9, 2, 80),
(223, 'OR-136', 75, 18, 1, 80),
(224, 'OR-208', 30, 4, 1, 81),
(225, 'OR-227', 34, 64, 1, 82),
(226, 'OR-208', 30, 4, 1, 83),
(227, 'FR-108', 3, 32, 2, 89),
(228, 'FR-3', 15, 7, 6, 89),
(229, 'FR-42', 12, 8, 4, 89),
(230, 'FR-66', 5, 49, 1, 89),
(231, 'FR-87', 4, 22, 3, 89),
(232, 'OR-157', 8, 10, 5, 89),
(233, 'AR-001', 19, 1, 1, 90),
(234, 'AR-002', 10, 1, 2, 90),
(235, 'AR-003', 12, 1, 3, 90),
(236, 'FR-100', 52, 11, 1, 91),
(237, 'FR-101', 14, 13, 2, 91),
(238, 'FR-102', 35, 18, 3, 91),
(239, 'FR-108', 12, 23, 1, 92),
(240, 'FR-11', 20, 100, 2, 92),
(241, 'FR-12', 30, 21, 3, 92),
(242, 'FR-54', 25, 9, 1, 93),
(243, 'FR-58', 51, 11, 2, 93),
(244, 'FR-60', 3, 32, 3, 93),
(245, '11679', 12, 14, 1, 94),
(246, 'FR-11', 33, 100, 3, 94),
(247, 'FR-4', 79, 29, 2, 94),
(248, 'FR-10', 9, 7, 2, 95),
(249, 'FR-75', 6, 32, 1, 95),
(250, 'FR-82', 5, 70, 3, 95),
(251, 'FR-43', 6, 8, 1, 96),
(252, 'FR-6', 16, 7, 4, 96),
(253, 'FR-71', 10, 22, 3, 96),
(254, 'FR-90', 4, 70, 2, 96),
(255, 'FR-41', 12, 8, 1, 97),
(256, 'FR-54', 14, 9, 2, 97),
(257, 'OR-156', 10, 10, 3, 97),
(258, 'FR-33', 14, 8, 4, 98),
(259, 'FR-56', 16, 8, 3, 98),
(260, 'FR-60', 8, 32, 1, 98),
(261, 'FR-8', 18, 6, 5, 98),
(262, 'FR-85', 6, 70, 2, 98),
(263, 'OR-157', 15, 10, 2, 99),
(264, 'OR-227', 30, 64, 1, 99),
(265, 'FR-87', 20, 22, 1, 100),
(266, 'FR-94', 40, 9, 2, 100),
(267, 'AR-006', 50, 1, 1, 101),
(268, 'AR-009', 159, 1, 2, 101),
(269, '22225', 32, 12, 2, 102),
(270, '30310', 23, 12, 1, 102),
(271, 'FR-53', 12, 8, 2, 103),
(272, 'OR-208', 52, 4, 1, 103),
(273, 'FR-85', 9, 70, 1, 104),
(274, 'OR-157', 113, 10, 2, 104),
(275, 'OR-227', 21, 64, 2, 105),
(276, 'OR-240', 27, 6, 1, 105),
(277, 'AR-009', 231, 1, 1, 106),
(278, 'OR-136', 47, 18, 2, 106),
(279, '30310', 143, 12, 2, 107),
(280, 'FR-11', 15, 100, 1, 107),
(281, 'FR-53', 53, 8, 1, 108),
(282, 'OR-208', 59, 4, 2, 108),
(283, 'FR-22', 8, 4, 5, 109),
(284, 'FR-36', 12, 9, 3, 109),
(285, 'FR-45', 14, 8, 4, 109),
(286, 'OR-104', 20, 10, 1, 109),
(287, 'OR-119', 10, 5, 2, 109),
(288, 'OR-125', 3, 5, 6, 109),
(289, 'OR-130', 2, 18, 7, 109),
(290, 'AR-010', 6, 1, 3, 110),
(291, 'FR-1', 14, 7, 1, 110),
(292, 'FR-16', 1, 45, 2, 110),
(293, 'FR-67', 10, 70, 1, 111),
(294, 'FR-67', 10, 70, 1, 112),
(295, 'FR-67', 10, 70, 1, 113),
(296, 'FR-67', 10, 70, 1, 114),
(297, 'FR-67', 10, 70, 1, 115),
(298, '21636', 5, 14, 1, 116),
(299, 'AR-001', 32, 1, 2, 116),
(300, 'AR-005', 18, 1, 5, 116),
(301, 'FR-33', 13, 8, 3, 116),
(302, 'OR-200', 10, 4, 4, 116),
(303, 'FR-78', 2, 15, 1, 117),
(304, 'FR-80', 1, 32, 3, 117),
(305, 'OR-146', 17, 4, 2, 117),
(306, 'OR-179', 4, 6, 4, 117),
(307, 'FR-67', 10, 70, 1, 118),
(308, 'FR-67', 10, 70, 1, 119),
(309, 'FR-67', 10, 70, 1, 120),
(310, 'FR-67', 10, 70, 1, 121),
(311, 'FR-67', 10, 70, 1, 122),
(312, 'FR-67', 10, 70, 1, 123),
(313, 'FR-67', 10, 70, 1, 124),
(314, 'FR-67', 10, 70, 1, 125),
(315, 'FR-67', 10, 70, 1, 126),
(316, 'FR-67', 10, 70, 1, 127),
(317, 'AR-004', 15, 1, 1, 128),
(318, 'OR-150', 18, 2, 2, 128);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ExpectedDate` date NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `StatusCode` int(11) NOT NULL,
  `Comments` varchar(500) DEFAULT NULL,
  `ClientCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`Id`, `OrderDate`, `ExpectedDate`, `DeliveryDate`, `StatusCode`, `Comments`, `ClientCode`) VALUES
(1, '2006-01-17', '2006-01-19', '2006-01-19', 1, 'Pagado a plazos', 4),
(2, '2007-10-23', '2007-10-28', '2007-10-26', 1, 'La entrega llego antes de lo esperado', 4),
(3, '2008-06-20', '2008-06-25', NULL, 2, 'Limite de credito superado', 4),
(4, '2009-01-20', '2009-01-26', NULL, 3, NULL, 4),
(8, '2008-11-09', '2008-11-14', '2008-11-14', 1, 'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas', 1),
(9, '2008-12-22', '2008-12-27', '2008-12-28', 1, 'El cliente comprueba la integridad del paquete, todo correcto', 1),
(10, '2009-01-15', '2009-01-20', NULL, 3, 'El cliente llama para confirmar la fecha - Esperando al proveedor', 2),
(11, '2009-01-20', '2009-01-27', NULL, 3, 'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h', 1),
(12, '2009-01-22', '2009-01-27', NULL, 3, 'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h', 1),
(13, '2009-01-12', '2009-01-14', '2009-01-15', 1, NULL, 6),
(14, '2009-01-02', '2009-01-02', NULL, 2, 'mal pago', 6),
(15, '2009-01-09', '2009-01-12', '2009-01-11', 1, NULL, 6),
(16, '2009-01-06', '2009-01-07', '2009-01-15', 1, NULL, 6),
(17, '2009-01-08', '2009-01-09', '2009-01-11', 1, 'mal estado', 6),
(18, '2009-01-05', '2009-01-06', '2009-01-07', 1, NULL, 8),
(19, '2009-01-18', '2009-02-12', NULL, 3, 'entregar en murcia', 8),
(20, '2009-01-20', '2009-02-15', NULL, 3, NULL, 8),
(21, '2009-01-09', '2009-01-09', '2009-01-09', 2, 'mal pago', 8),
(22, '2009-01-11', '2009-01-11', '2009-01-13', 1, NULL, 8),
(23, '2008-12-30', '2009-01-10', NULL, 2, 'El pedido fue anulado por el cliente', 4),
(24, '2008-07-14', '2008-07-31', '2008-07-25', 1, NULL, 13),
(25, '2009-02-02', '2009-02-08', NULL, 2, 'El cliente carece de saldo en la cuenta asociada', 1),
(26, '2009-02-06', '2009-02-12', NULL, 2, 'El cliente anula la operacion para adquirir mas producto', 2),
(27, '2009-02-07', '2009-02-13', NULL, 1, 'El pedido aparece como entregado pero no sabemos en que fecha', 2),
(28, '2009-02-10', '2009-02-17', '2009-02-20', 1, 'El cliente se queja bastante de la espera asociada al producto', 2),
(29, '2008-08-01', '2008-09-01', '2008-09-01', 2, 'El cliente no está conforme con el pedido', 13),
(30, '2008-08-03', '2008-09-03', '2008-08-31', 1, NULL, 12),
(31, '2008-09-04', '2008-09-30', '2008-10-04', 2, 'El cliente ha rechazado por llegar 5 dias tarde', 12),
(32, '2007-01-07', '2007-01-19', '2007-01-27', 1, 'Entrega tardia, el cliente puso reclamacion', 3),
(33, '2007-05-20', '2007-05-28', NULL, 2, 'El pedido fue anulado por el cliente', 3),
(34, '2007-06-20', '2008-06-28', '2008-06-28', 1, 'Pagado a plazos', 3),
(35, '2008-03-10', '2009-03-20', NULL, 2, 'Limite de credito superado', 3),
(36, '2008-10-15', '2008-12-15', '2008-12-10', 1, NULL, 13),
(37, '2008-11-03', '2009-11-13', NULL, 3, 'El pedido nunca llego a su destino', 3),
(38, '2009-03-05', '2009-03-06', '2009-03-07', 1, NULL, 18),
(39, '2009-03-06', '2009-03-07', '2009-03-09', 3, NULL, 18),
(40, '2009-03-09', '2009-03-10', '2009-03-13', 2, NULL, 18),
(41, '2009-03-12', '2009-03-13', '2009-03-13', 1, NULL, 18),
(42, '2009-03-22', '2009-03-23', '2009-03-27', 1, NULL, 18),
(43, '2009-03-25', '2009-03-26', '2009-03-28', 3, NULL, 22),
(44, '2009-03-26', '2009-03-27', '2009-03-30', 3, NULL, 22),
(45, '2009-04-01', '2009-03-04', '2009-03-07', 1, NULL, 22),
(46, '2009-04-03', '2009-03-04', '2009-03-05', 2, NULL, 22),
(47, '2009-04-15', '2009-03-17', '2009-03-17', 1, NULL, 22),
(48, '2008-03-17', '2008-03-30', '2008-03-29', 1, 'Según el Cliente, el pedido llegó defectuoso', 25),
(49, '2008-07-12', '2008-07-22', '2008-07-30', 1, 'El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora', 25),
(50, '2008-03-17', '2008-08-09', NULL, 3, 'Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ávila)', 25),
(51, '2008-10-01', '2008-10-14', '2008-10-14', 1, 'Todo se entregó a tiempo y en perfecto estado, a pesar del pésimo estado de las carreteras.', 25),
(52, '2008-12-07', '2008-12-21', NULL, 3, 'El transportista ha llamado a Eva María para indicarle que el pedido llegará más tarde de lo esperado.', 25),
(53, '2008-10-15', '2008-11-15', '2008-11-09', 1, 'El pedido llega 6 dias antes', 12),
(54, '2009-01-11', '2009-02-11', NULL, 3, NULL, 13),
(55, '2008-12-10', '2009-01-10', '2009-01-11', 1, 'Retrasado 1 dia por problemas de transporte', 13),
(56, '2008-12-19', '2009-01-20', NULL, 2, 'El cliente a anulado el pedido el dia 2009-01-10', 12),
(57, '2009-01-05', '2009-02-05', NULL, 3, NULL, 12),
(58, '2009-01-24', '2009-01-31', '2009-01-30', 1, 'Todo correcto', 2),
(59, '2008-11-09', '2008-11-14', '2008-11-14', 1, 'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas', 1),
(60, '2008-12-22', '2008-12-27', '2008-12-28', 1, 'El cliente comprueba la integridad del paquete, todo correcto', 1),
(61, '2009-01-15', '2009-01-20', NULL, 3, 'El cliente llama para confirmar la fecha - Esperando al proveedor', 2),
(62, '2009-01-20', '2009-01-27', NULL, 3, 'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h', 1),
(63, '2009-01-22', '2009-01-27', NULL, 3, 'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h', 1),
(64, '2009-01-24', '2009-01-31', '2009-01-30', 1, 'Todo correcto', 1),
(65, '2009-02-02', '2009-02-08', NULL, 2, 'El cliente carece de saldo en la cuenta asociada', 1),
(66, '2009-02-06', '2009-02-12', NULL, 2, 'El cliente anula la operacion para adquirir mas producto', 2),
(67, '2009-02-07', '2009-02-13', NULL, 1, 'El pedido aparece como entregado pero no sabemos en que fecha', 2),
(68, '2009-02-10', '2009-02-17', '2009-02-20', 1, 'El cliente se queja bastante de la espera asociada al producto', 2),
(74, '2009-01-14', '2009-01-22', NULL, 2, 'El pedido no llego el dia que queria el cliente por fallo del transporte', 14),
(75, '2009-01-11', '2009-01-13', '2009-01-13', 1, 'El pedido llego perfectamente', 14),
(76, '2008-11-15', '2008-11-23', '2008-11-23', 1, NULL, 14),
(77, '2009-01-03', '2009-01-08', NULL, 3, 'El pedido no pudo ser entregado por problemas meteorologicos', 14),
(78, '2008-12-15', '2008-12-17', '2008-12-17', 1, 'Fue entregado, pero faltaba mercancia que sera entregada otro dia', 14),
(79, '2009-01-12', '2009-01-13', '2009-01-13', 1, NULL, 27),
(80, '2009-01-25', '2009-01-26', NULL, 3, 'No terminó el pago', 27),
(81, '2009-01-18', '2009-01-24', NULL, 2, 'Los producto estaban en mal estado', 27),
(82, '2009-01-20', '2009-01-29', '2009-01-29', 1, 'El pedido llego un poco mas tarde de la hora fijada', 27),
(83, '2009-01-24', '2009-01-28', NULL, 1, NULL, 27),
(89, '2007-10-05', '2007-12-13', '2007-12-10', 1, 'La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho', 33),
(90, '2009-02-07', '2008-02-17', NULL, 3, 'Debido a la nevada caída en la sierra, el pedido no podrá llegar hasta el día ', 26),
(91, '2009-03-18', '2009-03-29', '2009-03-27', 1, 'Todo se entregó a su debido tiempo, incluso con un día de antelación', 26),
(92, '2009-04-19', '2009-04-30', '2009-05-03', 1, 'El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas', 26),
(93, '2009-05-03', '2009-05-30', '2009-05-17', 1, 'El pedido se entregó antes de lo esperado.', 26),
(94, '2009-10-18', '2009-11-01', NULL, 3, 'El pedido está en camino.', 26),
(95, '2008-01-04', '2008-01-19', '2008-01-19', 1, NULL, 33),
(96, '2008-03-20', '2008-04-12', '2008-04-13', 1, 'La entrega se retraso undia', 33),
(97, '2008-10-08', '2008-11-25', '2008-11-25', 1, NULL, 33),
(98, '2009-01-08', '2009-02-13', NULL, 3, NULL, 33),
(99, '2009-02-15', '2009-02-27', NULL, 3, NULL, 15),
(100, '2009-01-10', '2009-01-15', '2009-01-15', 1, 'El pedido llego perfectamente', 15),
(101, '2009-03-07', '2009-03-27', NULL, 2, 'El pedido fue rechazado por el cliente', 15),
(102, '2008-12-28', '2009-01-08', '2009-01-08', 1, 'Pago pendiente', 15),
(103, '2009-01-15', '2009-01-20', '2009-01-24', 3, NULL, 29),
(104, '2009-03-02', '2009-03-06', '2009-03-06', 1, NULL, 29),
(105, '2009-02-14', '2009-02-20', NULL, 2, 'el producto ha sido rechazado por la pesima calidad', 29),
(106, '2009-05-13', '2009-05-15', '2009-05-20', 3, NULL, 29),
(107, '2009-04-06', '2009-04-10', '2009-04-10', 1, NULL, 29),
(108, '2009-04-09', '2009-04-15', '2009-04-15', 1, NULL, 15),
(109, '2006-05-25', '2006-07-28', '2006-07-28', 1, NULL, 36),
(110, '2007-03-19', '2007-04-24', '2007-04-24', 1, NULL, 36),
(111, '2008-03-05', '2008-03-30', '2008-03-30', 1, NULL, 34),
(112, '2009-03-05', '2009-04-06', '2009-05-07', 3, NULL, 34),
(113, '2008-10-28', '2008-11-09', '2009-01-09', 2, 'El producto ha sido rechazado por la tardanza de el envio', 34),
(114, '2009-01-15', '2009-01-29', '2009-01-31', 1, 'El envio llego dos dias más tarde debido al mal tiempo', 34),
(115, '2008-11-29', '2009-01-26', '2009-02-27', 3, NULL, 34),
(116, '2008-06-28', '2008-08-01', '2008-08-01', 1, NULL, 36),
(117, '2008-08-25', '2008-10-01', NULL, 2, 'El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente', 36),
(118, '2009-02-15', '2009-02-27', NULL, 3, NULL, 15),
(119, '2009-01-10', '2009-01-15', '2009-01-15', 1, 'El pedido llego perfectamente', 15),
(120, '2009-03-07', '2009-03-27', NULL, 2, 'El pedido fue rechazado por elcliente', 15),
(121, '2008-12-28', '2009-01-08', '2009-01-08', 1, 'Pago pendiente', 15),
(122, '2009-04-09', '2009-04-15', '2009-04-15', 1, NULL, 15),
(123, '2009-01-15', '2009-01-20', '2009-01-24', 3, NULL, 29),
(124, '2009-03-02', '2009-03-06', '2009-03-06', 1, NULL, 29),
(125, '2009-02-14', '2009-02-20', NULL, 2, 'el producto ha sido rechazado por la pesima calidad', 29),
(126, '2009-05-13', '2009-05-15', '2009-05-20', 3, NULL, 29),
(127, '2009-04-06', '2009-04-10', '2009-04-10', 1, NULL, 29),
(128, '2008-11-10', '2008-12-10', '2008-12-29', 2, 'El pedido ha sido rechazado por el cliente por el retraso en la entrega', 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `Id` int(11) NOT NULL,
  `MethodId` int(11) NOT NULL,
  `TransactionId` varchar(50) DEFAULT NULL,
  `PaymentDate` date NOT NULL,
  `Total` decimal(65,3) NOT NULL,
  `ClienteId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`Id`, `MethodId`, `TransactionId`, `PaymentDate`, `Total`, `ClienteId`) VALUES
(1, 1, 'ak-std-000001', '2008-11-10', '2000.000', 1),
(2, 1, 'ak-std-000002', '2008-12-10', '2000.000', 1),
(3, 1, 'ak-std-000003', '2009-01-16', '5000.000', 2),
(4, 1, 'ak-std-000004', '2009-02-16', '5000.000', 2),
(5, 1, 'ak-std-000005', '2009-02-19', '926.000', 2),
(6, 1, 'ak-std-000006', '2007-01-08', '20000.000', 3),
(7, 1, 'ak-std-000007', '2007-01-08', '20000.000', 3),
(8, 1, 'ak-std-000008', '2007-01-08', '20000.000', 3),
(9, 1, 'ak-std-000009', '2007-01-08', '20000.000', 3),
(10, 1, 'ak-std-000010', '2007-01-08', '1849.000', 3),
(11, 2, 'ak-std-000011', '2006-01-18', '23794.000', 4),
(12, 3, 'ak-std-000012', '2009-01-13', '2390.000', 6),
(13, 1, 'ak-std-000013', '2009-01-06', '929.000', 8),
(14, 1, 'ak-std-000014', '2008-08-04', '2246.000', 12),
(15, 1, 'ak-std-000015', '2008-07-15', '4160.000', 13),
(16, 1, 'ak-std-000016', '2009-01-15', '2081.000', 14),
(17, 1, 'ak-std-000035', '2009-02-15', '10000.000', 16),
(18, 1, 'ak-std-000017', '2009-02-16', '4399.000', 17),
(19, 1, 'ak-std-000018', '2009-03-06', '232.000', 18),
(20, 1, 'ak-std-000019', '2009-03-26', '272.000', 22),
(21, 1, 'ak-std-000020', '2008-03-18', '18846.000', 25),
(22, 1, 'ak-std-000021', '2009-02-08', '10972.000', 26),
(23, 1, 'ak-std-000022', '2009-01-13', '8489.000', 27),
(24, 1, 'ak-std-000024', '2009-01-16', '7863.000', 29),
(25, 1, 'ak-std-000025', '2007-10-06', '3321.000', 33),
(26, 1, 'ak-std-000026', '2006-05-26', '1171.000', 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

CREATE TABLE `persons` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName1` varchar(50) DEFAULT NULL,
  `LastName2` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PersonTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persons`
--

INSERT INTO `persons` (`Id`, `FirstName`, `LastName1`, `LastName2`, `Email`, `PersonTypeId`) VALUES
(1, 'Marcos', 'Magaña', 'Perez', 'marcos@gardening.es', 1),
(2, 'Ruben', 'López', 'Martinez', 'rlopez@gardening.es', 2),
(3, 'Alberto', 'Soria', 'Carrasco', 'asoria@gardening.es', 3),
(4, 'Maria', 'Solís', 'Jerez', 'msolis@gardening.es', 4),
(5, 'Felipe', 'Rosas', 'Marquez', 'frosas@gardening.es', 5),
(6, 'Juan Carlos', 'Ortiz', 'Serrano', 'cortiz@gardening.es', 5),
(7, 'Carlos', 'Soria', 'Jimenez', 'csoria@gardening.es', 6),
(8, 'Mariano', 'López', 'Murcia', 'mlopez@gardening.es', 5),
(9, 'Lucio', 'Campoamor', 'Martín', 'lcampoamor@gardening.es', 5),
(10, 'Hilario', 'Rodriguez', 'Huertas', 'hrodriguez@gardening.es', 5),
(11, 'Emmanuel', 'Magaña', 'Perez', 'manu@gardening.es', 6),
(12, 'José Manuel', 'Martinez', 'De la Osa', 'jmmart@hotmail.es', 5),
(13, 'David', 'Palma', 'Aceituno', 'dpalma@gardening.es', 5),
(14, 'Oscar', 'Palma', 'Aceituno', 'opalma@gardening.es', 5),
(15, 'Francois', 'Fignon', '', 'ffignon@gardening.com', 6),
(16, 'Lionel', 'Narvaez', '', 'lnarvaez@gardening.com', 5),
(17, 'Laurent', 'Serra', '', 'lserra@gardening.com', 5),
(18, 'Michael', 'Bolton', '', 'mbolton@gardening.com', 6),
(19, 'Walter Santiago', 'Sanchez', 'Lopez', 'wssanchez@gardening.com', 5),
(20, 'Hilary', 'Washington', '', 'hwashington@gardening.com', 6),
(21, 'Marcus', 'Paxton', '', 'mpaxton@gardening.com', 5),
(22, 'Lorena', 'Paxton', '', 'lpaxton@gardening.com', 5),
(23, 'Nei', 'Nishikori', '', 'nnishikori@gardening.com', 6),
(24, 'Narumi', 'Riko', '', 'nriko@gardening.com', 5),
(25, 'Takuma', 'Nomura', '', 'tnomura@gardening.com', 5),
(26, 'Amy', 'Johnson', '', 'ajohnson@gardening.com', 6),
(27, 'Larry', 'Westfalls', '', 'lwestfalls@gardening.com', 5),
(28, 'John', 'Walton', '', 'jwalton@gardening.com', 5),
(29, 'Kevin', 'Fallmer', '', 'kfalmer@gardening.com', 6),
(30, 'Julian', 'Bellinelli', '', 'jbellinelli@gardening.com', 5),
(31, 'Mariko', 'Kishi', '', 'mkishi@gardening.com', 5),
(32, 'Daniel G', 'GoldFish', '', 'daniel.g@gardening.com', 7),
(33, 'Anne', 'Wright', '', 'anne.w@gardening.com', 7),
(34, 'Link', 'Flaute', '', 'link.f@gardening.com', 7),
(35, 'Akane', 'Tendo', '', 'akane.t@gardening.com', 7),
(36, 'Antonio', 'Lasas', '', 'antonio.l@gardening.com', 7),
(37, 'Jose', 'Bermejo', '', 'jose.b@gardening.com', 7),
(38, 'Paco', 'Lopez', '', 'paco.l@gardening.com', 7),
(39, 'Naturagua', 'Guillermo', '', 'guillermo.r@gardening.com', 7),
(40, 'David', 'Serrano', '', 'david.s@gardening.com', 7),
(41, 'Jose', 'Tacaño', '', 'jose.t@gardening.com', 7),
(42, 'Antonio', 'Lasas', '', 'antonio.l@gardening.com', 7),
(43, 'Pedro', 'Camunas', '', 'pedro.c@gardening.com', 7),
(44, 'Juan', 'Rodriguez', '', 'juan.r@gardening.com', 7),
(45, 'Javier', 'Villar', '', 'javier.v@gardening.com', 7),
(46, 'Maria', 'Rodriguez', '', 'maria.r@gardening.com', 7),
(47, 'Beatriz', 'Fernandez', '', 'beatriz.f@gardening.com', 7),
(48, 'Victoria', 'Cruz', '', 'victoria.c@gardening.com', 7),
(49, 'Luis', 'Martinez', '', 'luis.m@gardening.com', 7),
(50, 'Mario', 'Suarez', '', 'mario.s@gardening.com', 7),
(51, 'Cristian', 'Rodrigez', '', 'cristian.r@gardening.com', 7),
(52, 'Francisco', 'Camacho', '', 'francisco.c@gardening.com', 7),
(53, 'Maria', 'Santillana', '', 'maria.s@gardening.com', 7),
(54, 'Federico', 'Gomez', '', 'federico.g@gardening.com', 7),
(55, 'Tony', 'Muñoz Mena', '', 'tony.m@gardening.com', 7),
(56, 'Eva María', 'Sánchez', '', 'eva.s@gardening.com', 7),
(57, 'Matías', 'San Martín', '', 'matias.s@gardening.com', 7),
(58, 'Benito', 'Lopez', '', 'benito.l@gardening.com', 7),
(59, 'Joseluis', 'Sanchez', '', 'joseluis.s@gardening.com', 7),
(60, 'Sara', 'Marquez', '', 'sara.m@gardening.com', 7),
(61, 'Luis', 'Jimenez', '', 'luis.j@gardening.com', 7),
(62, 'FraÃ§ois', 'Toulou', '', 'francois.t@gardening.com', 7),
(63, 'Pierre', 'Delacroux', '', 'pierre.d@gardening.com', 7),
(64, 'Jacob', 'Jones', '', 'jacob.j@gardening.com', 7),
(65, 'Antonio', 'Romero', '', 'antonio.r@gardening.com', 7),
(66, 'Richard', 'Mcain', '', 'richard.m@gardening.com', 7),
(67, 'Justin', 'Smith', '', 'justin.s@gardening.com', 7),
(68, 'Jose', 'Martinez', 'Toledo', 'JoseMT@gardening.es', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persontypes`
--

CREATE TABLE `persontypes` (
  `Id` int(11) NOT NULL,
  `TypeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persontypes`
--

INSERT INTO `persontypes` (`Id`, `TypeName`) VALUES
(1, 'Director General'),
(2, 'Subdirector Marketing'),
(3, 'Subdirector Ventas'),
(4, 'Secretaria'),
(5, 'Representante Ventas'),
(6, 'Director Oficina'),
(7, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postalcodes`
--

CREATE TABLE `postalcodes` (
  `Id` int(11) NOT NULL,
  `PostalCode1` varchar(50) NOT NULL,
  `CityId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `postalcodes`
--

INSERT INTO `postalcodes` (`Id`, `PostalCode1`, `CityId`) VALUES
(1, '24006', 1),
(2, '24010', 2),
(3, '85495', 3),
(4, '696969', 2),
(5, '28945', 4),
(6, '28942', 5),
(7, '28930', 5),
(8, '28947', 5),
(9, '28946', 5),
(10, '28943', 5),
(11, '28145', 6),
(12, '28003', 5),
(13, '28950', 5),
(14, '24586', 7),
(15, '28011', 5),
(16, '38297', 8),
(17, '12320', 9),
(18, '35488', 10),
(19, '11310', 11),
(20, '28970', 12),
(21, '28574', 4),
(22, '29874', 5),
(23, '37845', 5),
(24, '28904', 13),
(25, '28574', 12),
(26, '08019', 9),
(27, '02108', 14),
(28, 'EC2N1HN', 15),
(29, '28032', 5),
(30, '75017', 16),
(31, '94080', 1),
(32, 'NSW 2010', 17),
(33, '45632', 18),
(34, '102-8578', 19),
(35, '75010', 16),
(36, '75058', 16),
(37, '2000', 17),
(38, '29643', 5),
(39, '65930', 15),
(40, '2003', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productlines`
--

CREATE TABLE `productlines` (
  `Id` int(11) NOT NULL,
  `ProductLine1` varchar(50) DEFAULT NULL,
  `DescriptionText` varchar(50) DEFAULT NULL,
  `DescriptionHtml` varchar(50) DEFAULT NULL,
  `Image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productlines`
--

INSERT INTO `productlines` (`Id`, `ProductLine1`, `DescriptionText`, `DescriptionHtml`, `Image`) VALUES
(1, 'Herbaceas', 'Plantas para jardin decorativas', NULL, 'img1.png'),
(2, 'Herramientas', 'Herramientas para todo tipo de acción', NULL, 'img2.png'),
(3, 'Aromáticas', 'Plantas aromáticas', NULL, 'img3.png'),
(4, 'Frutales', 'Árboles pequeños de producción frutal', NULL, 'img4.png'),
(5, 'Ornamentales', 'Plantas vistosas para la decoración del jardín', NULL, 'img6.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `Id` varchar(255) NOT NULL,
  `Name` longtext NOT NULL,
  `ProductLine` int(11) NOT NULL,
  `Dimensions` longtext DEFAULT NULL,
  `IdSupplier` int(11) NOT NULL,
  `Description` longtext DEFAULT NULL,
  `StockQuantity` smallint(6) NOT NULL,
  `SellingPrice` decimal(65,30) NOT NULL,
  `SupplierPrice` decimal(65,30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`Id`, `Name`, `ProductLine`, `Dimensions`, `IdSupplier`, `Description`, `StockQuantity`, `SellingPrice`, `SupplierPrice`) VALUES
('11679', 'Sierra de Poda 400MM', 2, '0,258', 1, 'Gracias a la poda se consigue\r\nmanipular un poco la naturaleza, dándole la forma que más nos guste. Este trabajo básico de jardinería\r\ntambién facilita que las plantas crezcan de un modo más equilibrado, y que las flores y los frutos vuelvan\r\ncada año con regularidad. Lo mejor es dar forma cuando los ejemplares son jóvenes, de modo que\r\nexijan pocos cuidados cuando sean adultos. Además de saber cuándo y cómo hay que podar, tener unas\r\nherramientas adecuadas para esta labor es también de vital importancia.', 15, '14.000000000000000000000000000000', '11.000000000000000000000000000000'),
('21636', 'Pala', 2, '0,156', 1, 'Palas de acero con cresta de corte en la punta\r\npara cortar bien el terreno. Buena penetración en tierras muy compactas.', 15, '14.000000000000000000000000000000', '13.000000000000000000000000000000'),
('22225', 'Rastrillo de Jardín', 2, '1,064', 1, 'Fabuloso rastillo que le ayudará a\r\neliminar piedras, hojas, ramas y otros elementos incómodos en su jardín.', 15, '12.000000000000000000000000000000', '11.000000000000000000000000000000'),
('30310', 'Azadón', 2, '0,168', 1, 'Longitud:24cm. Herramienta fabricada en\r\nacero y pintura epoxi,alargando su durabilidad y preveniendo la corrosión.Diseño pensado para el\r\nahorro de trabajo.', 15, '12.000000000000000000000000000000', '11.000000000000000000000000000000'),
('AR-001', 'Ajedrea', 3, '15-20', 2, 'Planta aromática que fresca se utiliza para\r\ncondimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-002', 'Lavándula Dentata', 3, '15-20', 2, 'Espliego de jardín, Alhucema\r\nrizada, Alhucema dentada, Cantueso rizado. Familia: Lamiaceae.Origen: España y Portugal. Mata de\r\nunos 60 cm de alto. Las hojas son aromáticas, dentadas y de color verde grisáceas. Produce compactas\r\nespigas de flores pequeñas, ligeramente aromáticas, tubulares,de color azulado y con brácteas\r\npúrpuras. Frutos: nuececillas alargadas encerradas en el tubo del cáliz. Se utiliza en jardineria y no\r\nen perfumeria como otros cantuesos, espliegos y lavandas. Tiene propiedades aromatizantes y\r\ncalmantes. Adecuadas para la formación de setos bajos. Se dice que su aroma ahuyenta pulgones y\r\notros insectos perjudiciales para las plantas vecinas.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-003', 'Mejorana', 3, '15-20', 2, 'Origanum majorana. No hay que\r\nconfundirlo con el orégano. Su sabor se parece más al tomillo, pero es más dulce y aromático.Se usan las\r\nhojas frescas o secas, picadas, machacadas o en polvo, en sopas, rellenos, quiches y tartas, tortillas,\r\nplatos con papas y, como aderezo, en ramilletes de hierbas.El sabor delicado de la mejorana se elimina\r\ndurante la cocción, de manera que es mejor agregarla cuando el plato esté en su punto o en aquéllos\r\nque apenas necesitan cocción.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-004', 'Melissa ', 3, '15-20', 2, 'Es una planta perenne (dura varios años)\r\nconocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en\r\nla huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa,\r\ncondimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego\r\nsin exceso. A pleno sol o por lo menos 5 horas de sol por día. Cada año, su abonado mineral\r\ncorrespondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus\r\nflores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma\r\ndensa en primavera.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-005', 'Mentha Sativa', 3, '15-20', 2, '¿Quién no conoce la Hierbabuena?\r\nSe trata de una plantita muy aromática, agradable y cultivada extensamente por toda España. Es hierba\r\nperenne (por tanto vive varios años, no es anual). Puedes cultivarla en maceta o plantarla en la tierra del\r\njardín o en un rincón del huerto. Lo más importante es que cuente con bastante agua. En primavera\r\ndebes aportar fertilizantes minerales. Vive mejor en semisombra que a pleno sol.Si ves orugas o los\r\nagujeros en hojas consecuencia de su ataque, retíralas una a una a mano; no uses insecticidas\r\nquímicos.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-006', 'Petrosilium Hortense (Peregil)', 3, '15-20', 2, 'Nombre científico o\r\nlatino: Petroselinum hortense, Petroselinum crispum. Nombre común o vulgar: Perejil, Perejil rizado\r\nFamilia: Umbelliferae (Umbelíferas). Origen: el origen del perejil se encuentra en el Mediterraneo. Esta\r\nnaturalizada en casi toda Europa. Se utiliza como condimento y para adorno, pero también en\r\nensaladas. Se suele regalar en las fruterías y verdulerías.El perejil lo hay de 2 tipos: de hojas planas y de\r\nhojas rizadas.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-007', 'Salvia Mix', 3, '15-20', 2, 'La Salvia es un pequeño arbusto que\r\nllega hasta el metro de alto.Tiene una vida breve, de unos pocos años.En el jardín, como otras\r\naromáticas, queda muy bien en una rocalla o para hacer una bordura perfumada a cada lado de un\r\ncamino de Salvia. Abona después de cada corte y recorta el arbusto una vez pase la floración.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-008', 'Thymus Citriodra (Tomillo limón)', 3, '15-20', 2, 'Nombre común o\r\nvulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de\r\n15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden\r\nser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta\r\nbien entrada la época estival y se presentan en racimos terminales que habitualmente son de color\r\nvioleta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma,\r\nque se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a\r\navispas y abejas. En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente,\r\nllenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y\r\nañadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada.También puede usar las\r\nramas secas con flores para añadir aroma y textura a cestos abiertos.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-009', 'Thymus Vulgaris', 3, '15-20', 2, 'Nombre común o vulgar: Tomillo,\r\nTremoncillo Familia: Labiatae (Labiadas). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de\r\naltura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes,\r\nverdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien\r\nentrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o\r\npúrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se\r\nincrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y\r\nabejas.\r\n En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar\r\nhuecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y\r\nañadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada. También puede usar las\r\nramas secas con flores para añadir aroma y textura a cestos abiertos.', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('AR-010', 'Santolina Chamaecyparys', 3, '15-20', 2, '', 140, '1.000000000000000000000000000000', '0.000000000000000000000000000000'),
('FR-1', 'Expositor Cítricos Mix', 4, '100-120', 3, '', 15, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('FR-10', 'Limonero 2 años injerto', 4, '', 4, 'El limonero, pertenece al grupo de\r\nlos cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por\r\nlos árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas\r\nmodificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las\r\nproducidas por el hombre, en este caso buscando las necesidades del mercado.', 15, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('FR-100', 'Nectarina', 4, '8/10', 3, 'Se trata de un árbol derivado por mutación\r\nde los melocotoneros comunes, y los únicos caracteres diferenciales son la ausencia de tomentosidad en\r\nla piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones\r\nmedias de 4-6 metros', 50, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-101', 'Nogal', 4, '8/10', 3, '', 50, '13.000000000000000000000000000000', '10.000000000000000000000000000000'),
('FR-102', 'Olea-Olivos', 4, '8/10', 3, 'Existen dos hipótesis sobre el origen del\r\nolivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo\r\nconsidera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los\r\nFenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los\r\nprimeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el\r\ndominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía,\r\nconvirtiendo a España en el primer país productr de aceite de oliva a nivel mundial.', 50, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('FR-103', 'Olea-Olivos', 4, '10/12', 3, 'Existen dos hipótesis sobre el origen del\r\nolivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo\r\nconsidera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los\r\nFenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los\r\nprimeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el\r\ndominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía,\r\nconvirtiendo a España en el primer país productr de aceite de oliva a nivel mundial.', 50, '25.000000000000000000000000000000', '20.000000000000000000000000000000'),
('FR-104', 'Olea-Olivos', 4, '12/4', 3, 'Existen dos hipótesis sobre el origen del\r\nolivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo\r\nconsidera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los\r\nFenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los\r\nprimeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el\r\ndominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía,\r\nconvirtiendo a España en el primer país productr de aceite de oliva a nivel mundial.', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('FR-105', 'Olea-Olivos', 4, '14/16', 3, 'Existen dos hipótesis sobre el origen del\r\nolivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo\r\nconsidera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los\r\nFenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los\r\nprimeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el\r\ndominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía,\r\nconvirtiendo a España en el primer país productr de aceite de oliva a nivel mundial.', 50, '70.000000000000000000000000000000', '56.000000000000000000000000000000'),
('FR-106', 'Peral', 4, '8/10', 3, 'Árbol piramidal, redondeado en su juventud,\r\nluego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de\r\ncorteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan\r\nformando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con\r\nnumerosas lenticelas.', 50, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-107', 'Peral', 4, '10/12', 3, 'Árbol piramidal, redondeado en su juventud,\r\nluego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de\r\ncorteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan\r\nformando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con\r\nnumerosas lenticelas.', 50, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-108', 'Peral', 4, '12/14', 3, 'Árbol piramidal, redondeado en su juventud,\r\nluego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de\r\ncorteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan\r\nformando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con\r\nnumerosas lenticelas.', 50, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-11', 'Limonero 30/40', 4, '', 4, 'El limonero, pertenece al grupo de los\r\ncítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los\r\nárabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas\r\nmodificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las\r\nproducidas por el', 15, '100.000000000000000000000000000000', '80.000000000000000000000000000000'),
('FR-12', 'Kunquat ', 4, '', 4, 'su nombre científico se origina en honor a un\r\nhoticultor escocés que recolectó especímenes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y\r\n\"margarita\", del latín margaritus-a-um = perla, en alusión a sus pequeños y brillantes frutos. Se trata\r\nde un arbusto o árbol pequeño de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de\r\n4-8 (-15) cm de longitud, con el ápice redondeado y la base cuneada.Tienen el margen crenulado en su\r\nmitad superior, el haz verde brillante y el envés más pálido.Pecíolo ligeramente marginado.Flores\r\nperfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo más característico,\r\nes el más pequeño de todos los cítricos y el único cuya cáscara se puede comer.Frutos pequeños, con\r\nsemillas, de corteza fina, dulce, aromática y comestible, y de pulpa naranja amarillenta y ligeramente\r\nácida.Sus frutos son muy pequeños y tienen un carácter principalmente ornamental.', 15, '21.000000000000000000000000000000', '16.000000000000000000000000000000'),
('FR-13', 'Kunquat EXTRA con FRUTA', 4, '150-170', 4, 'su nombre científico\r\nse origina en honor a un hoticultor escocés que recolectó especímenes en China, (\"Fortunella\"),\r\nRobert Fortune (1812-1880), y \"margarita\", del latín margaritus-a-um = perla, en alusión a sus\r\npequeños y brillantes frutos. Se trata de un arbusto o árbol pequeño de 2-3 m de altura, inerme o con\r\nescasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el ápice redondeado y la base\r\ncuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el envés más\r\npálido.Pecíolo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias\r\naxilares, blancas.El fruto es lo más característico, es el más pequeño de todos los cítricos y el único cuya\r\ncáscara se puede comer.Frutos pequeños, con semillas, de corteza fina, dulce, aromática y comestible, y\r\nde pulpa naranja amarillenta y ligeramente ácida.Sus frutos son muy pequeños y tienen un carácter\r\nprincipalmente ornamental.', 15, '57.000000000000000000000000000000', '45.000000000000000000000000000000'),
('FR-14', 'Calamondin Mini', 4, '', 3, 'Se trata de un pequeño arbolito de copa\r\ndensa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de\r\n5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final\r\nde las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u\r\novales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de\r\nla pulpa, que es dulce, ácida y comestible..', 15, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-15', 'Calamondin Copa ', 4, '', 3, 'Se trata de un pequeño arbolito de copa\r\ndensa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de\r\n5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final\r\nde las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u\r\novales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de\r\nla pulpa, que es dulce, ácida y comestible..', 15, '25.000000000000000000000000000000', '20.000000000000000000000000000000'),
('FR-16', 'Calamondin Copa EXTRA Con FRUTA', 4, '100-120', 3, 'Se trata de un\r\npequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas\r\nson pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2\r\nflores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro),\r\ncon pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy\r\nfina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..', 15, '45.000000000000000000000000000000', '36.000000000000000000000000000000'),
('FR-17', 'Rosal bajo 1Âª -En maceta-inicio brotación', 4, '', 3, '', 15, '2.000000000000000000000000000000', '1.000000000000000000000000000000'),
('FR-18', 'ROSAL TREPADOR', 4, '', 3, '', 350, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('FR-19', 'Camelia Blanco, Chrysler Rojo, Soraya Naranja, ', 4, '', 4, '', 350, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('FR-2', 'Naranjo -Plantón joven 1 año injerto', 4, '', 4, 'El naranjo es un árbol\r\npequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en\r\nesérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un\r\nverde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo,\r\nun típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos\r\npatente.', 15, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('FR-20', 'Landora Amarillo, Rose Gaujard bicolor\r\nblanco-rojo', 4, '', 3, '', 350, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('FR-21', 'Kordes Perfect bicolor rojo-amarillo, Roundelay rojo\r\nfuerte', 4, '', 3, '', 350, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('FR-22', 'Pitimini rojo', 4, '', 3, '', 350, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('FR-23', 'Rosal copa ', 4, '', 3, '', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-24', 'Albaricoquero Corbato', 4, '', 5, 'árbol que puede pasar de los 6 m\r\nde altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco\r\nes pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias\r\nson cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-25', 'Albaricoquero Moniqui', 4, '', 5, 'árbol que puede pasar de los 6 m\r\nde altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco\r\nes pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias\r\nson cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-26', 'Albaricoquero Kurrot', 4, '', 5, 'árbol que puede pasar de los 6 m de\r\naltura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es\r\npardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son\r\ncortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-27', 'Cerezo Burlat', 4, '', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-28', 'Cerezo Picota', 4, '', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-29', 'Cerezo Napoleón', 4, '', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-3', 'Naranjo 2 años injerto', 4, '', 4, 'El naranjo es un árbol pequeño, que\r\nno supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la\r\npoda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y\r\nbrillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo\r\nalado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.', 15, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('FR-30', 'Ciruelo R. Claudia Verde ', 4, '', 3, 'árbol de tamaño mediano que\r\nalcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada\r\nlongitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras\r\npubescentes y vellosas', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-31', 'Ciruelo Santa Rosa', 4, '', 3, 'árbol de tamaño mediano que alcanza\r\nuna altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada\r\nlongitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras\r\npubescentes y vellosas', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-32', 'Ciruelo Golden Japan', 4, '', 3, 'árbol de tamaño mediano que\r\nalcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada\r\nlongitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras\r\npubescentes y vellosas', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-33', 'Ciruelo Friar', 4, '', 3, 'árbol de tamaño mediano que alcanza una\r\naltura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente.\r\nProduce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y\r\nvellosas', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-34', 'Ciruelo Reina C. De Ollins', 4, '', 3, 'árbol de tamaño mediano que\r\nalcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada\r\nlongitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras\r\npubescentes y vellosas', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-35', 'Ciruelo Claudia Negra', 4, '', 3, 'árbol de tamaño mediano que\r\nalcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada\r\nlongitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras\r\npubescentes y vellosas', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-36', 'Granado Mollar de Elche', 4, '', 3, 'pequeño árbol caducifolio, a\r\nveces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza\r\nescamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de\r\ncuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las\r\nramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una\r\nespina aguda; la copa es extendida.', 400, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('FR-37', 'Higuera Napolitana', 4, '', 3, 'La higuera (Ficus carica L.) es un árbol\r\ntípico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera\r\nun frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 400, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('FR-38', 'Higuera Verdal', 4, '', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 400, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('FR-39', 'Higuera Breva', 4, '', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 400, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('FR-4', 'Naranjo calibre 8/10', 4, '', 4, 'El naranjo es un árbol pequeño, que no\r\nsupera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la\r\npoda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y\r\nbrillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo\r\nalado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.', 15, '29.000000000000000000000000000000', '23.000000000000000000000000000000'),
('FR-40', 'Manzano Starking Delicious', 4, '', 3, 'alcanza como máximo 10 m.\r\nde altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura,\r\ncon corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y\r\nescamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se\r\ninsertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o\r\nvioláceo. Los brotes jóvenes terminan con frecuencia en una espina', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-41', 'Manzano Reineta', 4, '', 3, 'alcanza como máximo 10 m. de altura y\r\ntiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza\r\ncubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris\r\nparda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en\r\nángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes\r\njóvenes terminan con frecuencia en una espina', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-42', 'Manzano Golden Delicious', 4, '', 3, 'alcanza como máximo 10 m. de\r\naltura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con\r\ncorteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y\r\ngris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en\r\nángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes\r\njóvenes terminan con frecuencia en una espina', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-43', 'Membrillero Gigante de Wranja', 4, '', 3, '', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-44', 'Melocotonero Spring Crest', 4, '', 5, 'Árbol caducifolio de porte bajo\r\ncon corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de\r\ncolor verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura\r\nasiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un\r\nenorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-45', 'Melocotonero Amarillo de Agosto', 4, '', 5, 'Árbol caducifolio de\r\nporte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente\r\naserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en\r\nla cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior\r\nde un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-46', 'Melocotonero Federica', 4, '', 5, 'Árbol caducifolio de porte bajo con\r\ncorteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color\r\nverde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura\r\nasiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un\r\nenorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-47', 'Melocotonero Paraguayo', 4, '', 5, 'Árbol caducifolio de porte bajo\r\ncon corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de\r\ncolor verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura\r\nasiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un\r\nenorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-48', 'Nogal Común', 4, '', 3, '', 400, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('FR-49', 'Parra Uva de Mesa', 4, '', 3, '', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-5', 'Mandarino -Plantón joven', 4, '', 3, '', 15, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('FR-50', 'Peral Castell', 4, '', 3, 'Árbol piramidal, redondeado en su juventud,\r\nluego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de\r\ncorteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan\r\nformando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con\r\nnumerosas lenticelas.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-51', 'Peral Williams', 4, '', 3, 'Árbol piramidal, redondeado en su\r\njuventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto,\r\ngrueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se\r\ninsertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea,\r\ncon numerosas lenticelas.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-52', 'Peral Conference', 4, '', 3, 'Árbol piramidal, redondeado en su\r\njuventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto,\r\ngrueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se\r\ninsertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea,\r\ncon numerosas lenticelas.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-53', 'Peral Blanq. de Aranjuez', 4, '', 3, 'Árbol piramidal, redondeado en\r\nsu juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco\r\nalto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las\r\nramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego\r\ngris-violácea, con numerosas lenticelas.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-54', 'Níspero Tanaca', 4, '', 3, 'Aunque originario del Sudeste de China, el\r\nníspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se\r\ninició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de\r\ncultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de\r\nlos 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente\r\nutilizadas.', 400, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('FR-55', 'Olivo Cipresino', 4, '', 3, 'Existen dos hipótesis sobre el origen del\r\nolivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo\r\nconsidera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los\r\nFenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los\r\nprimeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el\r\ndominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía,\r\nconvirtiendo a España en el primer país productr de aceite de oliva a nivel mundial.', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-56', 'Nectarina', 4, '', 3, '', 400, '8.000000000000000000000000000000', '6.000000000000000000000000000000'),
('FR-57', 'Kaki Rojo Brillante', 4, '', 4, 'De crecimiento algo lento los primeros\r\naños, llega a alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo\r\n(5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o\r\nmenos piramidal, aunque con la edad se hace más globoso.', 400, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('FR-58', 'Albaricoquero', 4, '8/10', 5, 'árbol que puede pasar de los 6 m de\r\naltura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es\r\npardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son\r\ncortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 200, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-59', 'Albaricoquero', 4, '10/12', 5, 'árbol que puede pasar de los 6 m de\r\naltura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es\r\npardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son\r\ncortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 200, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-6', 'Mandarino 2 años injerto', 4, '', 3, '', 15, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('FR-60', 'Albaricoquero', 4, '12/14', 5, 'árbol que puede pasar de los 6 m de\r\naltura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es\r\npardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son\r\ncortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 200, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-61', 'Albaricoquero', 4, '14/16', 5, 'árbol que puede pasar de los 6 m de\r\naltura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es\r\npardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son\r\ncortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 200, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('FR-62', 'Albaricoquero', 4, '16/18', 5, 'árbol que puede pasar de los 6 m de\r\naltura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es\r\npardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son\r\ncortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas\r\nviejas.', 200, '70.000000000000000000000000000000', '56.000000000000000000000000000000'),
('FR-63', 'Cerezo', 4, '8/10', 7, 'Las principales especies\r\nde cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo\r\n\"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia.\r\nEl cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose\r\ndespués hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales\r\nmás apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la\r\nactualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima\r\ntemplado', 300, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-64', 'Cerezo', 4, '10/12', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 15, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-65', 'Cerezo', 4, '12/14', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 200, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-66', 'Cerezo', 4, '14/16', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('FR-67', 'Cerezo', 4, '16/18', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 50, '70.000000000000000000000000000000', '56.000000000000000000000000000000'),
('FR-68', 'Cerezo', 4, '18/20', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 50, '80.000000000000000000000000000000', '64.000000000000000000000000000000'),
('FR-69', 'Cerezo', 4, '20/25', 7, 'Las principales\r\nespecies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el\r\ncerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste\r\nde Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio,\r\ndifundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno\r\nde los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy\r\ndiversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo\r\ncon clima templado', 50, '91.000000000000000000000000000000', '72.000000000000000000000000000000'),
('FR-7', 'Mandarino calibre 8/10', 4, '', 3, '', 15, '29.000000000000000000000000000000', '23.000000000000000000000000000000'),
('FR-70', 'Ciruelo', 4, '8/10', 3, 'árbol de tamaño mediano que alcanza una\r\naltura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente.\r\nProduce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y\r\nvellosas', 50, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-71', 'Ciruelo', 4, '10/12', 3, 'árbol de tamaño mediano que alcanza una\r\naltura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente.\r\nProduce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y\r\nvellosas', 50, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-72', 'Ciruelo', 4, '12/14', 3, 'árbol de tamaño mediano que alcanza una\r\naltura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente.\r\nProduce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y\r\nvellosas', 50, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-73', 'Granado', 4, '8/10', 3, 'pequeño árbol caducifolio, a veces con porte\r\narbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color\r\ngrisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas,\r\nposteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero\r\nespecialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la\r\ncopa es extendida.', 50, '13.000000000000000000000000000000', '10.000000000000000000000000000000'),
('FR-74', 'Granado', 4, '10/12', 3, 'pequeño árbol caducifolio, a veces con\r\nporte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color\r\ngrisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas,\r\nposteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero\r\nespecialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la\r\ncopa es extendida.', 50, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-75', 'Granado', 4, '12/14', 3, 'pequeño árbol caducifolio, a veces con\r\nporte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color\r\ngrisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas,\r\nposteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero\r\nespecialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la\r\ncopa es extendida.', 50, '32.000000000000000000000000000000', '25.000000000000000000000000000000');
INSERT INTO `products` (`Id`, `Name`, `ProductLine`, `Dimensions`, `IdSupplier`, `Description`, `StockQuantity`, `SellingPrice`, `SupplierPrice`) VALUES
('FR-76', 'Granado', 4, '14/16', 3, 'pequeño árbol caducifolio, a veces con\r\nporte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color\r\ngrisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas,\r\nposteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero\r\nespecialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la\r\ncopa es extendida.', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('FR-77', 'Granado', 4, '16/18', 3, 'pequeño árbol caducifolio, a veces con\r\nporte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color\r\ngrisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas,\r\nposteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero\r\nespecialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la\r\ncopa es extendida.', 50, '70.000000000000000000000000000000', '56.000000000000000000000000000000'),
('FR-78', 'Higuera', 4, '8/10', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 50, '15.000000000000000000000000000000', '12.000000000000000000000000000000'),
('FR-79', 'Higuera', 4, '10/12', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 50, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-8', 'Limonero -Plantón joven', 4, '', 4, 'El limonero, pertenece al grupo de\r\nlos cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por\r\nlos árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas\r\nmodificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las\r\nproducidas por el', 15, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('FR-80', 'Higuera', 4, '12/14', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 50, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-81', 'Higuera', 4, '14/16', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('FR-82', 'Higuera', 4, '16/18', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 50, '70.000000000000000000000000000000', '56.000000000000000000000000000000'),
('FR-83', 'Higuera', 4, '18/20', 3, 'La higuera (Ficus carica L.) es un árbol típico\r\nde secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un\r\nfrutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no\r\nrequiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos\r\ncuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados\r\nculturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera\r\ncosecha, la de brevas.', 50, '80.000000000000000000000000000000', '64.000000000000000000000000000000'),
('FR-84', 'Kaki', 4, '8/10', 4, 'De crecimiento algo lento los primeros años, llega\r\na alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco\r\ncorto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal,\r\naunque con la edad se hace más globoso.', 50, '13.000000000000000000000000000000', '10.000000000000000000000000000000'),
('FR-85', 'Kaki', 4, '16/18', 4, 'De crecimiento algo lento los primeros años,\r\nllega a alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6).\r\nTronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos\r\npiramidal, aunque con la edad se hace más globoso.', 50, '70.000000000000000000000000000000', '56.000000000000000000000000000000'),
('FR-86', 'Manzano', 4, '8/10', 3, 'alcanza como máximo 10 m. de altura y\r\ntiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza\r\ncubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris\r\nparda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en\r\nángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes\r\njóvenes terminan con frecuencia en una espina', 50, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-87', 'Manzano', 4, '10/12', 3, 'alcanza como máximo 10 m. de altura y\r\ntiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza\r\ncubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris\r\nparda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en\r\nángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes\r\njóvenes terminan con frecuencia en una espina', 50, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-88', 'Manzano', 4, '12/14', 3, 'alcanza como máximo 10 m. de altura y\r\ntiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza\r\ncubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris\r\nparda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en\r\nángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes\r\njóvenes terminan con frecuencia en una espina', 50, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-89', 'Manzano', 4, '14/16', 3, 'alcanza como máximo 10 m. de altura y\r\ntiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza\r\ncubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris\r\nparda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en\r\nángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes\r\njóvenes terminan con frecuencia en una espina', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('FR-9', 'Limonero calibre 8/10', 4, '', 4, 'El limonero, pertenece al grupo de los\r\ncítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los\r\nárabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas\r\nmodificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las\r\nproducidas por el', 15, '29.000000000000000000000000000000', '23.000000000000000000000000000000'),
('FR-90', 'Níspero', 4, '16/18', 3, 'Aunque originario del Sudeste de China, el\r\nníspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se\r\ninició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de\r\ncultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de\r\nlos 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente\r\nutilizadas.', 50, '70.000000000000000000000000000000', '56.000000000000000000000000000000'),
('FR-91', 'Níspero', 4, '18/20', 3, 'Aunque originario del Sudeste de China, el\r\nníspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se\r\ninició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de\r\ncultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de\r\nlos 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente\r\nutilizadas.', 50, '80.000000000000000000000000000000', '64.000000000000000000000000000000'),
('FR-92', 'Melocotonero', 4, '8/10', 5, 'Árbol caducifolio de porte bajo con\r\ncorteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color\r\nverde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura\r\nasiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un\r\nenorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-93', 'Melocotonero', 4, '10/12', 5, 'Árbol caducifolio de porte bajo con\r\ncorteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color\r\nverde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura\r\nasiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un\r\nenorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-94', 'Melocotonero', 4, '12/14', 5, 'Árbol caducifolio de porte bajo con\r\ncorteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color\r\nverde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura\r\nasiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un\r\nenorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-95', 'Melocotonero', 4, '14/16', 5, 'Árbol caducifolio de porte bajo con\r\ncorteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color\r\nverde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura\r\nasiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un\r\nenorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere\r\nlongevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('FR-96', 'Membrillero', 4, '8/10', 3, 'arbolito caducifolio de 4-6 m de altura\r\ncon el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa\r\nirregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('FR-97', 'Membrillero', 4, '10/12', 3, 'arbolito caducifolio de 4-6 m de altura\r\ncon el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa\r\nirregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('FR-98', 'Membrillero', 4, '12/14', 3, 'arbolito caducifolio de 4-6 m de altura\r\ncon el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa\r\nirregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('FR-99', 'Membrillero', 4, '14/16', 3, 'arbolito caducifolio de 4-6 m de altura\r\ncon el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa\r\nirregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('OR-001', 'Arbustos Mix Maceta', 5, '40-60', 8, '', 25, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-100', 'Mimosa Injerto CLASICA Dealbata ', 5, '100-110', 6, 'Acacia\r\ndealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo\r\nfrancés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje\r\npersistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de\r\n3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental.\r\nSus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes.\r\nFlorece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente\r\ncurvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '12.000000000000000000000000000000', '9.000000000000000000000000000000'),
('OR-101', 'Expositor Mimosa Semilla Mix', 5, '170-200', 6, 'Acacia dealbata.\r\nNombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés.\r\nFamilia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente\r\nmuy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10\r\nmetros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus\r\nhojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece\r\nde Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con\r\nlos bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-102', 'Mimosa Semilla Bayleyana ', 5, '170-200', 6, 'Acacia dealbata.\r\nNombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés.\r\nFamilia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente\r\nmuy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10\r\nmetros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus\r\nhojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece\r\nde Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con\r\nlos bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-103', 'Mimosa Semilla Bayleyana ', 5, '200-225', 6, 'Acacia dealbata.\r\nNombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés.\r\nFamilia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente\r\nmuy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10\r\nmetros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus\r\nhojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece\r\nde Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con\r\nlos bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-104', 'Mimosa Semilla Cyanophylla ', 5, '200-225', 6, 'Acacia\r\ndealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo\r\nfrancés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje\r\npersistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de\r\n3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental.\r\nSus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes.\r\nFlorece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente\r\ncurvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-105', 'Mimosa Semilla Espectabilis ', 5, '160-170', 6, 'Acacia dealbata.\r\nNombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés.\r\nFamilia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente\r\nmuy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10\r\nmetros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus\r\nhojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece\r\nde Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con\r\nlos bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-106', 'Mimosa Semilla Longifolia ', 5, '200-225', 6, 'Acacia dealbata.\r\nNombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés.\r\nFamilia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente\r\nmuy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10\r\nmetros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus\r\nhojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece\r\nde Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con\r\nlos bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-107', 'Mimosa Semilla Floribunda 4 estaciones', 5, '120-140', 6, 'Acacia\r\ndealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo\r\nfrancés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje\r\npersistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de\r\n3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental.\r\nSus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes.\r\nFlorece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente\r\ncurvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-108', 'Abelia Floribunda', 5, '35-45', 6, '', 100, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-109', 'Callistemom (Mix)', 5, '35-45', 6, 'Limpitatubos. arbolito de 6-7 m\r\nde altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..', 100, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-110', 'Callistemom (Mix)', 5, '40-60', 6, 'Limpitatubos. arbolito de 6-7 m\r\nde altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..', 100, '2.000000000000000000000000000000', '1.000000000000000000000000000000'),
('OR-111', 'Corylus Avellana \"Contorta\"', 5, '35-45', 6, '', 100, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-112', 'Escallonia (Mix)', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-113', 'Evonimus Emerald Gayeti', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-114', 'Evonimus Pulchellus', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-115', 'Forsytia Intermedia \"Lynwood\"', 5, '35-45', 6, '', 120, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-116', 'Hibiscus Syriacus \"Diana\" -Blanco Puro', 5, '35-45', 6, 'Por su\r\ncapacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos\r\naños. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al\r\nanaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga\r\ndurante todo el periodo de crecimiento vegetativo.', 120, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-117', 'Hibiscus Syriacus \"Helene\" -Blanco-C.rojo', 5, '35-45', 6, 'Por\r\nsu capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de\r\npocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del\r\namarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se\r\nprolonga durante todo el periodo de crecimiento vegetativo.', 120, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-118', 'Hibiscus Syriacus \"Pink Giant\" Rosa', 5, '35-45', 6, 'Por su\r\ncapacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos\r\naños. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al\r\nanaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga\r\ndurante todo el periodo de crecimiento vegetativo.', 120, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-119', 'Laurus Nobilis Arbusto - Ramificado Bajo', 5, '40-50', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-120', 'Lonicera Nitida ', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-121', 'Lonicera Nitida \"Maigrum\"', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-122', 'Lonicera Pileata', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-123', 'Philadelphus \"Virginal\"', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-124', 'Prunus pisardii ', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-125', 'Viburnum Tinus \"Eve Price\"', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-126', 'Weigelia \"Bristol Ruby\"', 5, '35-45', 6, '', 120, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-127', 'Camelia japonica', 5, '40-60', 6, 'Arbusto excepcional por su\r\nfloración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de cada\r\nrama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm\r\nde diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su\r\nlongitud.', 50, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-128', 'Camelia japonica ejemplar', 5, '200-250', 6, 'Arbusto excepcional\r\npor su floración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de\r\ncada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos\r\n7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3\r\nde su longitud.', 50, '98.000000000000000000000000000000', '78.000000000000000000000000000000'),
('OR-129', 'Camelia japonica ejemplar', 5, '250-300', 6, 'Arbusto excepcional\r\npor su floración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de\r\ncada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos\r\n7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3\r\nde su longitud.', 50, '110.000000000000000000000000000000', '88.000000000000000000000000000000'),
('OR-130', 'Callistemom COPA', 5, '110/120', 6, 'Limpitatubos. arbolito de 6-7\r\nm de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..', 50, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('OR-131', 'Leptospermum formado PIRAMIDE', 5, '80-100', 6, '', 50, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('OR-132', 'Leptospermum COPA', 5, '110/120', 6, '', 50, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('OR-133', 'Nerium oleander-CALIDAD \"GARDEN\"', 5, '40-45', 6, '', 50, '2.000000000000000000000000000000', '1.000000000000000000000000000000'),
('OR-134', 'Nerium Oleander Arbusto GRANDE', 5, '160-200', 6, '', 100, '38.000000000000000000000000000000', '30.000000000000000000000000000000'),
('OR-135', 'Nerium oleander COPA Calibre 6/8', 5, '50-60', 6, '', 100, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-136', 'Nerium oleander ARBOL Calibre\r\n8/10', 5, '225-250', 6, '', 100, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('OR-137', 'ROSAL TREPADOR', 5, '', 6, '', 100, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-138', 'Camelia Blanco, Chrysler Rojo, Soraya Naranja,\r\n', 5, '', 6, '', 100, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-139', 'Landora Amarillo, Rose Gaujard bicolor\r\nblanco-rojo', 5, '', 6, '', 100, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-140', 'Kordes Perfect bicolor rojo-amarillo, Roundelay rojo\r\nfuerte', 5, '', 6, '', 100, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-141', 'Pitimini rojo', 5, '', 6, '', 100, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-142', 'Solanum Jazminoide', 5, '150-160', 6, '', 100, '2.000000000000000000000000000000', '1.000000000000000000000000000000'),
('OR-143', 'Wisteria Sinensis azul, rosa, blanca', 5, '', 6, '', 100, '9.000000000000000000000000000000', '7.000000000000000000000000000000'),
('OR-144', 'Wisteria Sinensis INJERTADAS DECÃ“', 5, '140-150', 6, '', 100, '12.000000000000000000000000000000', '9.000000000000000000000000000000'),
('OR-145', 'Bougamvillea Sanderiana Tutor', 5, '80-100', 6, '', 100, '2.000000000000000000000000000000', '1.000000000000000000000000000000'),
('OR-146', 'Bougamvillea Sanderiana Tutor', 5, '125-150', 6, '', 100, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-147', 'Bougamvillea Sanderiana Tutor', 5, '180-200', 6, '', 100, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-148', 'Bougamvillea Sanderiana Espaldera', 5, '45-50', 6, '', 100, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-149', 'Bougamvillea Sanderiana Espaldera', 5, '140-150', 6, '', 100, '17.000000000000000000000000000000', '13.000000000000000000000000000000'),
('OR-150', 'Bougamvillea roja, naranja', 5, '110-130', 6, '', 100, '2.000000000000000000000000000000', '1.000000000000000000000000000000'),
('OR-151', 'Bougamvillea Sanderiana, 3 tut. piramide', 5, '', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-152', 'Expositor Árboles clima continental', 5, '170-200', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-153', 'Expositor Árboles clima mediterráneo', 5, '170-200', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-154', 'Expositor Árboles borde del mar', 5, '170-200', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-155', 'Acer Negundo ', 5, '200-225', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-156', 'Acer platanoides ', 5, '200-225', 6, '', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-157', 'Acer Pseudoplatanus ', 5, '200-225', 6, '', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-158', 'Brachychiton Acerifolius ', 5, '200-225', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-159', 'Brachychiton Discolor ', 5, '200-225', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-160', 'Brachychiton Rupestris', 5, '170-200', 6, '', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-161', 'Cassia Corimbosa ', 5, '200-225', 6, '', 100, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-162', 'Cassia Corimbosa ', 5, '200-225', 6, '', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-163', 'Chitalpa Summer Bells ', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-164', 'Erytrina Kafra', 5, '170-180', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-165', 'Erytrina Kafra', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-166', 'Eucalyptus Citriodora ', 5, '170-200', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-167', 'Eucalyptus Ficifolia ', 5, '170-200', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-168', 'Eucalyptus Ficifolia ', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-169', 'Hibiscus Syriacus Var. Injertadas 1 Tallo\r\n', 5, '170-200', 6, '', 80, '12.000000000000000000000000000000', '9.000000000000000000000000000000'),
('OR-170', 'Lagunaria Patersonii ', 5, '140-150', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-171', 'Lagunaria Patersonii ', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-172', 'Lagunaria patersonii calibre 8/10', 5, '200-225', 6, '', 80, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('OR-173', 'Morus Alba ', 5, '200-225', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-174', 'Morus Alba calibre 8/10', 5, '200-225', 6, '', 80, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('OR-175', 'Platanus Acerifolia ', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-176', 'Prunus pisardii ', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-177', 'Robinia Pseudoacacia Casque Rouge\r\n', 5, '200-225', 6, '', 80, '15.000000000000000000000000000000', '12.000000000000000000000000000000'),
('OR-178', 'Salix Babylonica Pendula ', 5, '170-200', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-179', 'Sesbania Punicea ', 5, '170-200', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-180', 'Tamarix Ramosissima Pink Cascade\r\n', 5, '170-200', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-181', 'Tamarix Ramosissima Pink Cascade\r\n', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-182', 'Tecoma Stands ', 5, '200-225', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-183', 'Tecoma Stands ', 5, '200-225', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-184', 'Tipuana Tipu ', 5, '170-200', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-185', 'Pleioblastus distichus-Bambú enano', 5, '15-20', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-186', 'Sasa palmata ', 5, '20-30', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-187', 'Sasa palmata ', 5, '40-45', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-188', 'Sasa palmata ', 5, '50-60', 6, '', 80, '25.000000000000000000000000000000', '20.000000000000000000000000000000'),
('OR-189', 'Phylostachys aurea', 5, '180-200', 6, '', 80, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('OR-190', 'Phylostachys aurea', 5, '250-300', 6, '', 80, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('OR-191', 'Phylostachys Bambusa Spectabilis', 5, '180-200', 6, '', 80, '24.000000000000000000000000000000', '19.000000000000000000000000000000'),
('OR-192', 'Phylostachys biseti', 5, '160-170', 6, '', 80, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('OR-193', 'Phylostachys biseti', 5, '160-180', 6, '', 80, '20.000000000000000000000000000000', '16.000000000000000000000000000000'),
('OR-194', 'Pseudosasa japonica (Metake)', 5, '225-250', 6, '', 80, '20.000000000000000000000000000000', '16.000000000000000000000000000000'),
('OR-195', 'Pseudosasa japonica (Metake) ', 5, '30-40', 6, '', 80, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-196', 'Cedrus Deodara ', 5, '80-100', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-197', 'Cedrus Deodara \"Feeling Blue\"\r\nNovedad', 5, 'rastrero', 6, '', 80, '12.000000000000000000000000000000', '9.000000000000000000000000000000'),
('OR-198', 'Juniperus chinensis \"Blue Alps\"', 5, '20-30', 6, '', 80, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-199', 'Juniperus Chinensis Stricta', 5, '20-30', 6, '', 80, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-200', 'Juniperus horizontalis Wiltonii', 5, '20-30', 6, '', 80, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-201', 'Juniperus squamata \"Blue Star\"', 5, '20-30', 6, '', 80, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-202', 'Juniperus x media Phitzeriana verde', 5, '20-30', 6, '', 80, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-203', 'Pinus Canariensis', 5, '80-100', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-204', 'Pinus Halepensis', 5, '160-180', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-205', 'Pinus Pinea -Pino Piñonero', 5, '70-80', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-206', 'Thuja Esmeralda ', 5, '80-100', 6, '', 80, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-207', 'Tuja Occidentalis Woodwardii', 5, '20-30', 6, '', 80, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-208', 'Tuja orientalis \"Aurea nana\"', 5, '20-30', 6, '', 80, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-209', 'Archontophoenix Cunninghamiana', 5, '80 - 100', 6, '', 80, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-210', 'Beucarnea Recurvata', 5, '130 - 150', 6, '', 2, '39.000000000000000000000000000000', '31.000000000000000000000000000000'),
('OR-211', 'Beucarnea Recurvata', 5, '180 - 200', 6, '', 5, '59.000000000000000000000000000000', '47.000000000000000000000000000000'),
('OR-212', 'Bismarckia Nobilis', 5, '200 - 220', 6, '', 4, '217.000000000000000000000000000000', '173.000000000000000000000000000000'),
('OR-213', 'Bismarckia Nobilis', 5, '240 - 260', 6, '', 4, '266.000000000000000000000000000000', '212.000000000000000000000000000000'),
('OR-214', 'Brahea Armata', 5, '45 - 60', 6, '', 0, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-215', 'Brahea Armata', 5, '120 - 140', 6, '', 100, '112.000000000000000000000000000000', '89.000000000000000000000000000000'),
('OR-216', 'Brahea Edulis', 5, '80 - 100', 6, '', 100, '19.000000000000000000000000000000', '15.000000000000000000000000000000'),
('OR-217', 'Brahea Edulis', 5, '140 - 160', 6, '', 100, '64.000000000000000000000000000000', '51.000000000000000000000000000000'),
('OR-218', 'Butia Capitata', 5, '70 - 90', 6, '', 100, '25.000000000000000000000000000000', '20.000000000000000000000000000000'),
('OR-219', 'Butia Capitata', 5, '90 - 110', 6, '', 100, '29.000000000000000000000000000000', '23.000000000000000000000000000000'),
('OR-220', 'Butia Capitata', 5, '90 - 120', 6, '', 100, '36.000000000000000000000000000000', '28.000000000000000000000000000000'),
('OR-221', 'Butia Capitata', 5, '85 - 105', 6, '', 100, '59.000000000000000000000000000000', '47.000000000000000000000000000000'),
('OR-222', 'Butia Capitata', 5, '130 - 150', 6, '', 100, '87.000000000000000000000000000000', '69.000000000000000000000000000000'),
('OR-223', 'Chamaerops Humilis', 5, '40 - 45', 6, '', 100, '4.000000000000000000000000000000', '3.000000000000000000000000000000'),
('OR-224', 'Chamaerops Humilis', 5, '50 - 60', 6, '', 100, '7.000000000000000000000000000000', '5.000000000000000000000000000000'),
('OR-225', 'Chamaerops Humilis', 5, '70 - 90', 6, '', 100, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-226', 'Chamaerops Humilis', 5, '115 - 130', 6, '', 100, '38.000000000000000000000000000000', '30.000000000000000000000000000000'),
('OR-227', 'Chamaerops Humilis', 5, '130 - 150', 6, '', 100, '64.000000000000000000000000000000', '51.000000000000000000000000000000'),
('OR-228', 'Chamaerops Humilis \"Cerifera\"', 5, '70 - 80', 6, '', 100, '32.000000000000000000000000000000', '25.000000000000000000000000000000'),
('OR-229', 'Chrysalidocarpus Lutescens -ARECA', 5, '130 -\r\n150', 6, '', 100, '22.000000000000000000000000000000', '17.000000000000000000000000000000'),
('OR-230', 'Cordyline Australis -DRACAENA', 5, '190 - 210', 6, '', 100, '38.000000000000000000000000000000', '30.000000000000000000000000000000'),
('OR-231', 'Cycas Revoluta', 5, '55 - 65', 6, '', 100, '15.000000000000000000000000000000', '12.000000000000000000000000000000'),
('OR-232', 'Cycas Revoluta', 5, '80 - 90', 6, '', 100, '34.000000000000000000000000000000', '27.000000000000000000000000000000'),
('OR-233', 'Dracaena Drago', 5, '60 - 70', 6, '', 1, '13.000000000000000000000000000000', '10.000000000000000000000000000000'),
('OR-234', 'Dracaena Drago', 5, '130 - 150', 6, '', 2, '64.000000000000000000000000000000', '51.000000000000000000000000000000'),
('OR-235', 'Dracaena Drago', 5, '150 - 175', 6, '', 2, '92.000000000000000000000000000000', '73.000000000000000000000000000000'),
('OR-236', 'Jubaea Chilensis', 5, '', 6, '', 100, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('OR-237', 'Livistonia Australis', 5, '100 - 125', 6, '', 50, '19.000000000000000000000000000000', '15.000000000000000000000000000000'),
('OR-238', 'Livistonia Decipiens', 5, '90 - 110', 6, '', 50, '19.000000000000000000000000000000', '15.000000000000000000000000000000'),
('OR-239', 'Livistonia Decipiens', 5, '180 - 200', 6, '', 50, '49.000000000000000000000000000000', '39.000000000000000000000000000000'),
('OR-240', 'Phoenix Canariensis', 5, '110 - 130', 6, '', 50, '6.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-241', 'Phoenix Canariensis', 5, '180 - 200', 6, '', 50, '19.000000000000000000000000000000', '15.000000000000000000000000000000'),
('OR-242', 'Rhaphis Excelsa', 5, '80 - 100', 6, '', 50, '21.000000000000000000000000000000', '16.000000000000000000000000000000'),
('OR-243', 'Rhaphis Humilis', 5, '150- 170', 6, '', 50, '64.000000000000000000000000000000', '51.000000000000000000000000000000'),
('OR-244', 'Sabal Minor', 5, '60 - 75', 6, '', 50, '11.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-245', 'Sabal Minor', 5, '120 - 140', 6, '', 50, '34.000000000000000000000000000000', '27.000000000000000000000000000000'),
('OR-246', 'Trachycarpus Fortunei', 5, '90 - 105', 6, '', 50, '18.000000000000000000000000000000', '14.000000000000000000000000000000'),
('OR-247', 'Trachycarpus Fortunei', 5, '250-300', 6, '', 2, '462.000000000000000000000000000000', '369.000000000000000000000000000000'),
('OR-248', 'Washingtonia Robusta', 5, '60 - 70', 6, '', 15, '3.000000000000000000000000000000', '2.000000000000000000000000000000'),
('OR-249', 'Washingtonia Robusta', 5, '130 - 150', 6, '', 15, '5.000000000000000000000000000000', '4.000000000000000000000000000000'),
('OR-250', 'Yucca Jewel', 5, '80 - 105', 6, '', 15, '10.000000000000000000000000000000', '8.000000000000000000000000000000'),
('OR-251', 'Zamia Furfuracaea', 5, '90 - 110', 6, '', 15, '168.000000000000000000000000000000', '134.000000000000000000000000000000'),
('OR-99', 'Mimosa DEALBATA Gaulois Astier ', 5, '200-225', 6, 'Acacia\r\ndealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo\r\nfrancés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje\r\npersistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de\r\n3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental.\r\nSus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes.\r\nFlorece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente\r\ncurvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto\r\nlongitudinalmente...', 100, '14.000000000000000000000000000000', '11.000000000000000000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refreshtoken`
--

CREATE TABLE `refreshtoken` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Token` varchar(50) DEFAULT NULL,
  `Expires` datetime(6) NOT NULL,
  `Created` datetime(6) NOT NULL,
  `Revoked` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id` int(11) NOT NULL,
  `rolName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `Id` int(11) NOT NULL,
  `StateName` varchar(50) NOT NULL,
  `CountryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`Id`, `StateName`, `CountryId`) VALUES
(1, '', 1),
(2, '', 4),
(3, 'Barcelona', 2),
(4, 'MA', 2),
(5, 'EMEA', 3),
(6, 'EMEA', 4),
(7, 'Madrid', 4),
(8, 'CA', 1),
(9, 'APAC', 5),
(10, 'Castilla-LaMancha', 2),
(11, 'Chiyoda-Ku', 6),
(12, 'Cataluña', 2),
(13, 'Canarias', 2),
(14, 'Miami', 1),
(15, 'Islas Canarias', 2),
(16, 'Cadiz', 2),
(17, 'Nueva Gales del Sur', 5),
(18, 'London', 3),
(19, 'Fuenlabrada', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `Id` int(11) NOT NULL,
  `NameStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`Id`, `NameStatus`) VALUES
(1, 'Entregado'),
(2, 'Rechazado'),
(3, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Fax` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`Id`, `Name`, `Phone`, `Fax`) VALUES
(1, 'HiperGarden Tools', '+1234567890', 'Fax1234567890'),
(2, 'Murcia Seasons', '+2345678901', 'Fax2345678901'),
(3, 'Frutales Talavera S.A', '+3456789012', 'Fax3456789012'),
(4, 'NaranjasValencianas.com', '+4567890123', 'Fax4567890123'),
(5, 'Melocotones de Cieza S.A.', '+5678901234', 'Fax5678901234'),
(6, 'Viveros EL OASIS', '+6789012345', 'Fax6789012345'),
(7, 'Jerte Distribuciones S.L.', '+57412441234', 'Fax5641241444'),
(8, 'Valencia Garden Service', '+51441491241', 'Fax5908172347');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`Id`, `username`, `email`, `password`) VALUES
(1, 'marcos13', 'marcos@gardening.es', 'Pas1'),
(2, 'ruben15', 'rlopez@gardening.es', 'Pas1'),
(3, 'alberto21', 'asoria@gardening.es', 'Pas1'),
(4, 'maria451', 'msolis@gardening.es', 'Pas1'),
(5, 'felipe541', 'frosas@gardening.es', 'Pas1'),
(6, 'cortiz845', 'cortiz@gardening.es', 'Pas1'),
(7, 'csoria54', 'csoria@gardening.es', 'Pas1'),
(8, 'mlopez654', 'mlopez@gardening.es', 'Pas1'),
(9, 'lcampoamor494', 'lcampoamor@gardening.es', 'Pas1'),
(10, 'hrodriguez651', 'hrodriguez@gardening.es', 'Pas1'),
(11, 'manu54', 'manu@gardening.es', 'Pas1'),
(12, 'jmmart75', 'jmmart@hotmail.es', 'Pas1'),
(13, 'dpalma64', 'dpalma@gardening.es', 'Pas1'),
(14, 'opalma15', 'opalma@gardening.es', 'Pas1'),
(15, 'ffignon78', 'ffignon@gardening.com', 'Pas1'),
(16, 'lnarvaez6512', 'lnarvaez@gardening.com', 'Pas1'),
(17, 'lserra21', 'lserra@gardening.com', 'Pas1'),
(18, 'mbolton30', 'mbolton@gardening.com', 'Pas1'),
(19, 'wssanchez5', 'wssanchez@gardening.com', 'Pas1'),
(20, 'hwashington156', 'hwashington@gardening.com', 'Pas1'),
(21, 'mpaxton51', 'mpaxton@gardening.com', 'Pas1'),
(22, 'lpaxton156', 'lpaxton@gardening.com', 'Pas1'),
(23, 'nnishikori', 'nnishikori@gardening.com', 'Pas1'),
(24, 'nriko14', 'nriko@gardening.com', 'Pas1'),
(25, 'tnomura156', 'tnomura@gardening.com', 'Pas1'),
(26, 'ajohnson4145', 'ajohnson@gardening.com', 'Pas1'),
(27, 'lwestfalls561', 'lwestfalls@gardening.com', 'Pas1'),
(28, 'jwalton44', 'jwalton@gardening.com', 'Pas1'),
(29, 'kfalmer61', 'kfalmer@gardening.com', 'Pas1'),
(30, 'jbellinelli561', 'jbellinelli@gardening.com', 'Pas1'),
(31, 'mkishi615', 'mkishi@gardening.com', 'Pas1'),
(32, 'daniel.g651', 'daniel.g@gardening.com', 'Pas1'),
(33, 'anne45', 'anne.w@gardening.com', 'Pas1'),
(34, 'link416', 'link.f@gardening.com', 'Pas1'),
(35, 'akane165', 'akane.t@gardening.com', 'Pas1'),
(36, 'antoni15', 'antonio.l@gardening.com', 'Pas1'),
(37, 'jose5487', 'jose.b@gardening.com', 'Pas1'),
(38, 'paco454', 'paco.l@gardening.com', 'Pas1'),
(39, 'guillermo416', 'guillermo.r@gardening.com', 'Pas1'),
(40, 'david156', 'david.s@gardening.com', 'Pas1'),
(41, 'jos4514', 'jose.t@gardening.com', 'Pas1'),
(42, 'antonio456', 'antonio.l@gardening.com', 'Pas1'),
(43, 'pedro5156', 'pedro.c@gardening.com', 'Pas1'),
(44, 'juan562', 'juan.r@gardening.com', 'Pas1'),
(45, 'javier45145', 'javier.v@gardening.com', 'Pas1'),
(46, 'maria562', 'maria.r@gardening.com', 'Pas1'),
(47, 'beatriz516', 'beatriz.f@gardening.com', 'Pas1'),
(48, 'victoria5616', 'victoria.c@gardening.com', 'Pas1'),
(49, 'luis156', 'luis.m@gardening.com', 'Pas1'),
(50, 'mario45156', 'mario.s@gardening.com', 'Pas1'),
(51, 'cristian562', 'cristian.r@gardening.com', 'Pas1'),
(52, 'francisco5616', 'francisco.c@gardening.com', 'Pas1'),
(53, 'maria45156', 'maria.s@gardening.com', 'Pas1'),
(54, 'federico6512', 'federico.g@gardening.com', 'Pas1'),
(55, 'tony156', 'tony.m@gardening.com', 'Pas1'),
(56, 'eva45156', 'eva.s@gardening.com', 'Pas1'),
(57, 'matias45156', 'matias.s@gardening.com', 'Pas1'),
(58, 'benito155', 'benito.l@gardening.com', 'Pas1'),
(59, 'joseluis45156', 'joseluis.s@gardening.com', 'Pas1'),
(60, 'sara156', 'sara.m@gardening.com', 'Pas1'),
(61, 'luis54', 'luis.j@gardening.com', 'Pas1'),
(62, 'francois5145', 'francois.t@gardening.com', 'Pas1'),
(63, 'pierre541', 'pierre.d@gardening.com', 'Pas1'),
(64, 'jacob54', 'jacob.j@gardening.com', 'Pas1'),
(65, 'antonio562', 'antonio.r@gardening.com', 'Pas1'),
(66, 'richard156', 'richard.m@gardening.com', 'Pas1'),
(67, 'justin45156', 'justin.s@gardening.com', 'Pas1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userrol`
--

CREATE TABLE `userrol` (
  `UsuarioId` int(11) NOT NULL,
  `RolId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20231120164531_UpdateDatabase', '7.0.10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Cities_StateId` (`StateId`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_clients_CodEmployee` (`CodEmployee`),
  ADD KEY `IX_clients_PersonId` (`PersonId`),
  ADD KEY `IX_clients_PostalCodeId` (`PostalCodeId`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Employees_OfficeCode` (`OfficeCode`),
  ADD KEY `IX_Employees_PersonId` (`PersonId`);

--
-- Indices de la tabla `methodpayments`
--
ALTER TABLE `methodpayments`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_offices_PostalCodeId` (`PostalCodeId`);

--
-- Indices de la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_orderdetails_OrderId` (`OrderId`),
  ADD KEY `IX_orderdetails_ProductCode` (`ProductCode`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_orders_ClientCode` (`ClientCode`),
  ADD KEY `IX_orders_StatusCode` (`StatusCode`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_payments_ClienteId` (`ClienteId`),
  ADD KEY `IX_payments_MethodId` (`MethodId`);

--
-- Indices de la tabla `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_persons_PersonTypeId` (`PersonTypeId`);

--
-- Indices de la tabla `persontypes`
--
ALTER TABLE `persontypes`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `postalcodes`
--
ALTER TABLE `postalcodes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_postalcodes_CityId` (`CityId`);

--
-- Indices de la tabla `productlines`
--
ALTER TABLE `productlines`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_products_IdSupplier` (`IdSupplier`),
  ADD KEY `IX_products_ProductLine` (`ProductLine`);

--
-- Indices de la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_RefreshToken_UserId` (`UserId`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_states_CountryId` (`CountryId`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `userrol`
--
ALTER TABLE `userrol`
  ADD PRIMARY KEY (`UsuarioId`,`RolId`),
  ADD KEY `IX_userRol_RolId` (`RolId`);

--
-- Indices de la tabla `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `methodpayments`
--
ALTER TABLE `methodpayments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `persons`
--
ALTER TABLE `persons`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `persontypes`
--
ALTER TABLE `persontypes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `postalcodes`
--
ALTER TABLE `postalcodes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `productlines`
--
ALTER TABLE `productlines`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `FK_Cities_states_StateId` FOREIGN KEY (`StateId`) REFERENCES `states` (`Id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `FK_clients_Employees_CodEmployee` FOREIGN KEY (`CodEmployee`) REFERENCES `employees` (`Id`),
  ADD CONSTRAINT `FK_clients_persons_PersonId` FOREIGN KEY (`PersonId`) REFERENCES `persons` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_clients_postalcodes_PostalCodeId` FOREIGN KEY (`PostalCodeId`) REFERENCES `postalcodes` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `FK_Employees_offices_OfficeCode` FOREIGN KEY (`OfficeCode`) REFERENCES `offices` (`Id`),
  ADD CONSTRAINT `FK_Employees_persons_PersonId` FOREIGN KEY (`PersonId`) REFERENCES `persons` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `offices`
--
ALTER TABLE `offices`
  ADD CONSTRAINT `FK_offices_postalcodes_PostalCodeId` FOREIGN KEY (`PostalCodeId`) REFERENCES `postalcodes` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK_orderdetails_orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`),
  ADD CONSTRAINT `FK_orderdetails_products_ProductCode` FOREIGN KEY (`ProductCode`) REFERENCES `products` (`Id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_clients_ClientCode` FOREIGN KEY (`ClientCode`) REFERENCES `clients` (`Id`),
  ADD CONSTRAINT `FK_orders_status_StatusCode` FOREIGN KEY (`StatusCode`) REFERENCES `status` (`Id`);

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK_payments_clients_ClienteId` FOREIGN KEY (`ClienteId`) REFERENCES `clients` (`Id`),
  ADD CONSTRAINT `FK_payments_methodpayments_MethodId` FOREIGN KEY (`MethodId`) REFERENCES `methodpayments` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `FK_persons_persontypes_PersonTypeId` FOREIGN KEY (`PersonTypeId`) REFERENCES `persontypes` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `postalcodes`
--
ALTER TABLE `postalcodes`
  ADD CONSTRAINT `FK_postalcodes_Cities_CityId` FOREIGN KEY (`CityId`) REFERENCES `cities` (`Id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_productlines_ProductLine` FOREIGN KEY (`ProductLine`) REFERENCES `productlines` (`Id`),
  ADD CONSTRAINT `FK_products_suppliers_IdSupplier` FOREIGN KEY (`IdSupplier`) REFERENCES `suppliers` (`Id`);

--
-- Filtros para la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
  ADD CONSTRAINT `FK_refreshtoken_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `FK_states_countries_CountryId` FOREIGN KEY (`CountryId`) REFERENCES `countries` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `userrol`
--
ALTER TABLE `userrol`
  ADD CONSTRAINT `FK_userRol_rol_RolId` FOREIGN KEY (`RolId`) REFERENCES `rol` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_userRol_user_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;
COMMIT;