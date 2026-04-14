CREATE EXTERNAL TABLE transacoes(
idade INT, 
sexo STRING, 
escolaridade STRING, 
curso STRING, 
universidade STRING, 
qta_produtos BIGINT, 
tipo_produto STRING, 
meses_inativo_12m INT, 
valor_transacoes_12m FLOAT)
ROW FORMAT SERDE ‘org.apache.hadoop.hive.serde2.OpenCSVSerde’
WITH SERDEPROPERTIES ('separatorChar' = ’ , ’ , ‘quoteChar’ = ‘ “ ‘, ‘escapeChar' = ‘\\’)
STORED AS TEXTFILE
LOCATION ‘s3://projeto-cris-ebac/‘