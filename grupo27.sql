
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
