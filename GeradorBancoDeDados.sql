#DROP DATABASE projetofinalbd;
CREATE DATABASE IF NOT EXISTS projetofinalbd;
USE projetofinalbd;

create table Tipo_de_Ataque(
  Codigo VARCHAR(10) PRIMARY key,
  Informacoes VARCHAR(45),
  Infra_ou_Web VARCHAR(1) not null
);

create table Ataque(
  Nome VARCHAR(20) PRIMARY KEY,
  CVSS_CVE VARCHAR(10),
  Porta_Destino int,
  Tipo_de_Ataque_Codigo VARCHAR(10),
  FOREIGN KEY (Tipo_de_Ataque_Codigo) REFERENCES Tipo_de_Ataque(Codigo)
);

create table Continente(
  Sigla VARCHAR(3) PRIMARY KEY,
  Nome TEXT NOT null,
  Populacao_Total int not null,
  Tipo_de_Ataque_Codigo VARCHAR(20),
  FOREIGN KEY (Tipo_de_Ataque_Codigo) REFERENCES Tipo_de_Ataque(Codigo)
);
  
create table Pais_mais_Atacado(
  Sigla VARCHAR(5) PRIMARY key,
  Nome TEXT not null,
  Populacao_Total int not null,
  Populacao_com_Internet int not null,
  Ataques_Sofridos_p_Dia int,
  Continente_Sigla VARCHAR(3),
  FOREIGN KEY (Continente_Sigla) REFERENCES Continente(Sigla)
);

create table Pais_menos_Atacado(
  Sigla VARCHAR(5) PRIMARY key,
  Nome TEXT not null,
  Populacao_Total int not null,
  Populacao_com_Internet int not null,
  Ataques_Sofridos_p_Dia int,
  Continente_Sigla VARCHAR(3),
  FOREIGN KEY (Continente_Sigla) REFERENCES Continente(Sigla)
);

create table Pais_que_Mais_Ataca(
  Sigla VARCHAR(5) PRIMARY key,
  Nome TEXT not null,
  Alvo_Comum TEXT Not null,
  Populacao_Total int not null,
  Populacao_com_Internet int not null,
  Ataques_Realizados_p_Dia int,
  Continente_Sigla VARCHAR(3),
  FOREIGN KEY (Continente_Sigla) REFERENCES Continente(Sigla)
);

create table Grupo_Hacker(
  Sigla VARCHAR(5) PRIMARY key,
  Nome TEXT not null,
  Pais TEXT,
  Risco int not null,
  Continente_Sigla VARCHAR(3),
  FOREIGN KEY(Continente_Sigla) REFERENCES Continente(Sigla)
);

create table Ataque_Menos_Impactante(
  Nome varchar(60) PRIMARY KEY,
  Dia DATE,
  Informacoes VARCHAR(45),
  Impacto_Financeiro VARCHAR(15),
  Motivacao TEXT,
  Grupo_Hacker_Sigla VARCHAR(5),
  FOREIGN KEY(Grupo_hacker_Sigla) REFERENCES grupo_hacker(sigla),
  Grupo_Hacker_Continente_Sigla VARCHAR(3),
  FOREIGN KEY(Grupo_Hacker_Continente_Sigla) REFERENCES continente(sigla)
);

create table Ataque_Mais_Impactante(
  Nome varchar(60) PRIMARY KEY,
  Dia DATE,
  Informacoes VARCHAR(45),
  Impacto_Financeiro VARCHAR(15),
  Motivacao TEXT,
  Grupo_Hacker_Sigla VARCHAR(5),
  FOREIGN KEY(Grupo_hacker_Sigla) REFERENCES grupo_hacker(sigla),
  Grupo_Hacker_Continente_Sigla VARCHAR(3),
  FOREIGN KEY(Grupo_Hacker_Continente_Sigla) REFERENCES continente(sigla)
);

insert into tipo_de_ataque(codigo,informacoes,infra_ou_web) values('OWASP','Ataques por vetores Web',0);
insert into tipo_de_ataque(codigo,informacoes,infra_ou_web) values('DDoS','Ataques de negação',1);
insert into tipo_de_ataque(codigo,informacoes,infra_ou_web) values('AutoThreat','Ataques por módulos automatizados',2);

insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('UDP DNS Flood','7.5',53,'DDoS');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('ICMP Ping Flood','8.0',0,'DDoS');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('SYN Flood','7.6',65535,'DDoS');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Ping of Death','7.5',0,'DDoS');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Slowloris','7.5',80,'DDoS');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('NTP Amplification','5.0',123,'DDoS');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('HTTP Flood','10.0',80,'DDoS');

insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Binary Planting','6.5',65535,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('SQLInjection','7.5',3306,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Blind XPath Inject','7.5',65535,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Cross Site Scripting','8.5',80,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('HTTP Response Splitt','4.3',80,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('CSRF','8.3',80,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('WEB Service Amp','8.3',7.0,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Reverse Tabnabbing','4.3',80,'OWASP');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Session fixation','7.3',80,'OWASP');

insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('JAX-WS RCE','2012-5067',15200,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('Chrome72/73array.map','2019-5825',443,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('MacroVelocityTemplI','2019-3396',8080,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('ManageEng FileUpload','2014-5301',8383,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('WeblogicServer RCE','2017-3248',7001,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('NtUserMNDragOver','2019-0808',0,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('WorldWeav shell.exec','2009-2011',0,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('IBM Lotus ActiveBO','2012-2175',0,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('AttChildRemovFirefox','2013-1690',8080,'AutoThreat');
insert into ataque(nome,cvss_cve,porta_destino,tipo_de_ataque_codigo) values('AddTenantDip RCE','2020-16875',443,'AutoThreat');


insert into continente(sigla,nome,populacao_total,tipo_de_ataque_codigo) values('AME','Américas',1000000000,'AutoThreat');


INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('USA','Estados Unidos','Alemanha',329500000,286942362,936972016,'AME');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('CAN','Canada','Alemanha',38000000,29760764,47326367,'AME');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('BR','Brasil','Alemanha',212000000,139111185,25699138,'AME');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('MEX','México','Alemanha',128900000,44173551,4272288,'AME');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('COL','Colômbia','Reino Unido',50880000,22160055,3481544,'AME');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('CHI','Chile','Suíça',19012000,10482463,1435715,'AME');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('EQU','Equador','Costa Rica',13625069,5348765,2581020,'AME');

INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('USA','Estados Unidos',329500000,286942362,581771282,'AME');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('BR','Brasil',212000000,139111185,51745782,'AME');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('CAN','Canada',38000000,29760764,18842227,'AME');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('MEX','México',128900000,44173551,13541621,'AME');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('COL','Colômbia',50880000,22160055,12321710,'AME');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('CHI','Chile',19012000,10482463,2992307,'AME');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('PER','Peru',32970000,11287915,2904086,'AME');

INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('HON','Honduras',9905000,1503350,10010,'AME');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('NIC','Nicaraguá',6625000,773240,20447,'AME');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('VEN','Venezuela',28044000,12353883,21561,'AME');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('BOL','Bolívia',11067000,3517991,21848,'AME');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('GUA','Guatemala',16086000,2255845,48026,'AME');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('ARG','Argentina',45038000,23543412,171121,'AME');


insert into continente(sigla,nome,populacao_total,tipo_de_ataque_codigo) values('EU','Europa',746004000 ,'OWASP');


INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('ALE','Alemanha','Alemanha',83024000,68296919,362612780,'EU');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('UK','Reino Unido','Alemanha',67022000,54861245,246026931,'EU');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('POL','Polônia','Alemanha',37095000,24969935,64261370,'EU');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('SUE','Suécia','Alemanha',10035000,8557561,31281822,'EU');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('ESP','Espanha','Alemanha',47035000,35270948,20718225,'EU');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('IRL','Irlanda','Bélgica',4995000,3730402,10935335,'EU');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('TUR','Turquia','Alemanha',84034000,35990932,5291053,'EU');

INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('UK','Reino Unido',67022000,54861245,126431889,'EU');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('ESP','Espanha',47035000,35270948,26092669,'EU');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('NOR','Noruega',5379000,4471907,15554715,'EU');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('ALE','Alemanha',83024000,68296919,14049053,'EU');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('POL','Polônia',37095000,24969935,8440315,'EU');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('IRL','Irlanda',4995000,3730402,5159540,'EU');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('ITA','Itália',59055000,35531527,4813325,'EU');

INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('FIN','Finlândia',5531000,4789266,431993,'EU');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('LIT','Lituania',2795000,2397517,58333,'EU');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('TUR','Turquia',84034000,35990932,805312,'EU');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('EST','Estonia',1331000,1007020,62623,'EU');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('AUS','Austria',8917000,6657992,209804,'EU');


insert into continente(sigla,nome,populacao_total,tipo_de_ataque_codigo) values('AS','Asia',456100000,'DDoS');


INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('IND','India','Australia',1038000000,462124989,143587524,'AS');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('RUS','Russia','Alemanha',144100000,75926004,23343251,'AS');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('CHN','China','Alemanha',1402000000,721434547,20084947,'AS');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('JAP','Japão','Japão',125800000,100684474,13690351,'AS');
INSERT into pais_que_mais_ataca(sigla,nome,alvo_comum,populacao_total,populacao_com_internet,ataques_realizados_p_dia,continente_sigla) VALUES('THA','Tailândia','Singapura',69008000,17779139,14930097,'AS');

INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('RUS','Russia',144100000,75926004,1181605596,'AS');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('CHN','China',1402000000,721434547,23579870,'AS');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('IND','India',1038000000,462124989,9902138,'AS');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('CAM','Camboja',16072000,738641,3837921,'AS');
INSERT into pais_mais_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('FIL','Filipinas',109060000,37602976,3897742,'AS');

INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('MON','Mongolia',3278000,521520,75831,'AS');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('MAL','Malasia',32037000,19200408,58729,'AS');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('OMA','Omã',5107000,1854090,30121,'AS');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('JOR','Jordânia',10002000,2668644,18874,'AS');
INSERT into pais_menos_atacado(sigla,nome,populacao_total,populacao_com_internet,ataques_sofridos_p_dia,continente_sigla) VALUES('AZE','Azerbaijao',10011000,5145531,14252,'AS');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('ANON','Anonymous','Estados Unidos',8,'AME');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('4Chan raids','2003-05-10','Série de raids feitas em imageboards','Nenhum','Sem motivação','ANON','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Encyclopedia Dramatica','2004-12-10','Séries de raids feitas na wikipedia','Nenhum','Anti Censura','ANON','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque aos fóruns de tratamento de Epilepsia','2008-03-28','Ataque em massa a fóruns de epilepsia','Nenhum','Sem motivação','ANON','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Desligamento de blogs sobre HipHop','2008-06-22','Ataques DDoS em sites sobre HipHop','Nenhum','Retaliação','ANON','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Invasão do email de Sarah Palin','2008-07-16','Invasão da conta de email de Sarah Palin','Nenhum','Chantagem','ANON','AME');

INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Operation Sony','2011-04-02','Contra Sony, em forma de DDoS','110 Milhões','Retaliação','ANON','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Project Chanology','2008-01-14','Contra "Church of Scientology"','Imensurável','Anti censura','ANON','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Attack BA (Bank of America)','2011-03-05','Distribuindo emails de funcionários','Imensurável','Exposição','ANON','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Operation Westboro Baptist Church','2012-12-18','Ataque contra discurso de ódio e homofobia','Imensurável','Retaliação','ANON','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('HBGary','2011-02-05','Retalização contra mentira de HBGary','Imensurável','Retaliação','ANON','AME');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('LS','Lizard Squad','Estados Unidos',2,'AME');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('League of Legends DDoS','2014-08-18','DDoS realizados nos servidores da Riot Games','Nenhum','Sem motivação','LS','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Destiny DDoS','2014-08-23','DDoS contra os servidores rodando Destiny','Nenhum','Sem motivação','LS','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('DDoS contra XBOX Live','2014-12-01','DDoS contra XBOX Live - Erro 80151909','Nenhum','Sem motivação','LS','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque a Machinima','2014-12-02','DDoS nos servidores da Machinima','Nenhum','Sem motivação','LS','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Tor Sybil','2014-12-26','Ataque do tipo Sybil contra a rede tor','Nenhum','Espionagem','LS','AME');

INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('DDoS contra Coréia do Norte','2014-12-22','Contra Coréia do Norte 24 horas de duração','Imensurável','Sem motivação','LS','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('WEB HOHOHO','2014-12-25','DDoS contra PSN e XBOXLive','Imensurável','Retaliação','LS','AME');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('TM0N','TeaMp0isoN','Estados Unidos',0,'AME');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque contra a "English Defence League"','2010-10-20','Vazamento de users com patentes na liga','Nenhum','Sem motivação','TM0N','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento de dados do primeiro ministro','2011-06-20','Vazamento de dados do primeiro ministro','Nenhum','Retaliação','TM0N','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Exploit do Facebook','2011-01-13','Ataque contra o user Mark Zuckerberg','Nenhum','Espionagem','TM0N','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Operação "Censor This"','2012-08-10','Contra sites a favor da campanha de censura','Nenhum','Retaliação','TM0N','AME');

INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Leak governamental','2011-07-22','Extração e vazamento de dados sensíveis','Imensurável','Retaliação','TM0N','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Operação Robin Hood','2011-11-30','Roubo de 26000 cartões de Israel','Imensurável','Sem motivação','TM0N','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Operação R.E.T.A.L.I.A.C.A.O','2012-07-02','Ofensiva contra o MI6','Imensurável','Retaliação','TM0N','AME');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('SB','Shadow Brokers','Estados Unidos',10,'AME');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('TrickOrTreat','2016-10-31','Publicação de códigos fontes','Nenhum','Espionagem','SB','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Black Friday','2016-10-31','Publicação de ferramentas','Nenhum','Espionagem','SB','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Equation Group Cyber Weapons Auction - Invitation','2016-08-13','Ataque contra Pastebin','Nenhum','Sem motivação','SB','AME');

INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Dont Forget Your Base','2017-04-08','Extração e vazamento de dados da NSA','Imensurável','Espionagem','SB','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Lost in Translation','207-04-14','Vazamento de 0days','Imensurável','Retaliação','SB','AME');
INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Eternal Blue','2017-05-02','Payload proprietario anti windows','Imensurável','Retaliação','SB','AME');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('SH','Shiny Hunters','Estados Unidos',2,'AME');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento da Tokopedia','2020-05-02','Vazamento de 15 milhões de users','Nenhum','Sem Motivação','SH','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento da Wishbone','2020-05-23','Vazamento completo do banco de dados','Nenhum','Retaliação','SH','AME');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento NitroPDF','2021-01-05','Drop do banco de dados da empresa','Nenhum','Sem motivação','SH','AME');

INSERT into ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento da Microsoft','2020-05-29','Roubo de 500Gb de códigos','Imensurável','Espionagem','SH','AME');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('LZ','Lazarus group','Coréia do Norte',10,'AS');


INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Operação Troy','2009-07-04','Incidente com DDoS de alta escala','Imensurável','Retaliação','LZ','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('10 dias de Chuva','2013-03-20','DDoS contra Coréira do Sul','Imensurável','Retaliação','LZ','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento Sony','2014-11-24','Vazamento de contas de colaboradores','Imensurável','Espionagem','LZ','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Bangladesh heist','2016-02-20','Roubo de 1 bilhão da reserva','1 bilhão','Espionagem','LZ','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Wanna Cry','2017-05-12','Ransonware de 7 horas','Imensurável','Retaliação','LZ','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Att 2019','2019-07-15','ELECTRICFISH zeroday','49 milhões','Espionagem','LZ','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Farma-2020','2020-12-02','Phishing contra Pfizer','Imensurável','Espionagem','LZ','AS');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('FC','Fancy Bear','Rússia',10,'AS');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ameaças de morte para viúvas de guerra','2015-02-10','Ameaças contra viúvas americanas','Nenhum','Sem Motivação','FC','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('think tank','2019-02-22','Ataques contra "German Marshall founds"','Nenhum','Espionagem','FC','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('IAAF','2017-02-17','IAAF ataque para WADA','Nenhum','Espionagem','FC','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Root9B','2015-05-05','SpearPhishing contra bancos','Nenhum','Retaliação','FC','AS');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Alemães','2014-12-01','6 meses de ataques contra parlamento','Imensurável','Espionagem','FC','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Contra televisão francesa','2014-04-08','Ataque contra TV5Monde','5.6 milhões','Retaliação','FC','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Agência anti-Doping','2016-08-11','Ataque nas olimpiadas do rio 2016','Imensurável','Retaliação','FC','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('UCC artilharia','2016-01-20','Sistemas D-30 Howizer comprometidos','Imensurável','Retaliação','FC','AS');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('GSH','Ghost Squad Hackers','Israel',7,'AS');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Pichação do Governo da Etiópia','2016-01-15','Ataques contra sites da Etiopia','Nenhum','Retaliação','GSH','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('BLM','2016-11-03','Ataque contra o site do movimento','Nenhum','Retaliação','GSH','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Anti-Trump','2016-05-21','Ataque contra o site do ex-presidente','Nenhum','Retaliação','GSH','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('CNN x FOXN','2016-06-01','Ataque contra as emissoras','5 milhões','Retaliação','GSH','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Anti-KKK','2016-04-23','Ataque contra domínio LWKofKKK','Imensurável','Retaliação','GSH','AS');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Extração USA-A','2020-03-05','Extração de dados militares','Imensurável','Espionagem','GSH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ofensiva contra ISIS','2019-02-12','Exposição dos membros do ISIS','Imensurável','Espionagem','GSH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento DP','2020-07-03','Ataque contra VERMONT DP','Nenhum','Retaliação','GSH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Contra IDAHO','2017-07-20','Ataques contra sites de Idaho','Imensurável','Retaliação','GSH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Contra ESA','2020-07-15','Ataques contra sites da companhia','Imensurável','Nenhum','GSH','AS');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('HU','Honker Union','China',5,'AS');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataques contra Iran','2010-06-15','Ataques contra sites iranianos','Nenhum','Retaliação','HU','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataques contra Filipinas','2010-11-02','Ataque contra governo filipino','Nenhum','Retaliação','HU','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Tsering Woeser','2008-05-03','Ofensiva atraves do Skype','Nenhum','Espionagem','HU','AS');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Hacker War - Filipinas','2014-04-14','Guerra hacker travada por SSS','Imensurável','Retaliação','HU','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataques contra sites Japoneses','2012-07-24','Ataque contra compra de SENKAKU','Imensurável','Retaliação','HU','AS');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('RH','RedHack','Turquia',8,'AS');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT 2202','2012-02-22','Exploração de mais de 350 sites policiais','Nenhum','Espionagem','RH','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Retaliação contra ministro Turco','2012-04-22','Ataque contra site do Ministro','Nenhum','Retaliação','RH','AS');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('DDoS ISP','2012-04-27','DDoS contra ISP TTNET turca','Nenhum','Retaliação','RH','AS');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT 0206','2010-07-02','Exploração de mais de 256 sites','Imensurável','Retaliação','RH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT 02062','2011-07-02','Ataque contra Adnan Oktar','Imensurável','Retaliação','RH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Guerra contra guerra de Istanbul','2013-05-05','Ofensiva contra governo','Nenhum','Retaliação','RH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Tributo Ethem Sarisuluk','2013-06-12','Ofensiva contra sites policiais','Imensurável','Retaliação','RH','AS');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT contra Ministro de COMM','2014-03-28','Ataque contra site de COMM turca','Imensurável','Retaliação','RH','AS');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('CB','Cozy Bear','Rússia',8,'EU');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque aos ministros Holandeses','2017-02-19','Multiplas tentativas de ataque','Nenhum','Chantagem','CB','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Extraçao de info sobre vacina','2020-07-05','Multiplas tentativas de ataque','Nenhum','Espionagem','CB','EU');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Macacos de escritorio','2014-03-01','Ataque contra mercado privado','Nenhum','Chantagem','CB','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque ao pentagono','2015-08-05','Ataque contra pentagono americano','Nenhum','Espionagem','CB','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque ao comite democratico nacional','2016-06-03','Extração de documentos','Imensurável','Espionagem','CB','EU');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('TT','Tesla Team','Rússia',5,'EU');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Pichacao de 100 sites','2013-12-14','Ataque realizado contra mais de 100 sites','Nenhum','Sem motivação','TT','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Pichacao Librazhd','2013-12-14','Ataque contra site do governo','Nenhum','Sem motivação','TT','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT Universidade de Osijek','2013-02-20','Ataque ao banco de dados completo','Mínimo','Sem motivação','TT','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT Bulgária e Albânia','2013-12-29','DDoS de 24 horas','Mínimo','Sem motivação','TT','EU');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento de dados do ministro da Economia','2012-11-07','Vazamento de todos os dados','Nenhum','Chantagem','TT','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque a BD VEVO','2013-11-13','Invasão do BD da VEVO','Nenhum','Chantagem','TT','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT Universidade de Cambridge','2013-11-29','Busca e extração de dados','Mínimo','Espionagem','TT','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT Corte Bosnia e Herzegovina','2013-12-03','Invasão de BD','Imensurável','Chantagem','TT','EU');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('DS','DarkSide','Rússia',10,'EU');


INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ransonware as a service','2020-10-10','Ataque contra petrolifera','2 milhões','Retaliação','DS','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('CompuCom ATT','2021-03-15','Ataque contra companhia','20 milhões','Sem motivação','DS','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Elliptic Report','2021-03-28','Roubo de bitcoins','17.5 milhões','Chantagem','DS','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Tubulação colonial','2021-07-07','Inject RCE em sistema','+5 milhões','Chantagem','DS','EU');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('CK','CyberBerkut','Alemanha',8,'EU');

INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Ataque aos sites da NATO','2015-05-02','Ataques aos sites','Nenhum','Retaliação','CB','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('ATT chanceler alemao','2019-01-04','Invasão as contas','Nenhum','Espionagem','CB','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Bloqueio do ministro de R.I','2014-07-29','DDoS no site','Nenhum','Sem motivação','CB','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Publ YT VDD','2014-08-05','Postagem dos vídeos','Nenhum','Sem motivação','CB','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Exposed Konstantin Grishin','2014-06-08','Exposição do nome','Nenhum','Chantagem','CB','EU');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Exposed de desertores ucranianos','2014-03-15','Exposição dos nomes','Imensurável','Retaliação','CB','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Exposed Ihor Kolomoyskyi','2021-10-03','Exposição das conversas pessoais','Imensurável','Retaliação','CB','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Exposed Arsen Avakov','2021-02-15','Vazamento de conversas de gabinete','Imensurável','Chantagem','CB','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Semi destruição de comissao ucraniana','2014-07-15','Ataque contra sistema de votacoes','Imensurável','Retaliacao','CB','EU');


INSERT into grupo_hacker(sigla,nome,pais,risco,continente_sigla) VALUES('NC','NullCrew','Alemanha',8,'EU');


INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento Comcast','2014-02-05','Vazamento de senhas de 34 servidores','Nenhum','Chantagem','NC','EU');
INSERT INTO ataque_menos_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Cavaleiros do lulz','2014-04-02','Ataque aos servidores AlArabiya','Mínimo','Sem motivação','NC','EU');

INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento OMS','2012-07-13','Exposição de 591 creds','Imensurável','Chantagem','NC','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento ASUS','2012-07-16','Vazamento de 23 creds de admin','Imensurável','Espionagem','NC','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Pilhagem Servers Cambodia','2012-09-11','Pilhagem de BD da cambodia','Imensurável','Retaliação','NC','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('FuckTheSystem','2012-08-28','Ataques contra departamentos de infra','Imensurável','Retaliação','NC','EU');
INSERT INTO ataque_mais_impactante(nome,dia,informacoes,impacto_financeiro,motivacao,grupo_hacker_sigla,grupo_hacker_continente_sigla) VALUES('Vazamento de servidores','2012-10-27','Vazamento de dados','Imensurável','Retaliação','NC','EU');

select * from ataque;
#Criacao da view que exibe todo os ataques DDoS realizados
CREATE VIEW ataque_DDoS AS
	SELECT * FROM ataque
	WHERE ataque.Tipo_de_Ataque_Codigo = "DDoS";
#Chamda da View
SELECT * FROM ataque_DDoS;


DELIMITER $$
CREATE PROCEDURE ataque_mais_Impactante_Intervalo(IN data_inicial DATE, IN data_final DATE)
BEGIN
	SELECT * FROM Ataque_Mais_Impactante
	WHERE Ataque_Mais_Impactante.dia >= data_inicial
		AND Ataque_Mais_Impactante.dia <= data_final;
END $$
DELIMITER ;


call ataque_mais_Impactante_Intervalo("2015-01-01", "2021-01-01");
