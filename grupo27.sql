
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grupo27` DEFAULT CHARACTER SET UTF8MB4 ;
USE `grupo27`;

-- -----------------------------------------------------
-- Table `grupo27`.`gen`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `grupo27`.`gen` (
    `G_id_gen` VARCHAR(45) NOT NULL,
    `G_cromosoma` INT(2) NOT NULL,
    `G_nombre_gen` VARCHAR(45) NOT NULL,
    `G_posicion_gen` VARCHAR(45) NOT NULL,
    `G_descripcion_gen`VARCHAR(100) NOT NULL,
    PRIMARY KEY (G_id_gen)
)  ENGINE=INNODB;

INSERT INTO gen (G_id_gen, G_cromosoma, G_nombre_gen, G_posicion_gen, G_descripcion_gen)
VALUES 
('TP53', 17, 'Tumor Protein p53', '7668421', 'Guardián del genoma; esencial para regular el ciclo celular y prevenir tumores.'),
('BRCA1', 17, 'BRCA1 DNA Repair Associated', '43044295', 'Implicado en reparación de roturas de doble cadena del ADN y estabilidad genómica.'),
('APOE', 19, 'Apolipoprotein E', '44905791', 'Proteína clave en el metabolismo de lípidos y riesgo genético para el Alzheimer.'),
('INS', 11, 'Insulin', '2159779', 'Hormona pancreática fundamental para regular los niveles de glucosa en sangre.'),
('EGFR', 7, 'Epidermal Growth Factor Receptor', '55019017', 'Receptor de membrana que regula el crecimiento celular; implicado en varios cánceres.'),
('CFTR', 7, 'CF Transmembrane Cond. Regulator', '117465784', 'Canal de cloruro; sus mutaciones causan la fibrosis quística por transporte anómalo.'),
('ACE2', 23, 'Angiotensin Converting Enzyme 2', '15518103', 'Enzima de superficie celular que sirve como punto de entrada para el SARS-CoV-2.'),
('MTHFR', 1, 'Methylenetetrahydrofolate Reductase', '11785730', 'Enzima crítica para procesar folato (vitamina B9) y mantener niveles de homocisteína.'),
('TNF', 6, 'Tumor Necrosis Factor', '31575567', 'Citocina proinflamatoria que regula la respuesta inmune y la apoptosis celular.'),
('MYH7', 14, 'Myosin Heavy Chain 7', '23412739', 'Proteína motora del músculo cardíaco; vinculada a miocardiopatía hipertrófica.');

-- Gestión de errores: Ni La columna del nombre G_nombre_gen ni la descripción del gen G_descripcion_gen pueden ser NULL:
INSERT INTO gen (G_id_gen, G_cromosoma, G_posicion_gen)
VALUES ('ERROR1', 1, '100');

INSERT INTO gen (G_id_gen, G_cromosoma, G_nombre_gen, G_posicion_gen)
VALUES ('ERROR1', 1, 'Gen Fallido', '100');

CREATE TABLE IF NOT EXISTS `grupo27`.`variantes` (variantes
    v_nomenclatura_c VARCHAR(50) PRIMARY KEY NOT NULL,
    v_id_gen VARCHAR(15) NOT NULL  ,
    v_secuencia VARCHAR(6) NOT NULL,
    v_tipo_variante VARCHAR(10) NOT NULL,
    v_alelo_referencia VARCHAR(15) NOT NULL,
    v_alelo_mutado VARCHAR(6) NOT NULL,
    v_posicion_cromosomica VARCHAR(50) NOT NULL,
    FOREIGN KEY (`v_id_gen`) REFERENCES `grupo27`.`gen` (`G_id_gen`));

INSERT INTO Variantes (v_nomenclatura_c, v_id_gen, v_secuencia, v_tipo_variante, v_alelo_referencia, v_alelo_mutado, v_posicion_cromosomica)
VALUES 
('NM_000546.5:c.215C>G', 'TP53', '215', 'SNV', 'C', 'G', 'chr17:7673803'), 
('NM_007294.4:c.68_69del', 'BRCA1', '68-69', 'DEL', 'AG', '-', 'chr17:43045729'), 
('NM_000059.4:c.5946delT', 'APOE', '5946', 'DEL', 'T', '-', 'chr13:32356432'), 
('NM_004333.6:c.1799T>A', 'INS',  '1799', 'SNV', 'T', 'A', 'chr7:140453136'), 
('NM_005228.5:c.2573T>G', 'EGFR', '2573', 'SNV', 'T', 'G', 'chr7:55181378'), 
('NM_000314.8:c.1582G>A', 'CFTR','1582', 'SNV', 'G', 'A', 'chr10:87863126'), 
('NM_000518.5:c.20A>T', 'ACE2', '20', 'SNV', 'A', 'T', 'chr11:5227002'), 
('NM_000249.4:c.35delG', 'MTHFR', '35', 'DEL', 'G', '-', 'chr13:20189547'), 
('NM_001354689.2:c.5266dupC', 'TNF',  '5266', 'INS', '-', 'C', 'chr17:43070945'), 
('NM_000277.2:c.1222C>T', 'MYH7', '1222', 'SNV', 'C', 'T', 'chr12:102840062');

CREATE TABLE IF NOT EXISTS `paciente` (
    `P_DNI` VARCHAR(50) NOT NULL,
    `P_Nombre` VARCHAR(30) NOT NULL,
    `P_Edad` INT(2) NOT NULL,
    `P_Fecha_diag` DATE NOT NULL,
    `P_ID_variante` VARCHAR(5) NOT NULL,
    PRIMARY KEY (`P_DNI`)
) ENGINE=INNODB;

INSERT INTO `paciente` (`P_DNI`, `P_Nombre`, `P_Edad`, `P_Fecha_diag`, `P_ID_variante`)
VALUES
('99966699Y', 'Leovigildo de Biedma', 55, '2025-02-02', 'var1'),
('71007100H', 'Ambrosio Gómez', 62, '2025-03-03', 'var2'),
('09111250P', 'Eufrasio De la O', 49, '2026-01-08', 'var3'),
('30020011A', 'María Dolores de Barriga', 31, '2025-11-21', 'var4'),
('52525252V', 'Inés Esario', 45, '2025-12-11', 'var5'),
('11223344B', 'Aitor Menta', 21, '2025-09-07', 'var6'),
('22299194W', 'Alan Brito', 80, '2025-06-06', 'var7'),
('66611666B', 'Elba Lazo', 26, '2026-01-08', 'var8'),
('12141621C', 'Aniceto Espidiforo', 65, '2025-01-03', 'var9'),
('90977786H', 'Glácida sinclética', 49, '2025-05-11', 'var10');
