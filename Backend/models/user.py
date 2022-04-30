from sqlalchemy import Table, Column, ForeignKey
from sqlalchemy.sql.sqltypes import Integer, String,Text
from config.db import meta, engine

ataques = Table('ataque', meta, 
    Column('Nome', String(225), primary_key = True), 
    Column('Tipo_de_Ataque_Codigo', ForeignKey('tipo_de_ataque.Codigo')),
    Column('CVSS_CVE', String(10)),
    Column('Porta_Destino', Integer)

)

tipoAtaques = Table('tipo_de_Ataque', meta, 
    Column('Codigo', String(10), primary_key = True), 
    Column('Informacoes', String(255)),
    Column('Infra_ou_Web', String(1), nullable = False)
)

grupoH = Table('grupo_Hacker', meta, 
    Column('Sigla', String(5), primary_key = True), 
    Column('Nome', Text, nullable = False),
    Column('Continente_Sigla', ForeignKey('continente.Sigla')),
    Column('Risco', Integer),
    Column('Pais', Text)
)

continente = Table('continente', meta, 
    Column('Sigla', String(3), primary_key = True), 
    Column('Nome', Text, nullable = False),
    Column('Populacao_Total', Integer, nullable = False),
    Column('Tipo_de_Ataque_Codigo',ForeignKey('tipo_de_ataque.Codigo'))
)
meta.create_all(engine)